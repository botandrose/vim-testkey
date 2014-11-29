filetype plugin on
runtime! plugin/testkey.vim

describe 'TestKey()'
  it 'does nothing if there is no match and nothing has been run yet'
    Expect TestKey("omg") ==# ""
  end

  it 'knows how to test with rspec'
    Expect TestKey("spec/models/model_spec.rb") ==# ":!clear && rspec spec/models/model_spec.rb"
  end

  it 'knows how to test with mocha'
    Expect TestKey("spec/models/model_spec.js.coffee") ==# ":!clear && mocha spec/models/model_spec.js.coffee"
  end

  it 'knows how to test with cucumber'
    Expect TestKey("features/feature.feature") ==# ":!clear && cucumber features/feature.feature:1"
  end

  it 'remembers last test run if no match'
    Expect TestKey("omg") ==# ":!clear && cucumber features/feature.feature:1"
  end
end

