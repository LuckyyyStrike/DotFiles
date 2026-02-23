-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>rp", function()
  local file = vim.fn.expand("%:p")

  -- Ghostty braucht das Kommando direkt nach dem -e ohne Umwege.
  -- Wir nutzen Doppelzitate für den hyprctl-String und einfache für das sh-Kommando.
  local cmd = "hyprctl dispatch exec \"[float] ghostty -e sh -c 'python3 " .. file .. "; echo; read'\""

  vim.fn.jobstart(cmd)
end, { desc = "Run Python in Ghostty Float" })


vim.keymap.set("n", "<leader>dd", function()
  require("neotest").run.run({ strategy = "dap" }) -- Test unter Cursor debuggen
end, { desc = "Debug test under cursor" })

vim.keymap.set("n", "<leader>dD", function()
  require("neotest").run.run({ strategy = "dap", suite = true }) -- ganze Datei debuggen
end, { desc = "Debug all tests in file" })

local map = vim.keymap.set

-- Start/Continue debugging
map("n", "<F5>", function() require 'dap'.continue() end, { desc = "Start/Continue Debug" })

-- Step over / step into / step out
map("n", "<F10>", function() require 'dap'.step_over() end, { desc = "Step Over" })
map("n", "<F11>", function() require 'dap'.step_into() end, { desc = "Step Into" })
map("n", "<F12>", function() require 'dap'.step_out() end, { desc = "Step Out" })

-- Breakpoints
map("n", "<leader>db", function() require 'dap'.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dr", function() require 'dap'.repl.open() end, { desc = "Open DAP REPL" })

map("n", "<leader>ds", function()
  require('dap').run({ type = 'python', request = 'launch', program = vim.fn.expand("%") })
end, { desc = "Debug current file" })
