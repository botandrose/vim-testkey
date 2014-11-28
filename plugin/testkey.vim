" save current file and run it with rspec, cucumber, or mocha

function! TestKey()
  :w
  let file = expand("%")
  if match(file, '_spec.rb$') != -1
    let s:command=":!clear && rspec ".file
  elseif match(file, '.feature$') != -1
    let s:command=":!clear && bin/cucumber ".file.":".line(".")
  elseif match(file, '_spec.js.coffee$') != -1
    let s:command=":!clear && mocha ".file
  end
  exec s:command
endfunction

map <ENTER> :call TestKey()<cr>

