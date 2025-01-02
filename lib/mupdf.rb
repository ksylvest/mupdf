# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect 'mupdf' => 'MuPDF'
loader.setup

module MuPDF
  class Error < StandardError; end
end
