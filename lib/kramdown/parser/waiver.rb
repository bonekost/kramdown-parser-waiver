require 'kramdown/parser/kramdown'

module Kramdown
  module Parser
    class Waiver < Kramdown::Parser::Kramdown

      def initialize(source, options)
        super
        text_input_parser = :text_input
        @span_parsers << :text_input
      end

      INPUT_MATCH = /\w* = __/.freeze
      INPUT_NAME = /\w*/.freeze

      def parse_text_input
        result = @src.scan(INPUT_MATCH)
        saved_pos = @src.save_pos
        input_name = INPUT_NAME.match(result).to_s
        el = Element.new(:html_element, :input, {name: input_name, id: input_name})
        @tree.children << el
      end
      define_parser(:text_input, INPUT_MATCH)
    end
  end
end