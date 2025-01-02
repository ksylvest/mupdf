# frozen_string_literal: true

RSpec.describe MuPDF do
  it 'has a version number' do
    expect(MuPDF::VERSION).not_to be_nil
  end

  describe '.mutool' do
    context 'with a valid command' do
      subject(:mutool) { described_class.mutool('info', 'spec/fixtures/file.pdf') }

      it 'returns' do
        expect { mutool }.not_to raise_error
      end
    end

    context 'with an invalid command' do
      subject(:mutool) { described_class.mutool('info', 'spec/fixtures/fake.pdf') }

      it 'raises' do
        expect { mutool }.to raise_error(MuPDF::CommandError)
      end
    end
  end
end
