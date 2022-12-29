-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/dylan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/dylan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/dylan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/dylan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/dylan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\2�\2\0\0\a\1\15\1+6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\5\0006\2\3\0009\2\4\0029\2\5\2'\3\6\0'\4\a\0'\5\b\0-\6\0\0B\2\5\2>\2\1\0016\2\3\0009\2\4\0029\2\5\2'\3\6\0'\4\t\0'\5\n\0-\6\0\0B\2\5\2>\2\2\0016\2\3\0009\2\4\0029\2\5\2'\3\6\0'\4\v\0'\5\f\0-\6\0\0B\2\5\2>\2\3\0016\2\3\0009\2\4\0029\2\5\2'\3\6\0'\4\r\0'\5\14\0-\6\0\0B\2\5\0?\2\0\0B\0\2\1K\0\1\0\0\0\27<CMD>NavigatorDown<CR>\n<C-j>\25<CMD>NavigatorUp<CR>\n<C-k>\28<CMD>NavigatorRight<CR>\n<C-l>\27<CMD>NavigatorLeft<CR>\n<C-h>\6n\bset\vkeymap\bvim\nsetup\14Navigator\frequire\t����\4\0" },
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/Navigator.nvim",
    url = "https://github.com/numToStr/Navigator.nvim"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dirbuf.nvim"] = {
    config = { "\27LJ\2\2�\1\0\0\a\1\t\1\0166\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\3\0006\2\3\0009\2\4\0029\2\5\2'\3\6\0'\4\a\0'\5\b\0-\6\0\0B\2\5\0?\2\0\0B\0\2\1K\0\1\0\0\0)<cmd>vsp<bar>wincmd L<bar>Dirbuf<CR>\14<leader>e\6n\bset\vkeymap\bvim\nsetup\vdirbuf\frequire\3����\4\0" },
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/dirbuf.nvim",
    url = "https://github.com/elihunter173/dirbuf.nvim"
  },
  ["dracula.nvim"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/dracula.nvim",
    url = "https://github.com/Mofiqul/dracula.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2@\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\2>\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["quickfix-reflector.vim"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/quickfix-reflector.vim",
    url = "https://github.com/stefandtw/quickfix-reflector.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  undotree = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-pandoc-syntax"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/vim-pandoc-syntax",
    url = "https://github.com/vim-pandoc/vim-pandoc-syntax"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["zoxide.vim"] = {
    loaded = true,
    path = "/home/dylan/.local/share/nvim/site/pack/packer/start/zoxide.vim",
    url = "https://github.com/nanotee/zoxide.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\2>\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: dirbuf.nvim
time([[Config for dirbuf.nvim]], true)
try_loadstring("\27LJ\2\2�\1\0\0\a\1\t\1\0166\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\3\0006\2\3\0009\2\4\0029\2\5\2'\3\6\0'\4\a\0'\5\b\0-\6\0\0B\2\5\0?\2\0\0B\0\2\1K\0\1\0\0\0)<cmd>vsp<bar>wincmd L<bar>Dirbuf<CR>\14<leader>e\6n\bset\vkeymap\bvim\nsetup\vdirbuf\frequire\3����\4\0", "config", "dirbuf.nvim")
time([[Config for dirbuf.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\2@\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\2�\2\0\0\a\1\15\1+6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\5\0006\2\3\0009\2\4\0029\2\5\2'\3\6\0'\4\a\0'\5\b\0-\6\0\0B\2\5\2>\2\1\0016\2\3\0009\2\4\0029\2\5\2'\3\6\0'\4\t\0'\5\n\0-\6\0\0B\2\5\2>\2\2\0016\2\3\0009\2\4\0029\2\5\2'\3\6\0'\4\v\0'\5\f\0-\6\0\0B\2\5\2>\2\3\0016\2\3\0009\2\4\0029\2\5\2'\3\6\0'\4\r\0'\5\14\0-\6\0\0B\2\5\0?\2\0\0B\0\2\1K\0\1\0\0\0\27<CMD>NavigatorDown<CR>\n<C-j>\25<CMD>NavigatorUp<CR>\n<C-k>\28<CMD>NavigatorRight<CR>\n<C-l>\27<CMD>NavigatorLeft<CR>\n<C-h>\6n\bset\vkeymap\bvim\nsetup\14Navigator\frequire\t����\4\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end