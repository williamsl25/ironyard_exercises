function anagram( match ){

  var _match = anagramSubject( match )

  return { matches: matches }

  function matches(arr) {
    var arr = ( (arr instanceof Array) ? arr : _toArray(arguments) )
    return arr.map( toSubject ).filter( duplicates ).map( identity )
  }

  // helpers
  function identity( word )   { return word.identity() }
  function toSubject( word )  { return anagramSubject(word) }
  function duplicates( word ) { return _match.duplicate(word) === true }
}

module.exports = anagram


function anagramSubject( word ){

  return {
    fingerprint: canonicalize( word ),
    lowerCased: word.toLowerCase(),

    duplicate: function( otherWord ){
      if ( this.sameWord( otherWord ) ) { return false }
      else { return this.fingerprint === otherWord.fingerprint }
    },

    identity: function(){ return word },

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

