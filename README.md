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

_This project requires `mutool` be installed on your system. To verify ensure the following works:_

```bash
mutool
```

To install `mutool` on MacOS use:

```bash
brew install mupdf
```

To install `mutool` on Ubuntu use:

```bash
apt-get install mupdf
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

#### Pages

The `pages` command finds sizing information about the pages within a document:

```ruby
pages = document.pages
pages.count # e.g. 2
page = pages[0]
page.pagenum # 1
box = page.media_box # page.crop_box / page.bleed_box / page.trim_box / page.art_box
box.width # 612
box.height # 792
```
