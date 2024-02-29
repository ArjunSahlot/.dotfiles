vim.opt.wrap = true -- Wrap text
vim.opt.breakindent = true -- Match indent on line break
vim.opt.linebreak = true -- Line break on whole words

-- Allow motions between wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "0", "g0")
vim.keymap.set("n", "$", "g$")
vim.keymap.set("n", "^", "g^")

vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")

-- Spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = true
