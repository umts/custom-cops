require 'spec_helper'

describe RuboCop::Cop::UmtsCustomCops::BeForSingleton do
  let(:cop) { described_class.new }

  context 'failure cases' do
    after :each do
      expect(cop.offenses).not_to be_empty
      expect(cop.offenses.first.line).to be 1
      expect(cop.messages).to eql ['Prefer `be` matcher to `eq` or `eql` for singleton types.']
    end

    it('finds an expectation with eq and true')  { inspect_source cop, 'expect(stuff).to eq true' }
    it('finds an expectation with eql and true') { inspect_source cop, 'expect(stuff).to eql true' }
    it('finds an expectation with false')        { inspect_source cop, 'expect(stuff).to eql false' }
    it('finds an expectation with nil')          { inspect_source cop, 'expect(stuff).not_to eql nil' }
    it('finds an expectation with a Fixnum')     { inspect_source cop, 'expect(stuff).to eql 3' }
    it('finds an expectation with a Float')      { inspect_source cop, 'expect(stuff).to eql -5.0' }
  end

  context 'non-failure cases' do
    after(:each) { expect(cop.offenses).to be_empty }

    it('skips nodes without expect')            { inspect_source cop, 'stuff.should be true' }
    it('skips nodes without to or not_to')      { inspect_source cop, 'assert(stuff.eql? true)' }
    it('skips nodes with other expected types') { inspect_source cop, "expect(stuff).to be 'a string'" }
  end

  context 'autocorrect' do
    it 'corrects `eq` to `be`' do
      expect(autocorrect_source cop, 'expect(stuff).to eq true')
        .to eql 'expect(stuff).to be true'
    end

    it 'corrects `eql` to `be`' do
      expect(autocorrect_source cop, 'expect(stuff).to eql true')
        .to eql 'expect(stuff).to be true'
    end
  end
end
