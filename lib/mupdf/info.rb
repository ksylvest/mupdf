# frozen_string_literal: true

module MuPDF
  # A wrapper for the result of a `mutool info ...` command.
  class Info
    PARSE_REGEX = /^Pages: (?<pages>\d+)$/

    # @!attribute description
    #   @return [String] The description of the task.
    attr_reader :pages

    # @param text [String]
    #
    # @return [MuPDF::Info]
    def self.parse(text)
      match = text.match(PARSE_REGEX)
      new(pages: Integer(match[:pages]))
    end

    # @param pages [Integer]
    def initialize(pages:)
      @pages = pages
    end
  end
end
