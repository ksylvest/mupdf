# frozen_string_literal: true

RSpec.describe MuPDF::Info do
  describe '.parse' do
    subject(:parse) { described_class.parse(text) }

    let(:text) do
      <<~TEXT
        PDF-1.3
        Pages: 2
      TEXT
    end

    it { is_expected.to be_a(described_class) }
    it { expect(parse.pages).to eq(2) }
  end
end
