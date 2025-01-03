# frozen_string_literal: true

RSpec.describe MuPDF::Box do
  describe '.parse' do
    subject(:parse) { described_class.parse(text, kind: :media) }

    let(:text) { '<MediaBox l="0" b="0" r="612" t="792" />' }

    it { is_expected.to be_a(described_class) }
    it { expect(parse.l).to eq(0) }
    it { expect(parse.b).to eq(0) }
    it { expect(parse.r).to eq(612) }
    it { expect(parse.t).to eq(792) }
    it { expect(parse.width).to eq(612) }
    it { expect(parse.height).to eq(792) }
  end
end
