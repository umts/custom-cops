# frozen_string_literal: true

require 'rubocop'

module RuboCop
  module Cop
    module UmtsCustomCops
      # See the specs for examples.
      class PredicateMethodMatcher < Cop
        MESSAGE =
          'Prefer predicate matcher over checking the return value of a predicate method.'

        def_node_matcher :generic_equality_expectation, <<-PATTERN
        (send
          (send _context :expect
            (send ... $_expectation)
          ) {:to :not_to}
          (send _context {:be :eq :eql :equal}
            {true false}
          )
        )
        PATTERN

        def_node_matcher :boolean_equality_expectation, <<-PATTERN
        (send
          (send _context :expect
            (send ... $_expectation)
          ) {:to :not_to}
          (send _context {:be_true :be_false})
        )
        PATTERN

        def on_send(node)
          ends_with_question_mark = ->(method) { method.to_s.end_with? '?' }

          if generic_equality_expectation(node, &ends_with_question_mark) ||
             boolean_equality_expectation(node, &ends_with_question_mark)

            add_offense node, location: :expression, message: MESSAGE
          end
        end
      end
    end
  end
end
