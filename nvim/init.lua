require 'colors'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.termguicolors = false
vim.opt.signcolumn = 'yes'
vim.opt.fillchars = 'eob: '

vim.keymap.set('n', 's', ':w<cr>')
vim.keymap.set('n', 'S', ':FZF<cr>')
vim.keymap.set('n', ' ', ':')
vim.keymap.set('n', '+', ':NvimTreeFindFileToggle<cr>')
vim.keymap.set('n', '-', '<c-w>q')

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

  { 'junegunn/fzf' },

  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        highlight = { enable = true }
      }
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig').lua_ls.setup({})
      require('lspconfig').ts_ls.setup({
        capabilities = capabilities
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local opt = { buffer = event.buf }
          vim.keymap.set('n', '<cr>', vim.lsp.buf.rename, opt)
          vim.keymap.set('n', '=', vim.lsp.buf.format, opt)
          vim.keymap.set('n', '!', vim.lsp.buf.code_action, opt)
        end
      })
    end
  },

  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<c-space>'] = cmp.mapping.complete(),
          ['<cr>'] = cmp.mapping.confirm({ select = true }),
          ['<tab>'] = function()
            if cmp.visible() then
              cmp.select_next_item()
            end
          end,
          ['<s-tab>'] = function()
            if cmp.visible() then
              cmp.select_prev_item()
            end
          end
        })
      })
    end
  },

  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    config = function()
      require("nvim-tree").setup {
        on_attach = function(bufnr)
          local api = require('nvim-tree.api')
          local opt = { buffer = bufnr }

          vim.keymap.set('n', 'h', api.node.navigate.parent_close, opt)
          vim.keymap.set('n', 'l', api.node.open.edit, opt)
          vim.keymap.set('n', 'i', api.node.open.preview, opt)

          vim.keymap.set('n', 'g', api.tree.toggle_git_clean_filter, opt)

          vim.keymap.set('n', 'a', api.fs.create, opt)
          vim.keymap.set('n', '<cr>', api.fs.rename, opt)
          vim.keymap.set('n', 'dd', api.fs.remove, opt)
          vim.keymap.set('n', 'x', api.fs.cut, opt)
          vim.keymap.set('n', 'y', api.fs.copy.node, opt)
          vim.keymap.set('n', 'p', api.fs.paste, opt)
        end,
        view = {
          cursorline = false,
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
            show = { file = false, folder = false }
          }
        }
      }
    end
  }

})
