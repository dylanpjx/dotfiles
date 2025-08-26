-- Define colors via highlights
vim.cmd [[
  hi StatusLineNormal guifg=#bbc2cf guibg=#202328
  hi StatusLineInactive guifg=#bbc2cf guibg=#282a36
]]

-- LSP aware filename display
local function lsp_file_status()
    local buf_ft = vim.bo.filetype
    local filename = vim.fn.expand('%:t') -- get just the filename
    local modified = vim.bo.modified and '[+]' or ''
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local has_git_or_diag = (git_branch() ~= '') or (diagnostics() ~= '')

    local prefix = has_git_or_diag and ' ' or ''


    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.tbl_contains(filetypes, buf_ft) then
            return prefix .. '• ' .. filename .. ' ' .. modified
        end
    end

    return prefix .. filename .. ' ' .. modified
end

-- Get current Git branch (if available)
local function git_branch()
    local branch = vim.b.gitsigns_head or ''
    if branch ~= '' then
        return ' ' .. branch
    end
    return ''
end

-- Diagnostics counts
local function diagnostics()
    local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

    local result = {}
    if errors > 0 then table.insert(result, 'E:' .. errors) end
    if warnings > 0 then table.insert(result, 'W:' .. warnings) end
    if info > 0 then table.insert(result, 'I:' .. info) end

    return table.concat(result, ' ')
end

-- Update statusline
local active_statusline = table.concat({
    '%#StatusLineNormal#',
    '%{v:lua.git_branch()}',
    ' ',
    '%{v:lua.diagnostics()}',
    ' ',
    '%{v:lua.lsp_file_status()}',
    ' %= ',
    'ln: %l ',
    'col: %v ',
    '[%p%%]'
})

local inactive_statusline = [[%#StatusLineInactive# %f]]

-- Function to set active/inactive statusline
local function set_statusline()
    local winid = vim.api.nvim_get_current_win()
    for _, w in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_is_valid(w) then
            vim.api.nvim_win_set_option(w, 'statusline', w == winid and active_statusline or inactive_statusline)
        end
    end
end

-- Auto-update statusline on window focus changes
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    callback = set_statusline,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
    callback = set_statusline,
})

-- Make helper functions globally accessible
_G.git_branch = git_branch
_G.diagnostics = diagnostics
_G.lsp_file_status = lsp_file_status
