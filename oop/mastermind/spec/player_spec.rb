require './lib/player.rb'

describe 'Player' do
  describe 'new' do
    it 'initializes with Name' do
      player = Player.new('Roland')
      expect( player.name ).to eq('Roland')
    end
  end

  it 'prompts for guess' do
    player = Player.new('Roland')
    guess = player.prompt_for_guess("1234")
    expect( guess ).to be_a( Array )
    expect( guess.length ).to be 4
    expect( guess.all? {|i| i.kind_of?(Fixnum) } ).to be true
  end

  it 'prompts for secret code' do
    player = Player.new('Roland')
    code = player.prompt_for_secret_code("1234")
    expect( code ).to be_a( Array )
    expect( code.length ).to be 4
    expect( code.all? {|i| i.kind_of?(Fixnum) } ).to be true
  end
end