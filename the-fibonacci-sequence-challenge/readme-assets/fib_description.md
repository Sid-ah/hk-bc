
### Where do Fibonacci numbers come from?

The Fibonacci sequence was named after Leonardo of Pisa, also known as Fibonacci, who created an idealized model of how rabbits breed. His greatly simplified model worked thus:

1. At the beginning of the first month we start with a pair of newborn rabbits, one male and one female
2. Rabbit pairs can't mate for their first month of life, but can starting at the end of their first month and do so at the end of every month thereafter
3. A pregnant rabbit takes one month to give birth and always gives birth to a new male/female rabbit pair
4. Rabbits never die

He then asked, "How many pairs of rabbits will there be after a year?" In the first month there is 1 pair. They mate at the end of their first month, but there is still only 1 pair. They give birth to a new pair at the end of their second month, at which point the original pair mates again. There are two pairs of rabbits, now.

At the end of the third month, the original pair gives birth again, so there are three pairs. The first pair and second pair can now both mate, and do, so at the end of the fourth month they give birth and there are five pairs. And so on.

In other words, at the end of each month the set of rabbits that can breed are all the rabbits that have bred before plus the rabbit pairs born at the end of the last month.

The sequence goes 1, 1, 2, 3, 5, 8, 13, etc. This sequence is called the "Fibonacci sequence" and the N<sup>th</sup> item in this sequence—the number of rabbits alive after N months in Fibonacci's rabbit model—is called the N<sup>th</sup> Fibonacci number.

We can restate the rules like this:

```text
rabbits_at_month(1) = 1
rabbits_in_month(2) = 1
rabbits_in_month(n) = rabbits_in_month(n-1) + rabbits_on_month(n-2)
```

We've defined the rules of a system, here, and you write Ruby code which models that system. I give you some number of months, `n`, and your Ruby program gives me the number of rabbits alive after `n` months.

##Math!

Here's how we'd define the Fibonacci sequence, mathematically.

```script 
fib(n) =
  0 if n = 0 
  1 if n = 1 
  fib(n-1) + fib(n-2) otherwise
```
