function anagram( match ){

  var _match = anagramSubject( match )

  return { matches: matches }

  function matches(arr) {
    arr = ( (arr instanceof Array) ? arr : _toArray(arguments) )
    return arr.map( toSubject )
              .filter( uniq )
              .filter( isMatch )
              .map( fromSubject )
  }

  // helpers
  function uniq( word )         { return !_match.sameWord( word ) }
  function isMatch( word )      { return _match.isMatch( word ) }
  function toSubject( word )    { return anagramSubject( word ) }
  function fromSubject( word )  { return word.original() }
}

module.exports = anagram


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

function _toArray(args){
  return Array.prototype.slice.call(args)
}


