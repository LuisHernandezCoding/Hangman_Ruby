require_relative '../lib/logic'

describe 'logic' do
  logic = Logic.new
  it 'should take a word from the dictionary and return it' do
    word = logic.get_word
    expect(word).to be_a(String)
    expect(word.length).to be_between(5, 12).inclusive
  end

  it 'should take a letter guess and return if it is in the word' do
    word = 'hangman'
    expect(logic.check_letter(word, 'a')).to be true
    expect(logic.check_letter(word, 'b')).to be false
  end

  it 'should check count of guesses and return if the game is over' do
    word = 'hangman'
    guesses = 5
    expect(logic.check_guesses(word, guesses)).to be false
    guesses = 10
    expect(logic.check_guesses(word, guesses)).to be true
  end

  it 'should check if the player wins' do
    word = 'hangman'
    guesses = %w[h a g m]
    expect(logic.check_win(word, guesses)).to be false
    guesses = %w[h a n g m]
    expect(logic.check_win(word, guesses)).to be true
    word = 'hello'
    expect(logic.check_win(word, guesses)).to be false
    guesses = %w[h e l o]
    expect(logic.check_win(word, guesses)).to be true
  end
end
