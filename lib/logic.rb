class Logic
  def initialize(language = 'english')
    @language = language
  end

  def get_word
    dictionary_path = "./assets/#{@language}.txt"
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

  def check_win(word, guesses)
    word.split('').uniq.all? { |letter| guesses.include?(letter) }
  end
end
