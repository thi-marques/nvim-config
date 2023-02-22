local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
	print("Autopairs not found")
	return
end

autopairs.setup({
	disable_filetype = { "TelescopePrompt" },
	map_c_w = true
})
