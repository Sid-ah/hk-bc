# Stage Directions for Quad

## Summary
[Samuel Beckett](http://en.wikipedia.org/wiki/Samuel_Beckett) was a Nobel-prize-winning author, poet, and playwright.  In 1981 Beckett wrote and broadcast his play *[Quad](http://en.wikipedia.org/wiki/Quad_%28play%29)*. There are four actors in the play, each dressed in a colored robe:  white, blue, red, and yellow.  The set consists of a small square stage. The stage begins empty.  Then the first actor enters.  As the play progresses, actors enter and exit one at a time.  But the stage directions have an interesting property: each combination of actors appears on the stage once and only once throughout the play, and the play ends once the final actor is on the stage.

We're going to write a `quad_stage_directions` method which takes as its input an array of unique actors and returns a list of stage directions to create a *Quad*-like play with those actors. Rather than reporting on who entered or who left, we'll report on who is on the stage at that moment in time.


### Rules
Following these rules, our method should be able to create stage directions for plays with zero to four actors (see [example output][]).

- The stage begins empty.
- Actors enter and leave the stage one at a time, so neighboring combinations of actors should only differ by one actor.
- Each combination of actors must appear on stage exactly one time: each single actor, each pair, each trio, etc.  Ordering within a combination does not matter.
- The play ends with a single actor on stage.


### Quad Video
If the description of the play is a little opaque, there is a [video](https://www.youtube.com/embed/GMnKDGfpV7c?rel=0) which will give you the general notion.  However, note that this video does not exactly follow the same rules we'll be working with <sup id="footnote-link-1">1</sup>.  It also starts somewhere in the middle of the play.


## Releases
### Release 0: Pseudocode the Algorithm
Before we start coding, we need to understand how the the stage directions work.  We've been provided with some [example output], and there are also tests that describe the behavior of our method.  Before we begin, let's take some time to extract patterns from the expected outputs.  If necessary, we should use pen and paper, colored index cards, sticky notes, or whatever and use them to represent which actors are on stage at a given time.

If we don't see the pattern it will be impossible to implement it in Ruby.  Do we see how we can get the stage directions for three actors from the directions for two?  Or the directions for four actors from those for three?  Does an iterative or recursive solution feel more appropriate?

Once we see the pattern, let's pseudocode an algorithm that will build the stage directions for us.


### Release 1: Translate from Pseudocode to Ruby
Now it's time to implement our thinking into code.  We have tests that can guide us as we implement our solution.  We can start with the simpler examples (e.g., zero actors or one actor) and build toward the more complex behaviors (e.g., four actors).


## Conclusion
This is another challenge designed for us to practice problem solving.  We've had to understand a set of rules and then translate them into code.

-

*Footnotes*  
1.  Anyone who watched the whole video might have noticed that the same actors appear on stage at the same time. In addition to his other requirements, Beckett also wanted the actor exiting the stage to be the one who had been on the stage the longest (i.e., first-in, first-out). It turned out that this was impossible after listing out all possible 4-actor stagings, so one of the requirements had to go.  Beckett chose to remove the requirement that the same set of actors never appear on stage twice rather than the requirement that the actor exiting the stage be the actor who's been on stage the longest. In the interest of creating a solvable challenge, the first-in, first-out requirement was removed.  For five, six, seven, and eight actors there are actually many different sets of stage directions which satisfy all of Beckett's requirements, but they're hard to find without the aid of a computer. The first such set of stage directions for seven actors took months of computing time.

[example output]: readme-assets/example-output.md
