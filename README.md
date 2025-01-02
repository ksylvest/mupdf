# MuPDF

[![LICENSE](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/ksylvest/mupdf/blob/main/LICENSE)
[![RubyGems](https://img.shields.io/gem/v/mupdf)](https://rubygems.org/gems/mupdf)
[![GitHub](https://img.shields.io/badge/github-repo-blue.svg)](https://github.com/ksylvest/mupdf)
[![Yard](https://img.shields.io/badge/docs-site-blue.svg)](https://mupdf.ksylvest.com)
[![CircleCI](https://img.shields.io/circleci/build/github/ksylvest/mupdf)](https://circleci.com/gh/ksylvest/mupdf)

## Installation

```bash
gem install mupdf
```

## Usage

### Document

A `MuPDF::Document` wraps a PDF file:

```ruby
document = MuPDF::Document.new('./file.pdf')
```

#### Info

The `info` command displays information about the document such as the number of pages:

```ruby
info = document.info
info.pages # e.g. 2
```
