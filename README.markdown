# vim-testkey

Tighten your TDD feedback loop!

## Installation:

If you don't have a preferred installation method, I recommend
installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and
then simply copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/botandrose/vim-testkey.git

## Usage:

* Hit enter in any test file to run it.
* Hit enter in any other file to rerun the last test.

### Test type support:

* rspec: files that end with `_spec.rb`
* cucumber: files that end with `.feature` (will run just the scenario under the cursor)
* mocha: files that end with `_test.js` or `_test.js.coffee`

## TODO:

* configuration: override default testkey
* configuration: add or override support for new test types

## Acknowledgements

* Maureen Dugan: for pointing out the inadequacies of my previous setup.
* Gary Bernhardt: for the idea to use Enter as the test key.
