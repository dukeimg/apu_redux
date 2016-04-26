require './lib/scheme'

describe Scheme do
  describe '.check' do

    let(:scheme) { Scheme.new(:height => 4, :width => 4,
                              :cells => [
                                  ['0', '0', '.', '0'],
                                  ['0', '.', '0', '0'],
                                  ['.', '0', '.', '0'],
                                  ['0', '0', '0', '.']
                              ]) }

    it 'finds close nodes' do
      expect(scheme.check(0, 0)).to eq('0 0 1 0 0 1')
    end

    it 'finds distanced nodes' do
      expect(scheme.check(1, 0)).to eq('0 1 2 1 0 3')
    end

    it 'handling none neighbors' do
      expect(scheme.check(3, 2)).to eq('2 3 -1 -1 -1 -1')
    end

    it 'does not exist' do
      expect(scheme.check(3, 3)).to eq(nil)
    end
  end
end