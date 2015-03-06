# Ironyard Exercises

## EXTRA CREDIT (added 3/5/15)

In JavaScript, given a set of arrays, write a program that will tell me
which arrays contain all the members of the other array:

```javascript
var array1 = [
  { name: 'John', age: 25},
  { name: 'Jane', age: 58},
  { name: 'Josh', age: 12}
]

var array2 = [
  { name: 'Jane', age: 58},
  { name: 'John', age: 25}
]

var array3 = [
  { name: 'John', age: 25},
  { name: 'Jane', age: 58}           
]
```

In this case array2 and array3 are the same but in a different order,
but array1 is not fully contained within array2 (missing Josh). An
example API might look like:


```javascript
array1IsASubsetOf(array2) // false
array2IsASubsetOf(array3) // true
array2IsASubsetOf(array1) // true
```

Write this program in less than five lines of (readable, less than 80 columns wide) code with underscore as
the only dependency and I will buy you lunch (limit 2 first successful attempts). While the main assignment is intended to be done in groups,
this is a solo effort and I will ask for your answers on Tuesday.
Thanks! See you then.

---

# Homework for Jed's lecture on Functional Programming

## How To

Functional Programming is a different way of thinking than Procedural or
Object Oriented programming. Spend some time learning how these three
styles differ (wikipedia might be a great start) and do your best to try
to implement these as described below.

It turns out that Ruby can be more functional (like LISP) [than you might think
](http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/179642).

- solve the problem in Ruby (you need MiniTest installed `gem install
  minitest`)
  - in an imperative/procedural fashion
  - in a functional fashion (hint: use the `Eunumerable` module)
  - in an object oriented fashion

- solve the problem in JavaScript (uses the jasmine-node testing framework—see [Running JS Tests](#running-js-tests) below)
  - to the best of your ability without dependencies
  - with [Underscore](http://underscorejs.org) as a utility library

Solutions have been given, but it doesn't mean they are the best
solutions. My advice is to delete the file contents and work your way
through the problems yourselves. (I hear Nick is giving creativity
points.)

Yes, you may work in groups. No the homework is not graded, but you
won't get much out of the lecture if you have not done this prep and
that would be a waste of time for me and you. If you work with others,
be sure you understand the language decisions made.

## Running JS Tests

1. If you don't have npm installed, run `$ brew install npm`.
2. Install jasmine-node.  To install it globally, run `$ npm install -g jasmine-node`.
3. To run the tests:
  - From inside anagram_javascript, run `$ jasmine-node .`
  - From inside anagram_coffeescript, run `$ jasmine-node . --coffee`.

## Discussion

Come to the lecture 9/19 ready to discuss the following questions.

- What solution in Ruby do you like best? Why?
- Are there patterns from your Ruby solutions that lend themselves to JavaScript solutions?
- Are there conveniences in Ruby you wish you had in JavaScript? Why?

## Feedback/Questions

Open a github issue. I'll gladly answer any questions.

## Credits

Both problems take from [exercism.io](http://exercism.io) but problems
in that application are served rather than picked so this just uses a
problem that is solved in roughly equal terms in several languages. 

