# Data Drill: Stack and Queue
## Summary
In this challenge, we will explore two common data structures: stacks and queues.  We'll begin by understanding how each works and then we'll implement them in Ruby.

Like arrays, stacks and queues are collections (i.e., they're objects that contain other objects).  However, arrays provide a more flexible interface than either stacks or queues.  We can add elements to an array at the front, at the end, or in the middle.  Similarly, we can access and remove elements from anywhere in the array.  Stacks and queues, meanwhile, have a more specialized set of behaviors, which we'll explore.  The specialization centers around how we add elements to and remove elements from each data type.


### Stack
[Stacks][] have two primary behaviors: *push* and *pop*.  In other words, we add elements to the stack, and we remove them.  The defining feature of a stack is how we add and remove elements.  When we push an element onto the stack, we can only place it on the top of the stack.  When we pop an element from the stack, we can only remove the top-most element.  We might see this behavior pattern referred to as *last in, first out*.

If the behavior of a stack is unclear, explore this [site where we can interact with a stack][stack animation].


### Queue
[Queues][] also have two primary behaviors: *enqueue* and *dequeue*.  Again, adding elements and removing elements.  We add elements to the end of the queue and remove them from the front of the queue.  A queue follows a *first in, first out* pattern.  In other words, elements are removed from a queue in the same order as they are added.

If the behavior of a queue is unclear, explore this [site where we can interact with a queue][queue animation].


## Releases
### Release 0: Document Stack Behaviors.
In the `my_stack.rb` file, we're presented with a working `MyStack` class.  The class includes behaviors for pushing elements to the stack and popping them off the stack.  In addition, our class includes a couple additional behaviors that can be found in different stack implementations:  peeking at the item on the top of the stack and reporting whether or not the stack is empty.

Notice how we build our `MyStack` class out of a normal `Array` object.  Behind the scenes, our `MyStack` class holds its elements in an array.  But we control how users can interact with that array by keeping it internal to a stack and only allowing the behaviors that a stack would have.

We already have a working stack, but we need to document its behaviors through tests.  Thoroughly test each of the methods.


### Release 1:  Expand Stack Behaviors
We're going to add some behaviors to our `MyStack` class.  We have some behaviors that related to the number of items in a stack.  We can ask a stack whether it's empty.  In addition, we raise an error if we try to pop an element off an empty stack.

We're going to add some additional behaviors related to the number of items in a stack.  These behaviors need to be fully documented in our test suite.

- A stack should be created with a maximum size.
- A stack should report whether it's full.
- A stack should raise an error if we push an element onto a full stack.
- A stack should report how many elements are on the stack.


### Release 2: Implement a Queue
Using our stack implementation as an example, let's implement a `MyQueue` class.  At a minimum, our implementation needs the following behaviors—each of which should be documented in tests.

- Add elements to a queue.
- Remove elements from a queue.
- Report whether a queue is empty.
- Peek at the element at the front of the queue.


## Conclusion
Do we understand what stacks and queues are?  Could we explain them to someone with a non-technical background (e.g., without referencing arrays)?  What are some real-world situations that could be modeled as either a stack or a queue?

[stack animation]: http://www.cs.armstrong.edu/liang/animation/web/Stack.html
[stacks]: https://en.wikipedia.org/wiki/Stack_(abstract_data_type)
[queue animation]: http://www.cs.armstrong.edu/liang/animation/web/Queue.html
[queues]: https://en.wikipedia.org/wiki/Queue_(abstract_data_type)
