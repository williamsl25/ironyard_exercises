function anagramSubject( word ){

  return {
    fingerprint: canonicalize( word ),

    lowerCased: word.toLowerCase(),

    isMatch: function( otherWord ){
      return this.fingerprint === otherWord.fingerprint
    },

    original: function(){ return word },

    sameWord: function( otherWord ){
      return this.lowerCased === otherWord.lowerCased
    }
  }

  function canonicalize( str ){
    return str.toLowerCase().split('').sort().join('')
  }
}

module.exports = anagramSubject
