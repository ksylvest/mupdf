# frozen_string_literal: true

RSpec.describe MuPDF::Document do
  subject(:document) { described_class.new(pathname) }

  let(:pathname) { 'spec/fixtures/file.pdf' }

  describe '#info' do
    subject(:info) { document.info }

    it { expect(info).to be_a(MuPDF::Info) }
    it { expect(info.pages).to eq(2) }
  end

  describe '#pages' do
    subject(:pages) { document.pages }

    it { expect(pages).to all(be_a(MuPDF::Page)) }
    it { expect(pages.size).to eq(2) }
  end

  describe '#draw' do
    subject(:draw) { document.draw(path: tempfile.path, page: 2, format: 'png') }

    let(:tempfile) { Tempfile.new(['mupdf', '.png']) }

    around do |example|
      example.run
    ensure
      tempfile.close
      tempfile.unlink
    end

    it 'draws' do
      draw
      expect(File.size(tempfile.path)).to be > 0
    end
  end
end
