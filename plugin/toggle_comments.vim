"
" Toggle comments plugin for quickly toggling comments variable on and off
" Maintainer:   Scott McLeod <halcyonblue@gmail.com>
" Version:      Vim 7 (may work with lower Vim versions, but not tested)
" URL:          http://github.com/halcyon/vim-togglecomments
"
" Only do this when not done yet for this buffer
if exists("b:loaded_toggle_comments")
    finish
endif
let b:loaded_toggle_comments = 1

fun! s:ToggleComments()
    if &comments == ""
        let &comments = s:old_comments
        echo "Original comments restored (" . &comments . ")"
    else
        let s:old_comments = &comments
        let &comments=""
        echo "Comments Disabled"
    endif
endfunction

" Add mappings, unless the user didn't want this.
" The default mapping is registered under to <F10> by default, unless the user
" remapped it already (or a mapping exists already for <F10>)
"
if !exists("no_plugin_maps") && !exists("no_toggle_comments_maps")
    if !hasmapto('<SID>ToggleComments()')
        noremap <F10> :call <SID>ToggleComments()<CR>
        inoremap <F10> <Esc>:call <SID>ToggleComments()<CR>
    endif
endif

"command TC :call <SID>ToggleComments()
