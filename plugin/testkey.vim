" save current file and run it with rspec, cucumber, or mocha

let s:command = ""

function! TestKey(file)
  let s:config = {}
  let s:config['_spec.rb$'] = ':!clear && rspec %'
  let s:config['_spec.js'] = ':!clear && mocha %'
  let s:config['.feature$'] = ':!clear && cucumber %:'.line('.')

  for [key, value] in items(s:config)
    if match(a:file, key) != -1
      let s:command=substitute(value, "%", a:file, "g")
    end
  endfor

  return s:command
endfunction

map <ENTER> :w<cr> :exec TestKey(expand("%"))<cr>

