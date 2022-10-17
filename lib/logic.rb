class Logic
  # Logic for a hangman game
  # 1 - get a word from the dictionary
  # 2 - check if a letter is in the word
  # 3 - check if the game is over
  
  def initialize(language = 'english') 
    @language = language
  end

  def get_word
    dictionary_path = './assets/' +  @language + '.txt'
    dictionary = File.readlines(dictionary_path)
    dictionary = dictionary.select { |word| word.length.between?(5, 12) }
    word = dictionary.sample
  end

  def check_letter(word, letter)
    word.include?(letter)
  end

  def check_guesses(word, guesses)
    guesses >= word.length
  end
  
end