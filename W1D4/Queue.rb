class Queue
  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar << el
  end

  def dequeue
    @ivar.pop
  end

  def peek
    @ivar[-1]
  end
end