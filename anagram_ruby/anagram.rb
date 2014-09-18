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

# OO version
class Anagram

  def initialize(word)
    @word = AnagramSubject.new(word)
  end

  def match(arr)
    arr.select {|word| @word.anagram_of?(word) }
  end
end

class AnagramSubject
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def anagram_of?(word)
    subject = klass.new(word)
    return false if duplicate?(subject)
    fingerprint == subject.fingerprint
  end

  def fingerprint
    @fingerprint ||= canonicalize(@word)
  end

  private

  def duplicate?(subject)
    @word == subject.word
  end

  def canonicalize(word)
    word.chars.sort
  end

  def klass
    self.class
  end

end

# functional
#
class Anagram
  def initialize(word)
    @word = word
  end

  def match(arr)
    arr.inject({}, &to_hash)
       .reject(&duplicates)
       .select(&fingerprints)
       .map(&from_hash)
  end

  def fingerprint(word)
    word.downcase.chars.sort
  end

  def to_hash
    matcher = fingerprint(@word)

    ->(memo, word) {
      obj = {
        fingerprint: fingerprint(word),
        matcher: matcher
      }
      memo[word] = obj
      memo
    }
  end

  def duplicates
    downcased = @word.downcase
    ->(key, value) { downcased == key.downcase }
  end

  def fingerprints
    ->(key, value) { value[:matcher] == value[:fingerprint] }
  end

  def from_hash
    ->((key, value)) { key }
  end

end
