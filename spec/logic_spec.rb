require '../lib/logic'

describe 'logic' do
  it 'should take a word from the dictionary and return it' do
    word = get_word
    expect(word).to be_a(String)
    expect(word.length).to be_between(5, 12).inclusive
  end

  it 'should take a letter guess and return if it is in the word' do
    word = 'hangman'
    expect(check_letter(word, 'a')).to be true
    expect(check_letter(word, 'b')).to be false
  end

  it 'should check count of guesses and return if the game is over' do
    word = 'hangman'
    guesses = 5
    expect(check_guesses(word, guesses)).to be false
    guesses = 10
    expect(check_guesses(word, guesses)).to be true
  end
end
