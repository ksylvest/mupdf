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
end
