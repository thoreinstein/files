nnoremap <leader>gt :TroubleToggle<CR>
inoremap jk <esc>

nnoremap <silent> <C-f> :lua require("harpoon.term").sendCommand(1, "tmux-sessionizer\n");require("harpoon.term").gotoTerminal(1)<CR>
