if !exists('loaded_snippet') || &cp
    finish
endif

function! JsInit(text)
    if a:text != "args"
        return a:text
    else
        return ''
    endif
endfunction

function! JsInitVars(text)
    if a:text != "args"
        let text = substitute(a:text,'=.\{-},','','g')
        let text = substitute(text,'=.\{-}$','','g')
        let text = substitute(text,',','','g')
        let ret = ''
        let tabs = indent(".")/&tabstop
        let tab_text = ''
        for i in range(tabs)
            let tab_text = tab_text.'\t'
        endfor
        for Arg in split(text, ' ')
            let ret = ret.'this.'.Arg.' = '.Arg.';\n'.tab_text
        endfor
        return ret
    else
        return ''
    endif
endfunction

function! JsRemDefVal(text)
    return substitute(a:text,'=.*','','g')
endfunction

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet class function ".st."ClassName".et."(".st."args:JsInit(@z)".et.") {<CR>".st."args:JsInitVars(@z)".et.st.et."<CR>}"
exec "Snippet meth ".st."ClassName".et.".prototype.".st."methodName".et." = function(".st.et.") {<CR>".st.et."<CR>};"
exec "Snippet fun function ".st."functionName".et."(".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet afun function(".st.et.")  {<CR>".st.et."<CR>}"
exec "Snippet doc document.".st.et
exec "Snippet gebi getElementById(".st.et.")"
exec "Snippet gebt getElementsByTagName(".st.et.")"
exec "Snippet ce createElement(".st.et.")"
exec "Snippet efor for (var ".st."i".et." = ".st."0".et."; ".st."i:JsRemDefVal(@z)".et." < ".st.et."; ".st."i:JsRemDefVal(@z)".et."++) {<CR>".st.et."<CR>}"
exec "Snippet for for (".st.et."; ".st.et."; ".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet while while (".st."true".et.") {<CR>".st.et."<CR>}"
exec "Snippet if if (".st.et.") {<CR>}"
exec "Snippet ifi if (".st.et.") ".st.et
exec "Snippet . this."
exec "Snippet alert alert(".st.et.")"
exec "Snippet try {<CR>".st.et."<CR>}<CR>catch(e) {}"
exec "Snippet { {<CR>".st.et."<CR>}"
