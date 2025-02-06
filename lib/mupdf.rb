# frozen_string_literal: true

require 'bigdecimal'
require 'open3'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect 'mupdf' => 'MuPDF'
loader.setup

# An interface to [MuPDF](https://mupdf.com/) for managing PDFs.
module MuPDF
  class Error < StandardError; end

  # @usage
  #   MuPDF.mutool('info', 'file.pdf')
  #
  # @param cmd [Array<String>] e.g. ['info', 'file.pdf']
  # @raise [ToolError]
  #
  # @return [String]
  def self.mutool(*cmd)
    result, status = Open3.capture2e('mutool', *cmd)
    raise CommandError.new(cmd:, result:, status:) unless status.success?

    result
  end
end
