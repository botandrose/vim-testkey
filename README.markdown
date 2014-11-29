# vim-testkey

Tighten your TDD feedback loop!

[![Build Status](https://travis-ci.org/botandrose/vim-testkey.svg)](https://travis-ci.org/botandrose/vim-testkey)

## Installation:

If you don't have a preferred installation method, I recommend
installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and
then simply copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/botandrose/vim-testkey.git

## Usage:

* Hit enter in any test file to save and run it.
* Hit enter in any other file to save it and rerun the last test.

### Built-in test type support:

* vspec via vim-flavor: files that end with `_spec.vim`
* rspec: files that end with `_spec.rb`
* cucumber: files that end with `.feature` (runs scenario under the cursor only)
* mocha: files that end with `_test.js` or `_test.js.coffee`

### Adding or overriding test runner configuration:

Test runner configurations are added to the `g:TestKey.runners` dictionary. Each
test runner configuration is a dictionary with two keys: `match` and `run`.
`match` is a regex for detecting the test type from the filename. `run` is a
function that returns a string to execute the test runner itself. This function
is provided two arguments: `a:file` and `a:line`, which are the current file
name and the current line number, respectively.

To add your own test runner, (or override an existing), just modify the
`g:TestKey.runners` dictionary in your .vimrc. For example, here is the test
runner configuration for Cucumber:

```vimscript
let g:TestKey.runners.cucumber = { 'match': '.feature$' }
function g:TestKey.runners.cucumber.run(file, line)
  return ':!clear && cucumber '.a:file.':'.a:line
endfunction
```

### Configuring the test key mapping

By default, `<ENTER>` is the test key. To use a different key, open up your
.vimrc, and prefill the `g:TestKey` configuration dictionary with `testkey` set
to your preferred test key. For example:

```vimscript
let g:TestKey = { 'testkey': '<leader>s' }
```

## Acknowledgements

* Maureen Dugan: for pointing out the inadequacies of my previous setup.
* Gary Bernhardt: for the idea to use Enter as the test key.

