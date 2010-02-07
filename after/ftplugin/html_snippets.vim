if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

function! SelectDoctype()
    let st = g:snip_start_tag
    let et = g:snip_end_tag
    let cd = g:snip_elem_delim
    let dt = inputlist(['Select doctype:',
                \ '1. HTML 4.01',
                \ '2. HTML 4.01 Transitional',
                \ '3. HTML 4.01 Frameset',
                \ '4. XHTML 1.0 Frameset',
                \ '5. XHTML Strict',
                \ '6. XHTML Transitional',
                \ '7. XHTML Frameset'])
    let dts = {1: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"\n\"http://www.w3.org/TR/html4/strict.dtd\">\n",
             \ 2: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n\"http://www.w3.org/TR/html4/loose.dtd\">\n",
             \ 3: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\"\n\"http://www.w3.org/TR/html4/frameset.dtd\">\n",
             \ 4: "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\">\n",
             \ 5: "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Strict//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n",
             \ 6: "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Transitional//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n",
             \ 7: "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Frameset//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\">\n"}
    
    return dts[dt]
endfunction

exec "Snippet doct ``SelectDoctype()``"
exec "Snippet doctype <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\"<CR><TAB>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\"><CR>".st.et
exec "Snippet doc4s <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"<CR>\"http://www.w3.org/TR/html4/strict.dtd\"><CR>".st.et
exec "Snippet doc4t <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"<CR>\"http://www.w3.org/TR/html4/loose.dtd\"><CR>".st.et
exec "Snippet doc4f <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\"<CR>\"http://www.w3.org/TR/html4/frameset.dtd\"><CR>".st.et
exec "Snippet docxs <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Strict//EN\"<CR>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><CR>".st.et
exec "Snippet docxt <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Transitional//EN\"<CR>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><CR>".st.et
exec "Snippet docxf <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Frameset//EN\"<CR>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\"><CR>".st.et
exec "Snippet head <head><CR><meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" /><CR><title>".st.et."</title><CR>".st.et."<CR></head><CR>"
exec "Snippet js <script type=\"text/javascript\"><CR>".st.et."<CR></script>"
exec "Snippet ejs <script type=\"text/javascript\" src=\"".st.et.".js\"></script>"
exec "Snippet title <title>".st.et."</title>"
exec "Snippet body <body><CR>".st.et."<CR></body>"
exec "Snippet scriptsrc <script src=\"".st.et."\" type=\"text/javascript\" language=\"".st.et."\" charset=\"".st.et."\"></script><CR>"
exec "Snippet textarea <textarea name=\"".st.et."\" rows=\"".st.et."\" cols=\"".st.et."\">".st.et."</textarea><CR>"
exec "Snippet meta <meta name=\"".st.et."\" content=\"".st.et."\" /><CR>"
exec "Snippet movie <object width=\"".st.et."\" height=\"".st.et."\"<CR>classid=\"clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B\"<CR>codebase=\"http://www.apple.com/qtactivex/qtplugin.cab\"><CR><param name=\"src\"<CR>value=\"".st.et."\" /><CR><param name=\"controller\" value=\"".st.et."\" /><CR><param name=\"autoplay\" value=\"".st.et."\" /><CR><embed src=\"".st.et."\"<CR>width=\"".st.et."\" height=\"".st.et."\"<CR>controller=\"".st.et."\" autoplay=\"".st.et."\"<CR>scale=\"tofit\" cache=\"true\"<CR>pluginspage=\"http://www.apple.com/quicktime/download/\"<CR>/><CR></object><CR>"
exec "Snippet div <div><CR>".st.et."<CR></div>"
exec "Snippet di <div id=\"".st."id".et."\"><CR>".st.et."<CR></div><!-- #".st."id".et." End -->"
exec "Snippet dc <div class=\"".st.et."\"><CR>".st.et."<CR></div>"
exec "Snippet dic <div id=\"".st.et."\" class=\"".st.et."\"><CR>".st.et."<CR></div>"
exec "Snippet i id=\"".st.et."\""
exec "Snippet c class=\"".st.et."\""
exec "Snippet mailto <a href=\"mailto:".st.et."?subject=".st.et."\">".st.et."</a>"
exec "Snippet table <table cellpadding=\"".st.et."\"><CR><tr><th>".st.et."</th></tr><CR><tr><td>".st.et."</td></tr><CR></table>"
exec "Snippet tr <tr><CR>".st.et."<CR></tr>"
exec "Snippet td <td>".st.et."</td>"
exec "Snippet link <link rel=\"stylesheet\" href=\"".st.et."\" type=\"text/css\" />"
exec "Snippet form <form action=\"".st.et."\" method=\"".st.et."\"><CR>".st.et."<CR><CR><p><input type=\"submit\" value=\"Continue &rarr;\" /></p><CR></form><CR>"
exec "Snippet a <a href=\"#\">".st.et."</a>"
exec "Snippet at <a target=\"_blank\" href=\"#\">".st.et."</a>"
exec "Snippet h1 <h1>".st.et."</h1>"
exec "Snippet h2 <h2>".st.et."</h2>"
exec "Snippet h3 <h3>".st.et."</h3>"
exec "Snippet h4 <h4>".st.et."</h4>"
exec "Snippet h5 <h5>".st.et."</h5>"
exec "Snippet h6 <h6>".st.et."</h6>"
exec "Snippet input <input type=\"".st.et."\" name=\"".st.et."\" value=\"".st.et."\" ".st.et."/>"
exec "Snippet style <style type=\"text/css\"><CR>* {margin:0; padding:0; list-style:none; }<CR>".st.et."<CR></style>"
exec "Snippet base <base href=\"".st.et."\"".st.et." />"
exec "Snippet st <strong>".st.et."</strong>"
exec "Snippet em <em>".st.et."</em>"
exec "Snippet sp <span>".st.et."</span>"
exec "Snippet p <p>".st.et."</p>"
exec "Snippet pc <p class=\"".st.et."\">".st.et."</p>"
exec "Snippet it <input type=\"text\" name=\"\" />"
exec "Snippet ih <input type=\"hidden\" name=\"\" value=\"\" />"
exec "Snippet is <input type=\"submit\" value=\"".st.et."\" />"
exec "Snippet ire <input type=\"reset\" value=\"".st.et."\" />"
exec "Snippet ir <input type=\"radio\" name=\"\" value=\"\" />"
exec "Snippet ic <input type=\"checkbox\" name=\"\" value=\"\" />"
exec "Snippet nb &nbsp;"
exec "Snippet gt &gt;"
exec "Snippet lt &lt;"
exec "Snippet br <br />"
exec "Snippet hr <hr />"
exec "Snippet img <img src=\"".st.et."\" alt=\"\" title=\"\" />"
exec "Snippet pre <pre>".st.et."</pre>"
exec "Snippet ul <ul><CR><li>".st.et."</li><CR><li>".st.et."</li><CR></ul>"
exec "Snippet ui <ul id=\"".st.et."\"><CR><li>".st.et."</li><CR><li>".st.et."</li><CR></ul>"
exec "Snippet li <li>".st.et."</li>"
exec "Snippet uc <ul class=\"".st.et."\"><CR><li>".st.et."</li><CR><li>".st.et."</li><CR></ul>"
exec "Snippet uia <ul id=\"".st.et."\"><CR><li><a href=\"#\" title=\"\">".st.et."</a></li><CR><li><a href=\"#\" title=\"\">".st.et."</a></li><CR></ul>"
exec "Snippet uca <ul class=\"".st.et."\"><CR><li><a href=\"#\" title=\"\">".st.et."</a></li><CR><li><a href=\"#\" title=\"\">".st.et."</a></li><CR></ul>"
exec "Snippet ua <ul><CR><li><a href=\"#\" title=\"\">".st.et."</a></li><CR><li><a href=\"#\" title=\"\">".st.et."</a></li><CR></ul>"
exec "Snippet ol <ol><CR><li>".st.et."</li><CR><li>".st.et."</li><CR></ol>"
exec "Snippet dl <dl><CR><dt>".st.et."</dt><CR><dd>".st.et."</dd><CR></dl>"
exec "Snippet dli <dl id=\"".st.et."\"><CR><dt>".st.et."</dt><CR><dd>".st.et."</dd><CR></dl>"
exec "Snippet dlc <dl class=\"".st.et."\"><CR><dt>".st.et."</dt><CR><dd>".st.et."</dd><CR></dl>"
exec "Snippet form <form method=\"POST\" action=\"\"><CR>".st.et."<CR></form>"
exec "Snippet select <select name=\"\"><CR><option value=\"\" selected=\"selected\">".st.et."</option><CR><option value=\"\">".st.et."</option><CR></select>"
exec "Snippet op <option value=\"\">".st.et."</option>"
exec "Snippet but <button>".st.et."</button>"
exec "Snippet label <label>".st.et."</label>"
exec "Snippet iframe <iframe src=\"".st.et."\" width=\"\" height=\"\"></iframe>"
exe "Snippet tpl <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><CR><html xmlns=\"http://www.w3.org/1999/xhtml\"><CR><head><CR><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" /> <CR><meta name=\"author\" content=\"treblam\" /><CR><meta name=\"keywords\" content=\"\" /><CR><meta name=\"description\" content=\"\" /><CR><title> new document </title><CR></head><CR><body><CR>".st.et."<CR></body><CR></html>"
