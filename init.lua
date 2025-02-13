require("devid")
-- Enable both absolute and relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true


vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("highlight Normal guibg=#000000") -- Set background to black
vim.cmd([[
  highlight Statement guifg=#00FF00 ctermfg=Green
  highlight Identifier guifg=#00FF00 ctermfg=Green
  highlight Type guifg=#00FF00 ctermfg=Green
  highlight Keyword guifg=#00FF00 ctermfg=Green
  highlight Constant guifg=#00FF00 ctermfg=Green
]])
vim.cmd([[
  highlight Normal guifg=#00FF00 guibg=#000000
  highlight Comment guifg=#00FF00
  highlight String guifg=#00FF00
  highlight Function guifg=#00FF00
  highlight Variable guifg=#00FF00
  highlight Number guifg=#00FF00
]])

