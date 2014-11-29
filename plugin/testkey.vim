" save current file and run it with rspec, cucumber, or mocha

let s:command = ""

let g:TestKey = {}

let g:TestKey.vspec = { 'match': '_spec.vim$' }
function g:TestKey.vspec.run(file, line)
  return ':!clear && vim-flavor test '.a:file
endfunction

let g:TestKey.rspec = { 'match': '_spec.rb$' }
function g:TestKey.rspec.run(file, line)
  return ':!clear && rspec '.a:file
endfunction

let g:TestKey.mocha = { 'match': '_spec.js' }
function g:TestKey.mocha.run(file, line)
  return ':!clear && mocha '.a:file
endfunction

let g:TestKey.cucumber = { 'match': '.feature$' }
function g:TestKey.cucumber.run(file, line)
  return ':!clear && cucumber '.a:file.':'.a:line
endfunction

function! TestKey(file, line)
  for [name, runner] in items(g:TestKey)
    if match(a:file, runner.match) != -1
      let s:command=runner.run(a:file, a:line)
    end
  endfor

  return s:command
endfunction

map <ENTER> :w<cr> :exec TestKey(expand("%"), line("."))<cr>

