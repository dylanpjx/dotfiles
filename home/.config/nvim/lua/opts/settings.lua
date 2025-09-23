local o = vim.opt
local api = vim.api

o.timeoutlen = 500
o.confirm = true
o.title = true
o.mouse = 'a'
o.showmode = false
o.showcmd = true
o.signcolumn = 'yes'
o.cc = '' --'80'

o.wildmenu = true
o.wildignorecase = true
o.wildmode = 'longest:list,full'
o.completeopt = 'menu,menuone,noselect'

o.showmatch = true
o.ignorecase = true
o.smartcase = true

o.list = true
o.listchars = 'trail:⎯,extends:>,precedes:<,multispace:▏ ,tab:→ '

o.swapfile = false
o.backup = false
o.undofile = true

o.splitbelow = true
o.splitright = true

o.nu = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

o.clipboard = 'unnamedplus'

o.virtualedit = 'block'
o.foldmethod = 'indent'
o.foldlevelstart = 99

vim.cmd('set suffixesadd+=.v,.sv,.lua')

-- Autosave cursor position
o.viewoptions = 'cursor,folds'

o.autochdir = false
-- Auto mkdir
api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        if vim.bo.filetype == "oil" or vim.api.nvim_buf_get_name(0) == "" then
            return
        end

        local dir = vim.fn.expand("<afile>:p:h")
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
        end
    end,
})

-- netrw
vim.netrw_winsize = 50
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_sort_sequence = [[[\/]$,*]] -- show directories first
vim.g.netrw_sizestyle = "H"
vim.g.netrw_liststyle = 0

vim.g.netrw_localcopydircmd = "cp -r" -- Enable recursive copy of directories in *nix systems
vim.g.netrw_localmkdir = "mkdir -p"   -- Enable recursive creation of directories in *nix systems
vim.g.netrw_localrmdir = "rm -r"      -- Enable recursive removal of directories in *nix systems

vim.g.markdown_recommended_style = 0

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 60 }
    end,
})

-- Quickfix window always on bottom
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    command = "wincmd J",
})

-- Start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert",
})

-- Restore view on buffer enter/leave
vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*.*",
    command = "mkview!",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*.*",
    command = "silent! loadview",
})

-- Markdown: set colorcolumn at 117
vim.api.nvim_create_autocmd("FileType", {
    pattern = "md",
    callback = function()
        vim.opt_local.cc = "117"
    end,
})

-- MakeTags command
vim.api.nvim_create_user_command("MakeTags", "!ctags -R .", {})

-- R command to run shell commands in a scratch buffer
vim.api.nvim_create_user_command("R", function(opts)
    vim.cmd("new")
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "hide"
    vim.bo.swapfile = false
    vim.cmd("read !" .. opts.args)
end, {
    nargs = "*",
    complete = "shellcmd",
})

-- Set grepprg and grepformat if ripgrep is available
if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
    vim.opt.grepformat = "%f:%l:%c:%m"
end

-- Disable auto comment on new line
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})
