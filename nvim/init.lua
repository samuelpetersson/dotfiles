require'colors'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.mouse = 'v'
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.cmdheight = 0
vim.opt.signcolumn = 'yes'
vim.opt.fillchars='eob: '
vim.g.loaded_matchparen = 1

vim.keymap.set('n', 'q', ':q<CR>')
vim.keymap.set('n', 's', ':w <CR>')
vim.keymap.set('n', 'S', ':FZF <CR>')
vim.keymap.set('n', '<tab>', ':NvimTreeFindFile<CR>')
vim.keymap.set('n', '<space>', ':')
vim.keymap.set('n', '<s-tab>', ':bp<CR>')

vim.api.nvim_create_user_command('Diagnostic', vim.diagnostic.setqflist, {})

vim.diagnostic.config({ 
  virtual_text = false, 
  signs = true,
  underline = true, 
  update_in_insert = false, 
  severity_sort = true, 
})

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

	{'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function() 
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { 
          'bash',
          'c',
          'css',
          'scss',
          'go',
          'html',
          'javascript', 
          'typescript', 
          'tsx',
          'vue',
          'jsdoc',
          'json',
          'yaml',
          'kotlin',
          'lua',
          'markdown',
          'swift'
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        }
      }
    end
  },

  
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      {'neovim/nvim-lspconfig'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr}

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'R', vim.lsp.buf.rename, opts)

        vim.keymap.set('n', 'KK', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'KD', vim.diagnostic.open_float)


        vim.keymap.set('n', '=', function() vim.lsp.buf.format { async = true } end, opts)
        vim.keymap.set('n', '!', function() vim.lsp.buf.code_action() end, opts)
      end)

      require('lspconfig').volar.setup{}

      require('lspconfig').tsserver.setup({
        commands = {
          OrganizeImports = {
            function() 
              vim.lsp.buf.execute_command({
                command = '_typescript.organizeImports',
                arguments = {vim.api.nvim_buf_get_name(0)},
              })
            end
          }
        }
      })

    end
  },

  {
    'hrsh7th/nvim-cmp',	
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'}
    }
  },

  { 
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup { }
      vim.keymap.set('n', 'KH', gitsigns.preview_hunk)
    end
  },


  {'junegunn/fzf'},

  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    config = function()
      require("nvim-tree").setup {
        on_attach = function(bufnr)
          local api = require('nvim-tree.api')
          local opts = {buffer = bufnr}

          vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts)
          vim.keymap.set('n', 'l', api.node.open.edit, opts)
          vim.keymap.set('n', 'i', api.node.open.preview, opts)

          vim.keymap.set('n', 'c', api.fs.create, opts)
          vim.keymap.set('n', 'r', api.fs.rename, opts)
          vim.keymap.set('n', 'dd', api.fs.remove, opts)
          vim.keymap.set('n', 'y', api.fs.copy.node, opts)
          vim.keymap.set('n', 'p', api.fs.paste, opts)

        end,
        view = {
          cursorline = false,
          width = 40
        },
        ui = {
          confirm = {
            remove = false
          },
        },
        actions = {
          open_file = {
            quit_on_open = true
          }
        },
        filters = {
          git_ignored = false
        },
        renderer = {
          root_folder_label = false,
          icons = {
            git_placement = "signcolumn",
            show = {
              file = false,
              folder = false,
            }
          }
        }
      }
    end
  }

})

