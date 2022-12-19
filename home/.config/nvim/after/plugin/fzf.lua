local actions = require'fzf-lua.actions'

require('fzf-lua').setup {
  winopts = {
    row = 1,
    width = 1,
    height = 0.4,

    keymap = {
      actions = {
        files = {
          ["ctrl-q"] = actions.file_sel_to_qf, -- qf
          ["ctrl-l"] = actions.file_sel_to_ll, -- loclist
        },
      },
    },
  },
}

local fzf_lua = require("fzf-lua")
  local opts = { noremap = true, silent = true }
  
  vim.keymap.set('n', '<leader>fp',
    function()
      local history = require("project_nvim.utils.history")
      local results = history.get_recent_projects()
      fzf_lua.fzf_exec(results, {
        actions = {
          ['default'] = {
            function(selected)
              fzf_lua.files({ cwd = selected[1] })
            end,
          }
        }
      })
    end, opts)
  
  vim.keymap.set('n', '<leader>/',
    function()
      if require'fzf-lua.path'.is_git_repo(vim.loop.cwd(), true) then
        param = { cmd = "git grep --line-number --column --color=always" }
      else
        param = {}
      end
      require("fzf-lua").live_grep_native(param)
    end, opts)

  vim.keymap.set('n', '<leader>fb', '<cmd>lua require("fzf-lua").buffers()<CR>', opts)
  vim.keymap.set('n', '<leader>fr', '<cmd>lua require("fzf-lua").oldfiles()<CR>', opts)
  vim.keymap.set('n', '<leader>ff', '<cmd>lua require("fzf-lua").files()<CR>', opts)
