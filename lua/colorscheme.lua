---@diagnostic disable: undefined-global
local g = vim.g
local opt = vim.opt

opt.background = 'dark'

g.nord_cursor_line_number_background = true
g.nord_bold = true
g.nord_italic = true
g.nord_italic_comments = true
g.nord_underline_style = true

local ok, _ = pcall(vim.cmd, 'colorscheme nord')
if not ok then
	print('it was not possible to load the colorscheme')
	return
end
