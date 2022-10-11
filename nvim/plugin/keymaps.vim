nnoremap <leader>gt :TroubleToggle<CR>
inoremap jk <esc>
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wqa<CR>

nnoremap <silent> <C-f> :lua require("harpoon.term").sendCommand(1, "tmux-sessionizer\n");require("harpoon.term").gotoTerminal(1)<CR>
