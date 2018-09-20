# Debugging; Unlearning

## Reflect & Review (5 min)

- What have we been learning?
- What obstacles have you encountered?

Bucket questions/topic suggestions into Punt, Research, Breakout.

## Meta-learning (5 min)

### Unlearning

Humans are hard-wired to make assumptions and to use pattern recognition to fill in the vast gaps in our empirical knowledge. Often those assumptions are wrong.

The most adaptive minds are able to recognize their own fallibility and to respond to new stimuli with curiosity and inquiry rather than surprise and discomfort.

Learning a new language (human or computer) requires that we be willing and able to unlearn old assumptions in order to make room for new information.

#### Techniques for unlearning

When you come upon something that you don't fully understand, identify the parts.

Group the component parts of a problem (the sub-procedures, methods, tools, etc.) into the things you understand, the things you think that you understand, and the things that you don't understand.

Identify your assumptions and trace them back to their source. How are your assumptions misleading you? What is the truth?

When you have found out the truth, incorporate it into your mental model for the problem. What lessons can be learned from this experience which can help you recognize this pattern again?

**[STORY: [FISH IS FISH](http://www.amazon.com/Fish-Leo-Lionni/dp/0394827996)]**

## Debugging

> Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it. <cite>- Brian Kernighan</cite>

#### Context & purpose

Debugging is a technique for finding and fixing errors. All programs have bugs. Therefore, the better you get at debugging, the better you will be at programming.

#### Inappropriate use

Debugging will not be very useful for you unless you understand the problem the code is designed to solve.

Debugging is great for fixing problems in your code. It is not always the most effective technique for fixing problems in your thinking.

#### A guide to the steps of debugging

You will develop your own process, but in the mean time here is a sample series of steps which describe the general process of debugging:

1. **Isolate the error** (where is the source of the error?)
- **Visualize state** (what are the values of variables when the error occurs?)
- **Compare expected to actual state** (how does the state differ from my conception of what it should be?)
- **Generate a hypothesis** (why does this dissonance exist?)
- **Modify with purpose** (make changes to the code which directly solve for the conditions in your hypothesis)
- **Test and iterate** (ensure that the code works as intended; repeat steps above until success is reached)

### Example

The following code has a bug in it. How do we find it?

```ruby
def binary_search(array, obj, offset = 0)
  middle_index = array.length / 2
  middle_obj   = array[middle_index]

  if obj == middle_obj
    return middle_index + offset
  elsif obj > middle_obj
    return binary_search(array[middle_index..-1], obj, middle_index + offset)
  elsif obj < middle_obj
    return binary_search(array[0..middle_index], obj, offset)
  end
end
```

We can use this driver code to test it:

```ruby
test_array = (1..100).to_a

puts binary_search(test_array, 100)
puts binary_search(test_array, 50)
puts binary_search(test_array, 1)
puts binary_search(test_array, 81)
puts binary_search(test_array, 23)
```

**[ACTIVITY: USE RUBY DEBUGGER TO FIX THIS CODE]**

## Urgent questions (5–10 min)

- Quick overview of 3 urgent topics

## Resources

To get `byebug` up and running on your machine, run these commands:

```bash
$ gem install 'byebug'
```
