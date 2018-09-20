# Readable Code; Expose Your Ignorance

## Reflect & Review (5 min)

- What have we been learning?
- What obstacles have you encountered?

Bucket questions/topic suggestions into Punt, Research, Breakout.

## Meta-learning (5 min)

#### Expose your ignorance

- Being open to new learning is all about finding a balance between humility and confidence.
- In order to benefit from the help/instruction of others, must be willing to say "I don't know, can you tell me?"
- The more you can ask for help on what you don't know, the faster you will advance.

**Techniques:**

- When your pair or a teacher does something you don't recognize or understand, ask them about it.
- If a teacher or pair asks you if you understand something, be honest.
- Be nice to people who say "I don't know". Thank them for exposing your ignorance.
- DO NOT belittle anyone for not knowing. Our learning environment thrives on curiosity, and pretentious elitism is like mustard gas for curiosity.

## Readable Code

> Any fool can write code that a computer can understand. Good programmers write code that humans can understand. <cite>- Martin Fowler</cite>

#### Context & Purpose

- Always strive for readable code. If it's not readable, that is a **code smell**.
- The "Ruby way" is to write readable code – code that other programmers can understand.

**Readable code:**

- Descriptive names for methods, variables, classes, and modules
- Complex operations are decomposed into constituent parts
- Methods are small and behavior is obvious
- Minimizes need for comments because the code tells you what it is doing

#### Example: Refactor Roman Numerals for Readability

**Original Version:**

```ruby
def to_roman(x)
roman = {"M"=>1000,"D"=> 500,"C"=>100,"L"=>50,"X"=>10,"V"=>5,"I"=>1}
string = ""
  roman.each do |key,value|
    string = string + key * (x / value)
    x = x % value
  end
  return string
end

# Driver Code
puts "My totally sweet testing script"
puts ""
puts "input | expected  | actual"
puts "------|-----------|-------"
puts "4     | IIII      | #{to_roman(4)}"
puts "9     | VIIII     | #{to_roman(9)}"
puts "13    | XIII      | #{to_roman(13)}"
puts "1453  | MCCCCLIII | #{to_roman(1453)}"
puts "1646  | MDCXXXXVI | #{to_roman(1646)}"
```

**Refactored Version:**

```ruby
ROMAN_ARABIC = { "M"=>1000,
                 "D"=>500,
                 "C"=>100,
                 "L"=>50,
                 "X"=>10,
                 "V"=>5,
                 "I"=>1 }

def to_roman(num)
  roman_numerals = ''

  ROMAN_ARABIC.each do |roman, arabic|
    numeral = roman * (num / arabic)
    num     = num % arabic

    roman_numerals += numeral
  end

  roman_numerals
end

# Driver Code
puts "My totally sweet testing script"
puts ""
puts "input | expected  | actual"
puts "------|-----------|-------"
puts "4     | IIII      | #{to_roman(4)}"
puts "9     | VIIII     | #{to_roman(9)}"
puts "13    | XIII      | #{to_roman(13)}"
puts "1453  | MCCCCLIII | #{to_roman(1453)}"
puts "1646  | MDCXXXXVI | #{to_roman(1646)}"
```

*Hint: there's a way to refactor `to_roman` even further. Do you know of another `Enumerable` method that is more appropriate for this case?*

## Urgent questions (5–10 min)

- Quick overview of 3 urgent topics

## Resources

- Chapter on [Exposing your Ignorance](http://ofps.oreilly.com/titles/9780596518387/emptying_the_cup.html#expose_your_ignorance) from [Apprenticeship Patterns](http://ofps.oreilly.com/titles/9780596518387/index.html)
- [Rubular.com](http://rubular.com/) - regular expression tool for Ruby
