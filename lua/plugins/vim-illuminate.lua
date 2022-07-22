--
--
--    ▀    ▀▀█    ▀▀█                    ▀                    ▄
--  ▄▄▄      █      █    ▄   ▄  ▄▄▄▄▄  ▄▄▄    ▄ ▄▄    ▄▄▄   ▄▄█▄▄   ▄▄▄
--    █      █      █    █   █  █ █ █    █    █▀  █  ▀   █    █    █▀  █
--    █      █      █    █   █  █ █ █    █    █   █  ▄▀▀▀█    █    █▀▀▀▀
--  ▄▄█▄▄    ▀▄▄    ▀▄▄  ▀▄▄▀█  █ █ █  ▄▄█▄▄  █   █  ▀▄▄▀█    ▀▄▄  ▀█▄▄▀
--
--
-- ==> lua/plugins/vim-illuminate.lua

vim.g.Illuminate_ftblacklist = {'alpha', 'NvimTree', 'markdown'}
vim.g.Illuminate_delay = 10
vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})

-- check illuminate setting with lsp
