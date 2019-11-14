### README - Object oriented 21 with bonus features

#### **Features**

* One single game of 21
* Explanation of rules and ascii cards
* Waits for user to finish reading
* Hide all but first dealer cards until player has finished
* Ascii-art cards
* Fully validated input

#### **Things to improve on**

* Add replay feature
* 'Rendering' into a buffer and drawing that when necessary
* Better deck shuffling and proper usage
* Money betting

#### **Design choices and approach**

Since my last project was pretty much designed on paper and
then implemented and that still gave me many issues down the
road, I decided to go with the following technique:

1. Define requirements
2. Describe game as narrative
3. Extract major nouns and verbs
4. Relate these nouns and verbs into classes with
   attributes and behaviour
5. Write a 'spike', take notes on needed functionality
6. Build up from there

I have come to the first, early conclusion, that organizing
even simple games, like this one, or slightly more complex
ones, on paper or by building it up exclusively is, at least
at my level of experience, impossible.

There is always unexpected stuff, requirements, or problems
are just really hard to solve in a way that rubocop does
not complain about liine length, method length etc.

Although annoying, this got me into thinking about my designs
more, and I actually learned that some of these sentences
experiences programmers throw around are actually true, in onoe
form or another.

I aimed for a very clean game loop, that looked something like
the following:

```ruby
# Game21 class
def play
  display_welcome
  display_rules

  player_choice
  determine_game_over
  
  dealer_choice

  determine_winner
  display_winner

  display_goodybe  
end
```

I though I could, rather easily but with time, implement method
that looks as clean as the above example, but I did not understant
the trade-offs I hade to make, not consciously anyway and not at my
level of profiency.

The more classes I add, the more interconnections there are.
The the more interconnections, the more 'in-between object
translation' there is.
The more objects we pass around, the more can go wrong, or the more
we have to potentially fix.

I played with the Participant class to handle the looping until the
player is bust of chose 'stay' in order to oofload that logic into
one clean method call. Although this implementation was pretty easy,
it showed me that offloading logic to somewhere else, especially to
another, more specific object, forces me to implement a way to
communicate any state necessary to the outside of that implementation,
if needed, and that any unforseen/overlooked functionality is
potentially hard to implement, or ends up breaking an initially clean
design.

This, is a hard game to play.

#### **OO design**

#### **Method access levels: public, private, protected**

It seems that there are quite a few ways to define the access levels
of methods, but in general, and as I was told, it seems to be easier
to parse when public methods are up top and private/protected ones at
the end of class definitions. Making many context switched between
access level types seems like an obviously bad idea.

The less places we need to look for what is what, the better.

I like the idea and look of just defining methods when/where they
make sense without worrying about what it's eventual acces rights
are, and the in the end, when the interface and implementation is
clear, use the 'acces right' methods in one obvious place in the
class definition. The following exmample demonstrates what seems
most logical to me:

```ruby
class SomeClass
  public :b
  private :a, :c

  def a; end
  def b; end
  def c; end
end
```

But in this assignment I just took the 'private/protected method at
the bottom, the rest up top' approach. It works, it's just that I
think it's really hard to read, one has to look at a few places to
find out what is what and I think it may be easier to break.

##### **Game21 class**

This class is the orchestrates the player and dealer
objects, keeps track of the winner and at what point
in the game the dealer is to be revealed.

Most of the output is generated and output here and any
data needed is receied from the objects themselves.

##### **Participant class**

This superclass, from which both Player and Dealer
inherit from, keeps track of each players' cards,
if the player in question is bust and caches the hand
value. Furthermore, this class makes the player in
question choose until the choice is 'stay' or the 
player is bust.

This class gets the player and dealer choice through the
`choose_stay_or_hit` method, which both the Dealer and
Player class handle differently, but the return value is
always a valid object representing either `hit` or `stay`.

In additiona, this class is also responsible to draw the
players' cards in ascii art horizontally and houses the
logic to compare the players against each other's hand
values.

##### **Dealer and Player classes (inherit from Participant)**

The Dealer class is the one that keeps track of the
deck and the only class that can deal cards, which is
why the dealer object is passed around where a card
needs to be dealt.

The `choose_until_stay_or_bust` is overriden in the Dealer
class in order to avoid passing the Dealer version of the
method the dealer object itself. So the overriden method
calls the next higher up method version through super with
itself as the dealer object, which removed the need for us
to explicitly pass it.

##### **Card and Deck classes**

The card class keeps track of the card attributes such as
type (Ace, King, Queen, Jack, 10, etc.), it's face value
defined by the game 21 and is responsible to generate the
card's ascii art lines.

The Deck class is responsible to generate a 52 card deck
by combining the 4 suits and the 13 types of cards into an
list of cards and is the only object  that can shuffle and
get a card from the deck.