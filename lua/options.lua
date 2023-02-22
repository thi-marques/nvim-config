---@diagnostic disable: undefined-global
local g = vim.g
local opt = vim.opt

-- Number of screen lines to keep above and below the cursor
opt.scrolloff = 10

-- Appearance
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
g.t_Co = 256 -- terminal colors
g.defaultterminal = 'xterm-kitty'
g.shell = 'zsh'

-- Better editing experience
opt.expandtab = false
opt.smarttab = true
opt.cindent = true
opt.autoindent = true
opt.wrap = false
opt.textwidth = 300
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = -1 -- If negative, shiftwidth value is used

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }

-- Undo and backup options
opt.undofile = false
opt.swapfile = false
-- opt.backupdir = '/tmp/'
-- opt.directory = '/tmp/'
-- opt.undodir = '/tmp/'
-- CoC: Some servers have issues with backup files, see #649
opt.backup = false
opt.writebackup = false

-- Remember 50 items in comandline history
opt.history = 50

-- Better buffer splitting
opt.splitright = true
opt.splitbelow = true
opt.autoread = true
-- Preserve view while jumping
-- BUG This option causes an error!
-- opt.jumpoptions = 'view'

-- BUG: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- opt.lazyredraw = true

-- Better folds (don't fold by default)
-- opt.foldmethod = 'indent'
-- opt.foldlevelstart = 99
-- opt.foldnestmax = 3
-- opt.foldminlines = 1

opt.mouse = "a"

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.title = true
-- opt.hlsearch = true
-- opt.backup = false
-- opt.showcmd = true
-- opt.cmdheight = 1
-- opt.laststatus = 2
-- opt.backupskip = '/tmp/*,/private/tmp*'
-- opt.inccommand = 'split'

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
opt.updatetime = 1000

-- Rust
g.rust_recommended_style = false
