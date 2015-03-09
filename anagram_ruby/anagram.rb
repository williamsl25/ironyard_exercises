# Imperative
#
class Anagram

  def initialize(word)
    @match = word.downcase
  end

  def match(arr)
    result = []
    arr.each do |word|
      downcased = word.downcase
      matcher = @match.chars.sort
      unless @match == downcased
        result << word if matcher == downcased.chars.sort
      end
    end
    result
  end
end

# Imperative
#
class Anagram
  attr_accessor :word
# Return an array of matching anagrams. If no match can be found,
# return an emtpy array.
  def initialize (string)
    self.word = string.downcase
  end
# a term is an anagram if the sum of the character codes are equal to the sum of the character codes of the target string
  def match choice
    choice.select { |entry| entry if entry.downcase.split(//).sort == self.word.downcase.split(//).sort && entry.downcase != self.word.downcase} 
  end
end

  
