# frozen_string_literal: true

RSpec.describe MuPDF::Page do
  describe '.parse' do
    subject(:parse) { described_class.parse(text) }

    let(:text) do
      <<~TEXT
        spec/fixtures/file.pdf:
        <page pagenum="1">
        <MediaBox l="0" b="0" r="612" t="792" />
        <CropBox l="0" b="0" r="612" t="792" />
        <ArtBox l="0" b="0" r="612" t="792" />
        <BleedBox l="0" b="0" r="612" t="792" />
        <TrimBox l="0" b="0" r="612" t="792" />
        </page>
        <page pagenum="2">
        <MediaBox l="0" b="0" r="612" t="792" />
        <CropBox l="0" b="0" r="612" t="792" />
        <ArtBox l="0" b="0" r="612" t="792" />
        <BleedBox l="0" b="0" r="612" t="792" />
        <TrimBox l="0" b="0" r="612" t="792" />
        </page>
      TEXT
    end

    it { expect(parse).to all(be_a(described_class)) }
    it { expect(parse.size).to eq(2) }
  end
end
