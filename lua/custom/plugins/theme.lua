return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  name = 'kanagawa',
  init = function()
    require('kanagawa').setup {
      transparent = true,
      compile = true,
    }
    vim.cmd.colorscheme 'kanagawa'
  end,
}
