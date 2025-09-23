require('oil').setup {
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
    use_default_keymaps = false,
    keymaps = {
        ["-"] = { "actions.parent", mode = "n" },
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<CR>"] = "actions.select",
        ["<C-l>"] = "actions.refresh",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<leader>cd"] = "actions.tcd",
    },
    view_options = {
        show_hidden = true
    },
}
