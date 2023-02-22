---@diagnostic disable: undefined-global
local keybinds_ok, keyset = pcall(require, 'keybinds')
if not keybinds_ok then
	print('keybinds not found')
	return
end

keyset("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
-- Requires https://github.com/BurntSushi/ripgrep
keyset("n", "<leader>fs", "<CMD>Telescope live_grep<CR>")
keyset("n", "<leader>ht", "<CMD>Telescope colorscheme<CR>")

local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
	print('Telescope not found')
	return
end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then
	print('Telescope actions not found')
	return
end

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
			},
		},
	},
})
