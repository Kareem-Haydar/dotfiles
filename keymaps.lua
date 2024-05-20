vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { silent = true })

vim.keymap.set('n', '<c-s>', ':w<CR>', { silent = true })
vim.keymap.set('i', '<c-s>', '<Esc>:wa<CR>', { silent = true })

vim.keymap.set('n', '<Space>n', ':bn<CR>', { silent = true })
vim.keymap.set('n', '<Space>p', ':bp<CR>', { silent = true })
vim.keymap.set('n', '<Space>x', ':bd<CR>', { silent = true })
