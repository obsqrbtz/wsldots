vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

if vim.fn.has('win32') == 1 then
-- Define the shell and shell command flag
  local shell = "pwsh -NoLogo"
  local shellcmdflag =
      '-ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[\'Out-File:Encoding\']=\'utf8\';'

-- Define shell redirection and piping
  local shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'
  local shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'

-- Set shellquote and shellxquote to empty strings (if you need them, set appropriate values)
  local shellquote = ""
  local shellxquote = ""
-- Set the options in Vim (use "vim.o" for global options or "vim.bo" for buffer-specific options)
  vim.o.shell = shell
  vim.o.shellcmdflag = shellcmdflag
  vim.o.shellredir = shellredir
  vim.o.shellpipe = shellpipe
  vim.o.shellquote = shellquote
  vim.o.shellxquote = shellxquote

end

vim.schedule(function()
  require "mappings"
end)
