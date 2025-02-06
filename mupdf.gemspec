# frozen_string_literal: true

require_relative 'lib/mupdf/version'

Gem::Specification.new do |spec|
  spec.name = 'mupdf'
  spec.version = MuPDF::VERSION
  spec.authors = ['Kevin Sylvestre']
  spec.email = ['kevin@ksylvest.com']

  spec.summary = 'A library for interacting with MuPDF.'
  spec.description = 'Integrate with MuPDF for analyzing and converting PDFs.'
  spec.homepage = 'https://github.com/ksylvest/mupdf'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2.0'

  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = "https://github.com/ksylvest/mupdf/tree/v#{MuPDF::VERSION}"
  spec.metadata['changelog_uri'] = "https://github.com/ksylvest/mupdf/releases/tag/v#{MuPDF::VERSION}"
  spec.metadata['documentation_uri'] = 'https://mupdf.ksylvest.com/'

  spec.files = Dir.glob('{bin,lib,exe}/**/*') + %w[README.md Gemfile]
  spec.require_paths = ['lib']

  spec.add_dependency 'bigdecimal'
  spec.add_dependency 'open3'
  spec.add_dependency 'zeitwerk'
end
