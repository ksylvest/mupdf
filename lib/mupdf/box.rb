# frozen_string_literal: true

module MuPDF
  # A bounding box for a PDF (e.g. media / crop / bleed / trim).
  class Box
    REGEX = /l="(?<l>\d+.?\d*)" b="(?<b>\d+.?\d*)" r="(?<r>\d+.?\d*)" t="(?<t>\d+.?\d*)"/

    # @!attribute l
    #   @return [BigDecimal] The left coordinate.
    attr_reader :l

    # @!attribute b
    #   @return [BigDecimal] The bottom coordinate.
    attr_reader :b

    # @!attribute r
    #   @return [BigDecimal] The right coordinate.
    attr_reader :r

    # @!attribute t
    #   @return [BigDecimal] The top coordinate.
    attr_reader :t

    # @!attribute kind
    #   @return [BigDecimal] The kind of box.
    attr_reader :kind

    # @param text [String]
    # @param kind [Symbol]
    #
    # @return [MuPDF::Box, nil]
    def self.parse(text, kind:)
      match = text.match(REGEX)
      return unless match

      new(
        l: BigDecimal(match[:l]),
        b: BigDecimal(match[:b]),
        r: BigDecimal(match[:r]),
        t: BigDecimal(match[:t]),
        kind:
      )
    end

    # @param l [BigDecimal]
    # @param b [BigDecimal]
    # @param r [BigDecimal]
    # @param t [BigDecimal]
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

    # @return [BigDecimal]
    def width
      @r - @l
    end

    # @return [BigDecimal]
    def height
      @t - @b
    end
  end
end
