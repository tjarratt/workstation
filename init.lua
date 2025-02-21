local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = {
  { "elixir-editors/vim-elixir" },
  { 'overcache/NeoSolarized' },
--- make things a bit Luan's vim-ier
  { 'ctrlpvim/ctrlp.vim' },
--- mucking about with fzf
  { 'junegunn/fzf' },
  { 'junegunn/fzf.vim' },
}

require("lazy").setup(plugins)

--- set line numbers for pairing
vim.opt.number = true
vim.wo.number = true

--- enable syntax highlighting
vim.opt.syntax = "on"

--- enable 24-bit RGB colors
vim.opt.termguicolors = true

--- set the colorscheme
vim.cmd("colorscheme NeoSolarized")
