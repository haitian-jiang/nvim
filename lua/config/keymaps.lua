-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape Insert Mode" })
vim.keymap.set("i", "JK", "<Esc>", { desc = "Escape Insert Mode (CAPS)" })

local delete_keys = {
  { "n", "d", '"_d' },
  { "n", "dd", '"_dd' },
  { "n", "D", '"_D' },
  { "n", "x", '"_x' },
  { "n", "X", '"_X' },
  { "v", "d", '"_d' },
  { "v", "D", '"_D' },
  { "v", "x", '"_x' },
  { "v", "X", '"_X' },
}
for _, map in ipairs(delete_keys) do
  vim.keymap.set(map[1], map[2], map[3], { noremap = true, silent = true })
end

-- <F6> (cmd-S) to save file
vim.keymap.set("n", "<F6>", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("i", "<F6>", "<Esc>:w<CR>a", { desc = "Save file and return to insert mode" })
