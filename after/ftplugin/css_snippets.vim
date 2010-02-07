if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet v visibility: ".st.et.";"
exec "Snippet vh visibility: hidden;".st.et
exec "Snippet vv visibility: visible;".st.et
exec "Snippet ln list-style: none;".st.et
exec "Snippet oh overflow: hidden;".st.et
exec "Snippet oa overflow: auto;".st.et
exec "Snippet ov overflow: visible;".st.et
exec "Snippet white white-space: ".st.et.";"
exec "Snippet cb clear: both;".st.et
exec "Snippet cl clear: left;".st.et
exec "Snippet cr clear: right;".st.et
exec "Snippet ma margin: ".st.et."px;"
exec "Snippet ml margin-left: ".st.et."px;"
exec "Snippet mr margin-right: ".st.et."px;"
exec "Snippet mt margin-top: ".st.et."px;"
exec "Snippet mb margin-bottom: ".st.et."px;"
exec "Snippet bg background: url(../images/".st.et.") no-repeat;"
exec "Snippet bgc background: #".st.et.";"
exec "Snippet bgp background-position: ".st.et.";"
exec "Snippet bgn background: none;".st.et
exec "Snippet ws word-spacing: ".st.et."px;"
exec "Snippet ls letter-spacing: ".st.et."px;"
exec "Snippet z z-index: ".st.et.";"
exec "Snippet va vertical-align: ".st.et.";"
exec "Snippet vt vertical-align: top;".st.et
exec "Snippet vb vertical-align: bottom;".st.et
exec "Snippet vm vertical-align: middle;".st.et
exec "Snippet vbl vertical-align: base-line;".st.et
exec "Snippet vtb vertical-align: text-bottom;".st.et
exec "Snippet vtt vertical-align: text-top;".st.et
exec "Snippet cs cursor: ".st.et.";"
exec "Snippet cp cursor: pointer;".st.et
exec "Snippet bd border: ".st."1".et."px ".st."solid".et." #".st.et.";"
exec "Snippet bc border-color: #".st.et.";"
exec "Snippet bw border-width: ".st.et."px;"
exec "Snippet bs border-style: ".st.et."px;"
exec "Snippet bt border-top: ".st."1".et."px ".st."solid".et." #".st.et.";"
exec "Snippet br border-right: ".st."1".et."px ".st."solid".et." #".st.et.";"
exec "Snippet bb border-bottom: ".st."1".et."px ".st."solid".et." #".st.et.";"
exec "Snippet bl border-left: ".st."1".et."px ".st."solid".et." #".st.et.";"
exec "Snippet bn border: none;".st.et
exec "Snippet db display: block;".st.et
exec "Snippet di display: inline;".st.et
exec "Snippet dn display: none;".st.et
exec "Snippet dp display: ".st.et.";"
exec "Snippet pa padding: ".st.et."px ".st.et."px;"
exec "Snippet pt padding-top: ".st.et."px;"
exec "Snippet pr padding-right: ".st.et."px;"
exec "Snippet pb padding-bottom: ".st.et."px;"
exec "Snippet pl padding-left: ".st.et."px;"
exec "Snippet co color:#".st.et.";"
exec "Snippet poa position: absolute;".st.et
exec "Snippet por position: relative;".st.et
exec "Snippet pos position: ".st.et.";"
exec "Snippet l left: ".st.et."px;"
exec "Snippet r right: ".st.et."px;"
exec "Snippet t top: ".st.et."px;"
exec "Snippet b bottom: ".st.et."px;"
exec "Snippet fl float: left;".st.et
exec "Snippet fr float: right;".st.et
exec "Snippet fn float: none;".st.et
exec "Snippet lh line-height: ".st.et."px;"
exec "Snippet ti text-indent: ".st.et."px;"
exec "Snippet * * { margin: 0; padding:0; list-style: none; }".st.et
exec "Snippet ! !important".st.et
exec "Snippet { {<CR>".st.et."<CR>}"
exec "Snippet font font: normal 12px/1.2em 'Lucida Grande','Lucida Sans',Tahoma,Arial,Sans-Serif;".st.et
exec "Snippet fs font-size: ".st.et."px;"
exec "Snippet fw font-weight: ".st.et.";"
exec "Snippet fwb font-weight: bold;".st.et
exec "Snippet fwn font-weight: normal;".st.et
exec "Snippet ff font-family: ".st.et."'Lucida Grande','Lucida Sans',Tahoma,Arial,Sans-Serif;"
exec "Snippet h height: ".st.et."px;"
exec "Snippet w width: ".st.et."px;"
exec "Snippet tac text-align: center;".st.et
exec "Snippet tal text-align: left;".st.et
exec "Snippet tar text-align: right;".st.et
exec "Snippet tdn text-decoration:none;".st.et
exec "Snippet tdu text-decoration:underline;".st.et
exec "Snippet ie6 * html ".st.et." {<CR>".st.et."<CR>}"
exec "Snippet { {<CR>".st.et."<CR>}"
