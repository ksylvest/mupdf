# frozen_string_literal: true

module MuPDF
  # A wrapper for a PDF document allowing for MuPDF APIs.
  class Document
    # @param pathname [Pathname]
    def initialize(pathname)
      @pathname = pathname
    end

    # @return [String]
    def inspect
      "#<#{self.class.name} pathname=#{@pathname}>"
    end

    # @usage
    #   document.info #=> #<MuPDF::Info ...>
    #
    # @raise [MuPDF::CommandError]
    #
    # @return [MuPDF::Info]
    def info
      @info ||= begin
        result = MuPDF.mutool('info', String(@pathname))
        MuPDF::Info.parse(result)
      end
    end

    # @usage
    #   pages = document.pages #=> [#<MuPDF::Page ...>, ...]
    #   pages.each do |page|
    #     puts page.number # e.g. 1, 2, 3, ...
    #     puts page.width # e.g. 612
    #     puts page.height # e.g. 792
    #   end
    #
    # @raise [MuPDF::CommandError]
    #
    # @return [Array<MuPDF::Page>]
    def pages
      @pages ||= begin
        result = MuPDF.mutool('pages', String(@pathname))
        MuPDF::Page.parse(result)
      end
    end

    # @usage
    #   Tempfile.open(['mupdf', '.png']) do |tempfile|
    #     document.draw(path: tempfile.path, page: 2, format: 'png')
    #   end
    #
    # @param path [String] the path where the conversion is saved
    # @param format [String] "png", "svg", "txt", etc
    # @param page [Integer] the page
    # @param resultion [Integer] optional (default: 72)
    # @param width [Integer] optional
    # @param height [Integer] optional
    #
    # @raise [MuPDF::CommandError]
    def draw(path:, page:, format: 'png', width: nil, height: nil, resolution: nil)
      args = ['draw', '-o', path, '-F', format, String(@pathname), String(page)]

      args << '-w' << width if width
      args << '-h' << height if height
      args << '-r' << resolution if resolution

      MuPDF.mutool(*args)
    end
  end
end
