---@diagnostic disable: undefined-global
local keybinds_ok, keyset = pcall(require, 'keybinds')
if not keybinds_ok then
	print('keybinds not found')
	return
end

vim.g.NERDTreeWinPos = "right"
vim.g.NERDTreeMapActivateNode = "l"
vim.g.NERDTreeMapCloseDir = "h"

keyset('n', '<Leader>n', ':NERDTreeToggle<Return>', { silent = true })
-- keyset('n', '<C-B>', ':NERDTreeToggle<Return>', { silent = true })
