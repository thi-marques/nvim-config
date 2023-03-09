---@diagnostic disable: undefined-global
local commands_group = vim.api.nvim_create_augroup("CustomCommands", { clear = true })
local autocmd = function (event, options)
  options = options == nil and {} or options
	options.group = options.group == nil and commands_group or options.group

  vim.api.nvim_create_autocmd(event, options)
end

-- Highlight the region on yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end
})

-- Insert mode when create new file
autocmd("BufNewFile", {
	command = 'startinsert | :move .-1'
})

-- Set autoread when a file is changed from the outside
vim.opt.autoread = true
autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	command = 'checktime'
})

-- Auto reload configs on save
autocmd("BufWritePost", {
	pattern = { 'autocommands.lua', 'colorscheme.lua', 'keybinds.lua', 'options.lua' },
	command = 'source <afile>'
})

-- Auto reload plugins on save
autocmd("BufWritePost", {
	pattern = 'plugins.lua',
	command = 'source <afile> | CocUpdateSync | PackerSync '
})

-- Prevent Markdown for complain about underscores
autocmd("BufRead", {
	pattern = { "*.md", "*.markdown" },
	command = [[ hi link markdownError NONE ]]
})
