# frozen_string_literal: true

module MuPDF
  # A bounding box for a PDF (e.g. media / crop / bleed / trim).
  class Box
    REGEX = /l="(?<l>\d+)" b="(?<b>\d+)" r="(?<r>\d+)" t="(?<t>\d+)"/

    # @!attribute l
    #   @return [String] The left coordinate.
    attr_reader :l

    # @!attribute b
    #   @return [String] The bottom coordinate.
    attr_reader :b

    # @!attribute r
    #   @return [String] The right coordinate.
    attr_reader :r

    # @!attribute t
    #   @return [String] The top coordinate.
    attr_reader :t

    # @!attribute kind
    #   @return [Symbol] The kind of box.
    attr_reader :kind

    # @param text [String]
    # @param kind [Symbol]
    #
    # @return [MuPDF::Box]
    def self.parse(text, kind:)
      match = text.match(REGEX)

      new(
        l: Integer(match[:l]),
        b: Integer(match[:b]),
        r: Integer(match[:r]),
        t: Integer(match[:t]),
        kind:
      )
    end

    # @param l [Integer]
    # @param b [Integer]
    # @param r [Integer]
    # @param t [Integer]
    # @param kind [Symbol] optional
    def initialize(l:, b:, r:, t:, kind: nil)
      @l = l
      @b = b
      @r = r
      @t = t
      @kind = kind
    end

    # @return [String]
    def inspect
      "#<#{self.class.name} l=#{l} b=#{b} r=#{r} t=#{t} kind=#{kind}>"
    end

    # @return [Integer]
    def width
      @r - @l
    end

    # @return [Integer]
    def height
      @t - @b
    end
  end
end
