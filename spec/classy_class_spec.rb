RSpec.describe ClassyClass do
  let(:stacey_instance) { described_class.new }
  describe '#exists?' do
    it 'outputs a confirmation that it exists' do
      expect { stacey_instance.exists? }.to output("Yes\n").to_stdout
    end
  end
end