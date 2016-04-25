require './lib/apu'

describe 'Apu' do
  it 'finds right close node' do
    @width = 2
    @height = 1
    @cells = ['0' '0']
    expect(check(0, 0)).to eq('0 0 1 0 -1 -1')
  end

  it 'finds right distanced node' do
    @width = 3
    @height = 1
    @cells = ['0' '.' '0']
    expect(check(0, 0)).to eq('0 0 2 0 -1 -1')
  end

  it 'finds bottom close node' do
    @width = 1
    @height = 2
    @cells = [['0'], ['0']]
    expect(check(0, 0)).to eq('0 0 -1 -1 0 1')
  end

  it 'finds bottom distanced node' do
    @width = 1
    @height = 5
    @cells = [['0'], ['.'], ['.'], ['.'], ['0']]
    expect(check(0, 0)).to eq('0 0 -1 -1 0 4')
  end

  it 'has no neighbors' do
    @width = 2
    @height = 2
    @cells = [['0', '.'], ['.', '0']]
    expect(check(0, 0)).to eq('0 0 -1 -1 -1 -1')
  end

  it 'does not exist' do
    @width = 2
    @height = 2
    @cells = [['.', '0'], ['0', '0']]
    expect(check(0, 0)).to eq(nil)
  end

end