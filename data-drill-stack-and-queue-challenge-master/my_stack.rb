class MyStack
  class UnderflowError < StandardError; end

  def initialize
    @store = Array.new
  end


  # Add an element
  # to the top of the stack.
  def push(x)
    store.push(x)

    # Don't expose the array
    # we're using for internal storage.
    return self
  end


  # Remove an element
  # from the stack.
  def pop
    raise(UnderflowError, "There is no element to remove from the stack") if empty?
    store.pop
  end


  # Show the element on the top of the stack,
  # but don't remove it.
  def peek
    store.last
  end


  # Report whether or not ther are
  # any elements in the stack.
  def empty?
    store.empty?
  end

  private
  attr_reader :store
end
