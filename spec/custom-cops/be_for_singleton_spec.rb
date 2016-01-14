require 'spec_helper'

describe RuboCop::Cop::CustomCops::BeForSingleton do
  let(:cop) { described_class.new }

  it 'finds an expectation with eq and true' do
    inspect_source(cop, 'expect(stuff).to eq true')
    expect(cop.offenses).not_to be_empty
    expect(cop.messages).to include 'Prefer `be` matcher to `eq` or `eql` for singleton types.'
  end
end
