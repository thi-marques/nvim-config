---@diagnostic disable: undefined-global
local ok, highlight_colors = pcall(require, "nvim-highlight-colors")
if not ok then
	print("nvim-highlight_colors not found")
	return
end

vim.opt.termguicolors = true

-- termguicolors removes background transparency, the commands below fix it
vim.cmd([[
	hi! Normal ctermbg=NONE guibg=NONE
	hi! NonText ctermbg=NONE guibg=NONE
]])

highlight_colors.setup({
	render = 'background', -- or 'foreground' or 'first_column'
	enable_named_colors = true,
	enable_tailwind = true
})
