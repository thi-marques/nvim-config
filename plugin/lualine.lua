local ok, lualine = pcall(require, 'lualine')
if not ok then
	print('Lualine not found')
	return
end

lualine.setup({
	options = {
		theme = 'nord'
	}
})
