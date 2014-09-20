var anagramSubject = require('./anagram_subject')
var _toArray = require('./to_array')

function anagram( match ){

  var _match = anagramSubject( match )


  function matches( arr ) {
    arr = ( (arr instanceof Array) ? arr : _toArray(arguments) )
    return arr.map( toSubject )
              .filter( uniq )
              .filter( isMatch )
              .map( fromSubject )
  }

  return { matches: matches }

  // helpers
  function uniq( word )         { return !_match.sameWord( word ) }
  function isMatch( word )      { return _match.isMatch( word )   }
  function toSubject( word )    { return anagramSubject( word )   }
  function fromSubject( word )  { return word.original() }
}

module.exports = anagram


