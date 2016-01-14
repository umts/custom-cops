require 'pry-byebug'

module RuboCop
  module Cop
    module UmtsCustomCops
      class PredicateMethodMatcher < Cop
        MSG = 'Prefer predicate matcher over checking the return value of a predicate method.'

        BOOLEAN_EQUALITY_MATCHERS = %i(be_true be_false)
        GENERIC_EQUALITY_MATCHERS = %i(be eq eql equal)


        def on_send(node)
          return unless %i(to not_to).include? node.method_name

          return unless node.child_nodes
          expectation = node.child_nodes.first
          return unless expectation.method_name == :expect

          match_value = expectation.child_nodes.first
          return unless match_value.method_name.to_s.end_with? '?'

          matcher = node.child_nodes[1]
          if GENERIC_EQUALITY_MATCHERS.include? matcher.method_name
            matcher_arg = matcher.child_nodes.first
            return unless matcher_arg.true_type? || matcher_arg.false_type?
          else
            return unless BOOLEAN_EQUALITY_MATCHERS.include? matcher.method_name
          end


          add_offense node, :expression, MSG
        end
      end
    end
  end
end
