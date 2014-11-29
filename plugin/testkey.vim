" save current file and run it with vim-flavor, rspec, cucumber, or mocha

if !exists("g:TestKey")
  let g:TestKey = {}
end

let g:TestKey = extend({ 'runners': {}, 'testkey': '<ENTER>', 'command' : '' }, g:TestKey)

let g:TestKey.runners.vspec = { 'match': '_spec.vim$' }
function g:TestKey.runners.vspec.run(file, line)
  return ':!clear && vim-flavor test '.a:file
endfunction

let g:TestKey.runners.rspec = { 'match': '_spec.rb$' }
function g:TestKey.runners.rspec.run(file, line)
  return ':!clear && rspec '.a:file
endfunction

let g:TestKey.runners.mocha = { 'match': '_spec.js' }
function g:TestKey.runners.mocha.run(file, line)
  return ':!clear && mocha '.a:file
endfunction

let g:TestKey.runners.cucumber = { 'match': '.feature$' }
function g:TestKey.runners.cucumber.run(file, line)
  return ':!clear && cucumber '.a:file.':'.a:line
endfunction


function! g:TestKey.lookup(file, line)
  for [name, runner] in items(g:TestKey.runners)
    if match(a:file, runner.match) != -1
      let g:TestKey.command=runner.run(a:file, a:line)
    end
  endfor

  return g:TestKey.command
endfunction


function! TestKey()
  w
  exec g:TestKey.lookup(expand("%"), line("."))
endfunction

execute "map " . g:TestKey.testkey . " :call TestKey()<cr>"

