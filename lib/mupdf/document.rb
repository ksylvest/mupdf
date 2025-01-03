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

    # @raise [MuPDF::CommandError]
    #
    # @return [MuPDF::Info]
    def info
      @info ||= begin
        result = MuPDF.mutool('info', String(@pathname))
        MuPDF::Info.parse(result)
      end
    end

    # @raise [MuPDF::CommandError]
    #
    # @return [Array<MuPDF::Page>]
    def pages
      @pages ||= begin
        result = MuPDF.mutool('pages', String(@pathname))
        MuPDF::Page.parse(result)
      end
    end
  end
end
