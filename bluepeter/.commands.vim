nnoremap <leader>vv :%s/\v^(\s*)var /\1/<cr>:%s/\v\(var /(/<cr>
nnoremap <leader>v; :%s/\v;$//<cr>
nnoremap <leader>v: :%s/\v^\s*;$//<cr>
nnoremap <leader>v{ :%s/\v[{}]//g<cr>
nnoremap <leader>vf :%s/\vfunction\s*\(([^)]*)\)/(\1) ->/<cr>
nnoremap <leader>vF :%s/\vfunction\s*([^ (]*)\(([^)]*)\)/\1 = (\2) ->/<cr>
nnoremap <leader>v@ :%s/\v_@<!this\./@/g<cr>
nnoremap <leader>vm :%s/\v^(\s*)(\S+)\.prototype\.(\S+)\s*\=/\1\3:/<cr>
nnoremap <leader>v# :%s/\v\/\/ /# /<cr>
nnoremap <leader>vs :%s/\v(\s)case(\s)/\1when\2/<cr>:%s/\v(when.*):$/\1/<cr>
