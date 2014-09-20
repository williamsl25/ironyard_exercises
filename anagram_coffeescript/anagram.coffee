class AnagramSubject
  constructor: (word)->
    @word = word.toLowerCase()
    # the spec was not checking for case insensitivity of anagrams
    # aka the 'Orchestra' -> 'Carthorse' problem
    # now it is, so we need store a copy of the original word to recall later
    @original = word

  fingerprint: ->
    # memoize this computation for efficiency
    @_fingerprint ?= @word.split('').sort('').join('')

  isEqual: (anotherWord)->
    # return false immediately if the words are the same
    return false if @word == anotherWord.word

    # evaluate if their canonical versions are equal
    @fingerprint() == anotherWord.fingerprint()

class Anagram

  # helper functions `toSubject` and `matches` exist on the instance but without the
  # context of 'this' aka '@'. This is a way to create functions that
  # are inside the instance but are 'private' to users outside the class.
  # One of the few privacy techniques in JavaScript

  # a function that returns a new instance of the AnagramSubject class
  toSubject = ( str )-> new AnagramSubject( str )

  # a partially applied function that _returns_ a new function
  # configured for the instance. This is necessary here because this
  # is not a class method (like constructor or match) so we have no reference to
  # @anagramSubject. If we configure our function inside the instance method then
  # we can pass in the reference we need.
  # This goes back to our code vs data discussion. this function is pure code;
  # data is provided 'at runtime'
  matches = ( anagramSubject )->
    ( otherWord )-> anagramSubject.isEqual( otherWord )

  constructor: ( word )->
    @anagramSubject = new AnagramSubject( word )

  match: ( strings... )->
    # there are a couple other ways to do this but there is
    # no specific CoffeeScript way for this case
    # this is analogous to calling
    # `Array.prototype.concat.apply( [], strings )`
    # but with the CoffeeScript sugar for prototype `::`
    strings = Array::concat.apply( [], strings )

    # here is our partially applied function
    # matcher is a function waiting to be called with
    # each word passed to it from filter
    matcher = matches( @anagramSubject )

    # returns the original copy of the word
    fromSubject = ( anagramSubject )-> anagramSubject.original

    # apply toSubject to all the words, find the ones that match
    # via our matcher function and then get the original version of the
    # word back from the AnagramSubject instance
    # notice since these are not methods on the instance we don't call with
    # `@` aka `@toSubject`
    strings.map( toSubject ).filter( matcher ).map( fromSubject )

# an alternative (maybe better) implementation
# by passing a string to the comparison, and creating
# the comparison object inside the isEqual method we:
# - don't have to remember what the original word was
# - we don't have to map to and from the comparison class
# however,
# - it is always nicer for comparisons to compare two equal things
# ultimately this is a personal judgment call
class AnagramSubject
  constructor: (word)->
    @word = word.toLowerCase()

  fingerprint: ->
    @_fingerprint ?= @word.split('').sort('').join('')

  isEqual: (string)->
    anotherWord = new AnagramSubject(string)
    return false if @word == anotherWord.word

    @fingerprint() == anotherWord.fingerprint()

class Anagram

  matches = ( anagramSubject )->
    ( string )-> anagramSubject.isEqual( string )

  constructor: ( word )->
    @anagramSubject = new AnagramSubject( word )

  match: ( strings... )->
    strings = Array::concat.apply( [], strings )
    matcher = matches( @anagramSubject )
    strings.filter( matcher )



module.exports = Anagram
