# frozen_string_literal: true

require 'spec_helper'

describe RuboCop::Cop::UmtsCustomCops::PredicateMethodMatcher do
  let(:cop) { described_class.new }

  context 'failure cases' do
    after :each do
      expect(cop.offenses).not_to be_empty
      expect(cop.offenses.first.line).to be 1
      expect(cop.messages)
        .to eql ['Prefer predicate matcher over checking the return value of a predicate method.']
    end

    it 'finds an expectation with a predicate method and an expected value of true' do
      inspect_source 'expect(stuff.method?).to eql true'
    end

    it 'finds an expectation with a predicate method and an expected value of false' do
      inspect_source 'expect(stuff.method?).to eql false'
    end

    it 'finds an expectation with a predicate method and the `be` matcher' do
      inspect_source 'expect(stuff.method?).to be true'
    end

    it 'finds an expectation with a predicate method and the `eq` matcher' do
      inspect_source 'expect(stuff.method?).to eq true'
    end

    it 'finds an expectation with a predicate method and the `eql` matcher' do
      inspect_source 'expect(stuff.method?).to eql true'
    end

    it 'finds an expectation with a predicate method and the `be_true` matcher' do
      inspect_source 'expect(stuff.method?).to be_true'
    end

    it 'finds an expectation with a predicate method and the `be_false` matcher' do
      inspect_source 'expect(stuff.method?).to be_false'
    end

    it 'finds an expectation with a predicate method and the `equal matcher' do
      inspect_source 'expect(stuff.method?).to equal true'
    end
  end

  context 'non-failure cases' do
    after(:each) { expect(cop.offenses).to be_empty }

    it 'skips nodes without expect' do
      inspect_source 'stuff.method?.should be true'
    end
    it 'skips expectations without method calls ' do
      inspect_source 'expect(Object).to receive(:a_method)'
    end
    it 'skips nodes without to or not_to' do
      inspect_source 'assert(stuff.method?.eql? true)'
    end
    it 'skips nodes without predicate methods' do
      inspect_source 'expect(stuff.method).to be true'
    end
    it 'skips nodes with predicate methods and other return types' do
      inspect_source 'expect(stuff.method?).to eql 3' # who would do this? hopefully no one.
    end
  end
end
