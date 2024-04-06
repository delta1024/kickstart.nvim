-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.opt.rtp:prepend("~/Code/lua/dotman.nvim/")
return {
	{
		-- Theme inspired by Atom
		'rose-pine/neovim',
		name = 'rose-pine',
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'rose-pine'
			vim.api.nvim_set_hl(0,"NormalFloat", { bg = "none" })
		end,
	},
	'tribela/vim-transparent',
	'nvim-lua/plenary.nvim',
	{

		"kwakzalver/duckytype.nvim",
		--  config  = function ()
		--    local opts = ""
		--   vim.keymap.set('n', '<leader>y', function ()
		--    vim.cmd "Duckytype"
		--   end)
		--  end,
		opts = {},

	},
}
