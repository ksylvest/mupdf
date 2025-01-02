# frozen_string_literal: true

RSpec.describe MuPDF::Document do
  subject(:document) { described_class.new(pathname) }

  let(:pathname) { 'spec/fixtures/file.pdf' }

  describe '#info' do
    it { expect(document.info).to be_a(MuPDF::Info) }
    it { expect(document.info.pages).to eq(2) }
  end
end
