" save current file and run it with vim-flavor, rspec, cucumber, or mocha

if !exists("g:TestKey")
  let g:TestKey = {}
end

let g:TestKey = extend({ 'runners': {}, 'testkey': '<ENTER>', 'command' : '' }, g:TestKey)

if !exists("g:TestKey.runners.vspec")
  let g:TestKey.runners.vspec = { 'match': '_spec.vim$' }
  function g:TestKey.runners.vspec.run(file, line)
    return ':!clear && vim-flavor test '.a:file
  endfunction
end

if !exists("g:TestKey.runners.rspec")
  let g:TestKey.runners.rspec = { 'match': '_spec.rb$' }
  function g:TestKey.runners.rspec.run(file, line)
    return ':!clear && rspec '.a:file
  endfunction
end

if !exists("g:TestKey.runners.mocha")
  let g:TestKey.runners.mocha = { 'match': '_spec.js' }
  function g:TestKey.runners.mocha.run(file, line)
    return ':!clear && mocha '.a:file
  endfunction
end

if !exists("g:TestKey.runners.cucumber")
  let g:TestKey.runners.cucumber = { 'match': '.feature$' }
  function g:TestKey.runners.cucumber.run(file, line)
    return ':!clear && cucumber '.a:file.':'.a:line
  endfunction
end

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
  exec g:TestKey.lookup(escape(expand("%"), '\'), line("."))
endfunction

function! s:map_testkey()
  " The `<Enter>` key is a bit problematic in certain buffers where the
  " `<Enter>` key have a specific meaning and is not replaceable. This buffers
  " are:
  " - [Command Line], (:h cmdwin) which is a regular vim buffer with a buffer name
  "   enclosed in square brackets
  " - Quickfix and Location List
  " - Any buffer who already have mapped the `<Enter>` key
  if g:TestKey.testkey != '<Enter>' ||
        \ ( bufname('')[0] != '[' &&
        \   &filetype !=# 'qf' &&
        \   empty(maparg(g:TestKey.testkey)) )
    execute 'map <buffer>' g:TestKey.testkey ':call TestKey()<cr>'
  endif
endfunction

augroup testkey
  autocmd!
  autocmd FileType * call s:map_testkey()
augroup END
