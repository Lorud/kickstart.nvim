vim.pack.add({
	"https://github.com/RRethy/base16-nvim",
--	"https://github.com/InioX/matugen-themes/tree/main/templates/neovim"
})

pcall(function() require('custom.matugen').setup() end)
-- vim.cmd.colorscheme 'base16-gruvbox-dark-medium'

