vim.g.loaded_perl_provider = false
vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
     ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = false,
}

vim.opt.termguicolors = true

require("core")
