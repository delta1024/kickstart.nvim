-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local function setUpLuaSnip()
  local ls = require 'luasnip'

  local s = ls.snippet
  local t = ls.text_node
  local i = ls.insert_node

  ls.add_snippets('go', {
    s('ifr', {
      t 'if ',
      i(1, 'err'),
      t { ' != nil {', '\t' },
      t 'return ',
      i(0, 'err'),
      t { '\t', '}' },
    }),
  })
  ls.add_snippets('go', {
    s('ifrn', {
      t { 'if err != nil {', '\t' },
      t 'return ',
      i(0, 'nil'),
      t { ', err', '}' },
    }),
  })
  ls.add_snippets('go', {
    s('ifrr', {
      t 'if err := ',
      i(1, ''),
      t { '; err != nil {', '\treturn ' },
      i(0, 'err'),
      t { ' ', '}' },
    }),
  })
  ls.add_snippets('c', {
    s('iwyu', {
      t { '// IWYU pragma: ' },
      i(0, ''),
    }),
  })
  ls.add_snippets('cpp', {
    s('iwyu', {
      t { '// IWYU pragma: ' },
      i(0, ''),
    }),
  })
end
return {
  dir = '.',
  init = function()
    vim.g.shiftwidth = 4
    vim.g.tabstop = 4
    vim.g.expandtab = true
    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = 'Open [G]it [S]tatus' })
    vim.keymap.set('n', '<leader>.', ':Ex<CR>', { desc = 'Open current buffer' })
    setUpLuaSnip()
    vim.filetype.add {
      pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang' },
    }
  end,
}
