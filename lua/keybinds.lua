---@diagnostic disable: undefined-global

--- Map keys to nvim's commands and shortcuts.
---@param mode "" | "n" | "v" | "s" | "x" | "o" | "!" | "i" | "l" | "c" | "t" As in Vim modes like Normal/Insert mode
---@param lhs string The custom keybinds you need
---@param rhs any The commands or existing keybinds to customise
---@param opts table? Additional options like <silent>/<noremap>, see :h map-arguments for more info on it
local function keyset(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- Back to normal
keyset('i', 'jk', '<ESC>')

-- Clear searches highlights
keyset('n', '<Leader><ESC>', ':nohl<Return>')

-- Don't copy deleted character
keyset('n', 'x', '"_x')

-- Increment/decrement
keyset('n', '+', '<C-a>')
keyset('n', '-', '<C-x>')

-- Select all
keyset('n', '<C-a>', 'gg<S-v>G')
-- Copy to system clipboard
keyset('v', '<Leader>y', '"+y')
keyset('n', '<Leader>y', '"+y')

-- New tab
-- keyset('n', 'te', ':tabedit<Return>', { silent = true })

-- Split navigation
keyset('n', '<M-S>', ':split<Return><C-w>w', { silent = true })
keyset('n', '<M-s>', ':vsplit<Return><C-w>w', { silent = true })

-- Document navigation
keyset('n', '<C-j>', '<C-f>')
keyset('n', '<C-k>', '<C-b>')

-- Lines copy/move
keyset('n', '<M-k>', ':move .-2<Return>==')
keyset('n', '<M-K>', ':copy .1<Return>==')
keyset('n', '<M-j>', ':move .+1<Return>==')
keyset('n', '<M-J>', ':copy .+0<Return>==')
keyset('i', '<M-k>', '<Esc>:move .-2<Return>==gi')
keyset('i', '<M-K>', '<Esc>:copy .0<Return>==gi')
keyset('i', '<M-j>', '<Esc>:move .+1<Return>==gi')
keyset('i', '<M-J>', '<Esc>:copy .-1<Return>==gi')
keyset('v', '<M-k>', ":move '<-2<Return>gv=gv")
keyset('v', '<M-K>', ":copy '>0<Return>gv=gv")
keyset('v', '<M-j>', ":move '>+1<Return>gv=gv")
keyset('v', '<M-J>', ":copy '<-1<Return>gv=gv")

-- Indentation
keyset('n', '<Tab>', '>>')
keyset('n', '<S-Tab>', '<<')
keyset('v', '<Tab>', '>gv')
keyset('v', '<S-Tab>', '<gv')

-- Close and save
keyset('n', '<C-q>', ':q<Return>', { noremap = false, silent = true })
keyset('n', '<C-s>', ':w<Return>', { silent = true })
keyset('i', '<C-q>', '<ESC>:q<Return>', { noremap = false, silent = true })
keyset('i', '<C-s>', '<ESC>:w<Return>', { silent = true })

-- Backspace delete
keyset('i', '<C-BS>', '<C-w>')

-- Vim visual multi
keyset('n', '<C-L>', ':call vm#commands#find_all(0, 1)<cr>', { noremap = true, silent = true })
-- keyset('n', '<C-j>', ':call vm#commands#add_cursor_down(0, v:count1)<cr>', { noremap = true, silent = true })
-- keyset('n', '<C-k>', ':call vm#commands#add_cursor_up(0, v:count1)<cr>', { noremap = true, silent = true })
-- keyset('i', '<C-j>', '<ESC>:call vm#commands#add_cursor_down(0, v:count1)<cr>', { noremap = true, silent = true })
-- keyset('i', '<C-k>', '<ESC>:call vm#commands#add_cursor_up(0, v:count1)<cr>', { noremap = true, silent = true })

return keyset
