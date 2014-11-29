" save current file and run it with rspec, cucumber, or mocha

let s:command = ""

let s:config = {}
let s:config['_spec.vim$'] = ':!clear && vim-flavor test #{a:file}'
let s:config['_spec.rb$'] = ':!clear && rspec #{a:file}'
let s:config['_spec.js'] = ':!clear && mocha #{a:file}'
let s:config['.feature$'] = ':!clear && cucumber #{a:file}:#{a:line}'

function! TestKey(file, line)
  for [key, value] in items(s:config)
    if match(a:file, key) != -1
      let s:command=value
      let s:command=substitute(s:command, '#{a:file}', a:file, "g")
      let s:command=substitute(s:command, '#{a:line}', a:line, "g")
    end
  endfor

  return s:command
endfunction

map <ENTER> :w<cr> :exec TestKey(expand("%"), line("."))<cr>

