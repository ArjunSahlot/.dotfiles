vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set(
  "n",
  "j",
  [[j<Cmd>nohlsearch<CR><Cmd>lua require('hlslens').stop()<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "k",
  [[k<Cmd>nohlsearch<CR><Cmd>lua require('hlslens').stop()<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set("n", "<Esc>", [[<Esc><Cmd>nohlsearch<CR>]], { noremap = true, silent = true })

-- vim.keymap.set("n", "J", "mzJ`z")

-- keep movements in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- don't overwrite register while pasting over
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("i", "<C-c>", "<Esc>")

-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick fix list??
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace current word
vim.keymap.set("n", "<leader>w", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- same thing but for big word
vim.keymap.set("n", "<leader>W", [[:%s/\<<C-r><C-a>\>/<C-r><C-a>/gI<Left><Left><Left>]])

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- fix macros
-- find a keymap that modifies the previous macro
-- or make a plugin for that

-- up arrow inserts command mode and then goes to the previous command
vim.keymap.set("n", "<Up>", "q: <Up>")

-- indentation keeps selection
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")

-- FASTWRAP IN AUTOPAIR PLUGIN ALREADY DOES THIS --

-- add ending bracket to the end of the full word
-- vim.keymap.set({"i", "n"}, "<M-w>", function()
--     local char = vim.fn.getline("."):sub(vim.fn.col("."), vim.fn.col("."))
--
--     if char ~= "(" and char ~= "[" and char ~= "{" and char ~= "<" then
--         vim.cmd("normal! B")
--     end
--
--     char = vim.fn.getline("."):sub(vim.fn.col("."), vim.fn.col("."))
--     vim.cmd("normal! vy")
--
--     if char == "(" then
--         vim.cmd("normal! Epr)")
--     elseif char == "[" then
--         vim.cmd("normal! Epr]")
--     elseif char == "{" then
--         vim.cmd("normal! Epr}")
--     elseif char == "<" then
--         vim.cmd("normal! Epr>")
--     else
--         vim.notify("Not a bracket", vim.log.levels.INFO)
--     end
-- end)
--
