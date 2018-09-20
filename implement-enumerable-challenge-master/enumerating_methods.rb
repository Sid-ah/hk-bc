#each is already implemented as an example, check the test for it too!
def each(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

def find(array)
end

def map(array)
end

def reject(array)
end

def select(array)
end

# Coding all? is optional.
def all?(array)
end

# Coding reduce is optional.
def reduce(array, starting_value = nil)
end
