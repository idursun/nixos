{ configs, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
      set termguicolors
      let base16colorspace=256  " Access colors present in 256 colorspace
      colorscheme base16-dracula
      nnoremap <leader>; :Buffers<cr>
      nnoremap <leader>f :Files<cr>
      tnoremap <C-j> <C-\><C-N>
      " Use `[g` and `]g` to navigate diagnostics
      nmap <silent> [g <Plug>(coc-diagnostic-prev)
      nmap <silent> ]g <Plug>(coc-diagnostic-next)

      " Remap keys for gotos
      nmap <silent> gd <Plug>(coc-definition)
      nmap <silent> gy <Plug>(coc-type-definition)
      nmap <silent> gi <Plug>(coc-implementation)
      nmap <silent> gr <Plug>(coc-references)
      " Remap for rename current word
      nmap <leader>rn <Plug>(coc-rename)
      " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
      xmap <leader>a  <Plug>(coc-codeaction-selected)
      nmap <leader>a  <Plug>(coc-codeaction-selected)

      " Remap for do codeAction of current line
      nmap <leader>ac  <Plug>(coc-codeaction)
      " Fix autofix problem of current line
      nmap <leader>qf  <Plug>(coc-fix-current)
      " Using CocList
      " Show all diagnostics
      nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
      " Manage extensions
      nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
      " Show commands
      nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
      " Find symbol of current document
      nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
      " Search workspace symbols
      nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
      " Do default action for next item.
      nnoremap <silent> <space>j  :<C-u>CocNext<CR>
      " Do default action for previous item.
      nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
      " Resume latest coc list
      nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

      " Use <c-space> to trigger completion.
      inoremap <silent><expr> <c-space> coc#refresh()

      " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
      " Coc only does snippet and additional edit on confirm.
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
      nnoremap <silent> K :call <SID>show_documentation()<CR>
      function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
          execute 'h '.expand('<cword>')
        else
          call CocAction('doHover')
        endif
      endfunction
    '';
    plugins = with pkgs.vimPlugins; [
      vim-sensible
      vim-surround
      vim-nix
      vim-airline
      base16-vim
      coc-nvim
      coc-json
      coc-html
      coc-rust-analyzer
    ];
    withNodeJs = true;
    withPython3 = true;
  };
}
