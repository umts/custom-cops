module RuboCop
  module Cop
    module UmtsCustomCops
      # Prefer the easier-to-read be matcher for non-duplicable types.
      #
      # See the specs for examples.

      # rubocop:disable Metrics/AbcSize
      class BeMatcherForNonDuplicableTypes < Cop
        MSG = 'Prefer `be` matcher to `eq` or `eql` for non-duplicable types.'

        OFFENSE_TYPE_CHECKS = %i(true_type?
                                 false_type?
                                 nil_type?
                                 int_type?
                                 float_type?)

        def autocorrect(node)
          lambda do |corrector|
            matcher = node.child_nodes[1]
            corrector.replace matcher.loc.selector, 'be'
          end
        end

        def on_send(node)
          return unless %i(to not_to).include? node.method_name
          return unless node.child_nodes &&
                        node.child_nodes.first.method_name == :expect
          matcher = node.child_nodes[1]
          return unless %i(eq eql).include? matcher.method_name
          args = matcher.child_nodes.first
          return unless OFFENSE_TYPE_CHECKS.find { |check| args.send check }
          add_offense node, :expression, MSG
        end
      end
    end
  end
end