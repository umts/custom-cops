require 'spec_helper'

describe RuboCop::Cop::UmtsCustomCops::BeMatcherForNonDuplicableTypes do
  let(:cop) { described_class.new }

  context 'failure cases' do
    after :each do
      expect(cop.offenses).not_to be_empty
      expect(cop.offenses.first.line).to be 1
      expect(cop.messages).to eql ['Prefer `be` matcher to `eq` or `eql` for non-duplicable types.']
    end

    it('finds an expectation with eq/true')  { inspect_source 'expect(stuff).to eq true' }
    it('finds an expectation with eql/true') { inspect_source 'expect(stuff).to eql true' }
    it('finds an expectation with false')    { inspect_source 'expect(stuff).to eql false' }
    it('finds an expectation with nil')      { inspect_source 'expect(stuff).not_to eql nil' }
  end

  context 'non-failure cases' do
    after(:each) { expect(cop.offenses).to be_empty }

    it('skips nodes without expect')       { inspect_source 'stuff.should be true' }
    it('skips nodes without to or not_to') { inspect_source 'assert(stuff.eql? true)' }
    it('skips nodes with other types')     { inspect_source "expect(stuff).to be 'a string'" }
  end

  context 'autocorrect' do
    it 'corrects `eq` to `be`' do
      expect(autocorrect_source('expect(stuff).to eq true'))
        .to eql 'expect(stuff).to be true'
    end

    it 'corrects `eql` to `be`' do
      expect(autocorrect_source('expect(stuff).to eql true'))
        .to eql 'expect(stuff).to be true'
    end
  end
end
