class Logic
  def initialize(language = 'english')
    @language = language
  end

  def getting_word
    dictionary_path = "./assets/#{@language}.txt"
    dictionary = File.readlines(dictionary_path)
    dictionary = dictionary.select { |word| word.length.between?(6, 13) }
    dictionary.sample.gsub("\n", '')
  end

  def check_letter(word, letter)
    word.include?(letter)
  end

  def check_guesses(guesses)
    guesses.zero?
  end

  def check_win(word, guesses)
    word.chars.uniq.all? { |letter| guesses.include?(letter) }
  end

  def check_if_valid(letter, guesses)
    !guesses.include?(letter) && letter.length == 1 && letter.match(/[a-z]/) ? true : false
  end

  def ask_for_input(guesses)
    letter = gets.chomp.downcase
    letter = gets.chomp.downcase until check_if_valid(letter, guesses)
    letter
  end
end
