require 'rubocop'

module RuboCop
  module Cop
    module UmtsCustomCops
      # Prefer the easier-to-read be matcher for non-duplicable types.
      #
      # See the specs for examples.
      class BeMatcherForNonDuplicableTypes < Cop
        MSG = 'Prefer `be` matcher to `eq` or `eql` for non-duplicable types.'.freeze

        def_node_matcher :eq_on_non_duplicable_type?, <<-PATTERN
          (send
            _expectation {:to :not_to}
            (send
              _context {:eq :eql}
              {true false nil}
            )
          )
        PATTERN

        def autocorrect(node)
          lambda do |corrector|
            matcher = node.child_nodes[1]
            corrector.replace matcher.loc.selector, 'be'
          end
        end

        def on_send(node)
          return unless eq_on_non_duplicable_type? node

          add_offense node, location: :expression, message: MSG
        end
      end
    end
  end
end
