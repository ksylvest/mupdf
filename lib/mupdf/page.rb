# frozen_string_literal: true

module MuPDF
  # A wrapper for a PDF page within a PDF document.
  class Page
    REGEX = %r{<page pagenum="(?<pagenum>\d+)">(?<content>.*?)</page>}m
    MEDIA_BOX_REGEX = %r{<MediaBox (?<content>.*?) />}
    CROP_BOX_REGEX = %r{<CropBox (?<content>.*?) />}
    ART_BOX_REGEX = %r{<ArtBox (?<content>.*?) />}
    BLEED_BOX_REGEX = %r{<BleedBox (?<content>.*?) />}
    TRIM_BOX_REGEX = %r{<TrimBox (?<content>.*?) />}

    # @param text [String]
    #
    # @return [Array<MuPDF::Page>]
    def self.parse(text)
      text.scan(REGEX).map do |number, content|
        new(
          media_box: parse_media_box(content),
          crop_box: parse_crop_box(content),
          art_box: parse_art_box(content),
          bleed_box: parse_bleed_box(content),
          trim_box: parse_trim_box(content),
          number: Integer(number)
        )
      end
    end

    # @param text [String]
    #
    # @return [MuPDF::Box, nil]
    def self.parse_media_box(text)
      match = MEDIA_BOX_REGEX.match(text)
      return unless match

      MuPDF::Box.parse(match[:content], kind: :media)
    end

    # @param text [String]
    #
    # @return [MuPDF::Box, nil]
    def self.parse_crop_box(text)
      match = CROP_BOX_REGEX.match(text)
      return unless match

      MuPDF::Box.parse(match[:content], kind: :crop)
    end

    # @param text [String]
    #
    # @return [MuPDF::Box, nil]
    def self.parse_art_box(text)
      match = ART_BOX_REGEX.match(text)
      return unless match

      MuPDF::Box.parse(match[:content], kind: :art)
    end

    # @param text [String]
    #
    # @return [MuPDF::Box, nil]
    def self.parse_bleed_box(text)
      match = BLEED_BOX_REGEX.match(text)
      return unless match

      MuPDF::Box.parse(match[:content], kind: :bleed)
    end

    # @param text [String]
    #
    # @return [MuPDF::Box, nil]
    def self.parse_trim_box(text)
      match = TRIM_BOX_REGEX.match(text)
      return unless match

      MuPDF::Box.parse(match[:content], kind: :trim)
    end

    # @!attribute media_box
    #   @return [MuPDFBox, nil]
    attr_accessor :media_box

    # @!attribute crop_box
    #   @return [MuPDFBox, nil]
    attr_accessor :crop_box

    # @!attribute art_box
    #   @return [MuPDFBox, nil]
    attr_accessor :art_box

    # @!attribute bleed_box
    #   @return [MuPDFBox, nil]
    attr_accessor :bleed_box

    # @!attribute trim_box
    #   @return [MuPDFBox, nil]
    attr_accessor :trim_box

    # @!attribute number
    #   @return [Integer]
    attr_accessor :number

    # @param media_box [MuPDF::Box]
    # @param crop_box [MuPDF::Box]
    # @param art_box [MuPDF::Box]
    # @param bleed_box [MuPDF::Box]
    # @param trim_box [MuPDF::Box]
    # @param number [Integer]
    def initialize(media_box:, crop_box:, art_box:, bleed_box:, trim_box:, number:)
      @media_box = media_box
      @crop_box = crop_box
      @art_box = art_box
      @bleed_box = bleed_box
      @trim_box = trim_box
      @number = number
    end

    # @return [String]
    def inspect
      "#<#{self.class.name} number=#{@number} width=#{width} height=#{height}>"
    end

    # @return [Integer, nil]
    def width
      @media_box&.width
    end

    # @return [Integer, nil]
    def height
      @media_box&.height
    end
  end
end
