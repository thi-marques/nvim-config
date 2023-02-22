---@diagnostic disable: undefined-global
local commands_group = vim.api.nvim_create_augroup("CustomCommands", { clear = true })

-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = commands_group,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end
})

-- Insert mode when create new file
vim.api.nvim_create_autocmd("BufNewFile", {
	group = commands_group,
	command = 'startinsert | :move .-1'
})

-- Set autoread when a file is changed from the outside
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	group = commands_group,
	command = 'checktime'
})

-- Auto reload configs on save
vim.api.nvim_create_autocmd("BufWritePost", {
	group = commands_group,
	pattern = { 'autocommands.lua', 'colorscheme.lua', 'keybinds.lua', 'options.lua' },
	command = 'source <afile>'
})

-- Auto reload plugins on save
vim.api.nvim_create_autocmd("BufWritePost", {
	group = commands_group,
	pattern = 'plugins.lua',
	command = 'source <afile> | CocUpdateSync | PackerSync '
})
