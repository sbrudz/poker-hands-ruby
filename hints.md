# Hints for PokerHands Pairing Exercise

## Work Incrementally
Start with a simple tests, e.g. 

* compare two hands, each with only a "high card" hand

Then add in more complexity

* compare hand with one pair to a high card
* compare two pair hand to one pair hand
* compare two "high card" hands, each with same "high card", go to the next highest card
* and so forth


Let the candidate decide on what classes, method names, etc they want and hopefully evolve the design as they go.  

* Do they need a "Hand" class, or is an array fine
* What class decides the winner
* How are scores calculated
