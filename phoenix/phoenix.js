Phoenix.set({
	  daemon: true,
	  openAtLogin: true
});

var mod = ['alt'];
var cols = 6;
var rows = 6;
var spacing = 10;
var padding = 5;

var keys = [];
var status = Modal.build({weight:18, appearance:"light"});

function log() {
		Phoenix.log.apply(Phoenix, arguments);
}

function clear() {
		keys.forEach(function(id) {
					Key.off(id);
				});
		keys.length = 0;
}

function updateStatus(text) {
		if(text) {
					status.text = text;
				}
		var window = Window.focused();
		if(window) {
					var frame = window.frame();
					var screen = Screen.main().flippedVisibleFrame();
					status.origin = {x: frame.x + frame.width * 0.5, y: screen.height - frame.y - frame.height * 0.5};

				}
		status.show();
}

function hideStatus() {
		status.close();
}

function on(mod, key, cb) {
		keys.push(Key.on(key, mod || [], cb));
}

function modeDefault() {
		clear();
		hideStatus();
		on(["alt"], "f", modeLayout);
		on(["ctrl", "shift"], "h", function() { shiftToSpace(-1); });
		on(["ctrl", "shift"], "l", function() { shiftToSpace(1); });
		on(["alt"], "h", function() { moveFocus("west"); });
		on(["alt"], "j", function() { moveFocus("south"); });
		on(["alt"], "k", function() { moveFocus("north"); });
		on(["alt"], "l", function() { moveFocus("east"); });
}

function shiftToSpace(offset) {
		var spaces = Space.all();
		var active = Space.active();
		var activeHash = active.hash();

		var index = _.findIndex(spaces, function(s) { return s.hash() == activeHash; });
		var nextIndex = index + offset;

		if(nextIndex > -1 && nextIndex < spaces.length) {
					moveToSpace(nextIndex);
				}
}

function moveToSpace(spaceIndex) {
		var window = Window.focused();
		if(!window) { return; }

		_.each(window.spaces(), function(s) {
					s.removeWindows([window]);
				});

		Space.all()[spaceIndex].addWindows([window]);

		window.focus();
}

function moveFocus(direction) {
	  var window = Window.focused();
		if(!window) { return; }
		var neighbours = window.neighbours(direction);
		_.remove(neighbours, function(w) { return !w.isVisible(); });

		if(neighbours.length > 0) {
					neighbours[0].focus();
				}
}

function modeLayout() {
		clear();
		updateStatus("Layout");
		grid(0, 0, 0, 0);
		on(null, "escape", modeDefault);
		on(["alt"], "f", modeDefault);
		on(null, "h", function() { grid(-1, 0, 0, 0); });
		on(null, "j", function() { grid(0, 1, 0, 0); });
		on(null, "k", function() { grid(0, -1, 0, 0); });
		on(null, "l", function() { grid(1, 0, 0, 0); });
		on(["shift"], "h", function() { grid(0, 0, -1, 0); });
		on(["shift"], "j", function() { grid(0, 0, 0, 1); });
		on(["shift"], "k", function() { grid(0, 0, 0, -1); });
		on(["shift"], "l", function() { grid(0, 0, 1, 0); });
}

function grid(x, y, w, h) {
		var screen = Screen.main().flippedVisibleFrame();
	  var window = Window.focused();
		if(!window) { return; }
		var wf = window.frame();

		var gx = Math.max(0, Math.round((wf.x / screen.width) * cols) + x);
		var gy = Math.max(0, Math.round((wf.y / screen.height) * rows) + y);
		var gw = Math.max(1, Math.round((wf.width / screen.width) * cols) + w);
		var gh = Math.max(1, Math.round((wf.height / screen.height) * rows) + h);

		var inset = spacing * 0.5;

		var innerX = screen.x + padding - inset;
		var innerY = screen.y + padding - inset;
		var innerW = screen.width - padding * 2 + spacing;
		var innerH = screen.height - padding * 2 + spacing;

		window.setFrame({
					x: innerX + inset + (gx / cols) * innerW,
					y: innerY + inset + (gy / rows) * innerH,
					width: (gw / cols * innerW) - inset * 2,
					height: (gh / rows * innerH) - inset * 2
				});

		updateStatus();
}


modeDefault();
