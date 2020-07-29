require 'kramdown/parser/kramdown'

module Kramdown
  module Parser
    class Waiver < Kramdown::Parser::Kramdown

      def initialize(source, options)
        super
        text_input_parser = :text_input
        @block_parsers << :text_input
      end

      def parse
        super
      end

      INPUT_MATCH = /\w* = __/.freeze
      define_parser(:text_input, INPUT_MATCH)

      def parse_text_input
        byebug
      end
    end
  end
end