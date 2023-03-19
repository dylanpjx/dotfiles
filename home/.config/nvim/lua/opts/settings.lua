local o = vim.opt
local api = vim.api

o.title = true
o.mouse = 'a'
vim.cmd('set noshowmode')
o.signcolumn = 'yes'
o.cc = '' --'80'

o.wildmenu = true
o.wildignorecase = true
o.wildmode = 'longest:list,full'
o.completeopt='menu,menuone,noselect'

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
o.foldmethod = 'marker'

vim.cmd('set suffixesadd+=.v,.sv,.lua')

function YankAndConvertVerilogModule()
    local start_line = vim.fn.search('^module')
    local end_line = vim.fn.search(');$')

    if start_line == 0 or end_line == 0 then
        return
    end

    local lines = end_line - start_line + 1
    api.nvim_command("normal! "..start_line.."gg\"+y"..lines.."j")
    vim.fn.setreg("+", reg_content)
end

-- Autosave cursor position
o.viewoptions = 'cursor,folds'

-- Auto mkdir
o.autochdir = false
api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        if vim.tbl_contains({ "oil" }, vim.bo.ft) then
            return
        end
        local dir = vim.fn.expand("<afile>:p:h")
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
        end
    end,
})

api.nvim_exec([[
    " autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=80 }

    " qf always on bottom
    autocmd FileType qf wincmd J

    " start term in insert mode
    autocmd TermOpen * startinsert

    " restore view
    au BufWinLeave *.* mkview!
    au BufWinEnter *.* silent! loadview

    au FileType md set cc=117

    command! MakeTags !ctags -R .
    command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

    if executable("rg")
      set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
      set grepformat=%f:%l:%c:%m
    endif
]], false)

