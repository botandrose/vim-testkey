filetype plugin on
runtime! plugin/testkey.vim

describe 'TestKey()'
  it 'does nothing if there is no match and nothing has been run yet'
    Expect TestKey("omg", 1) ==# ""
  end

  it 'knows how to test with vspec'
    Expect TestKey("t/vim_spec.vim", 1) ==# ":!clear && vim-flavor test t/vim_spec.vim"
  end

  it 'knows how to test with rspec'
    Expect TestKey("spec/models/model_spec.rb", 1) ==# ":!clear && rspec spec/models/model_spec.rb"
  end

  it 'knows how to test with mocha'
    Expect TestKey("spec/models/model_spec.js.coffee", 1) ==# ":!clear && mocha spec/models/model_spec.js.coffee"
  end

  it 'knows how to test with cucumber'
    Expect TestKey("features/feature.feature", 10) ==# ":!clear && cucumber features/feature.feature:10"
  end

  it 'remembers last test run if no match'
    Expect TestKey("omg", 1) ==# ":!clear && cucumber features/feature.feature:10"
  end
end

