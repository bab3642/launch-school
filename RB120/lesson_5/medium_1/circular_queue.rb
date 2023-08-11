
class CircularQueue
  def initialize(queue)
    @queue = Array.new(queue)
    @size = queue
  end

  def enqueue(item)
    queue.shift
    queue << item
  end

  def dequeue
    if queue.count(nil) > 0
      to_delete = queue.select {|i| i != nil}
      item = to_delete.shift
      (self.size - to_delete.size).times { to_delete << nil }
      self.queue = to_delete
      item
    else
      item = queue.shift
      queue << nil
      item
    end
  end

  private

  attr_accessor :queue
  attr_reader :size

end














queue = CircularQueue.new(3)
p queue.dequeue #== nil

 queue.enqueue(1)
 p queue
 queue.enqueue(2)
 p queue
 p queue.dequeue == 1
 p queue

 queue.enqueue(3)
 p queue
 queue.enqueue(4)
 p queue
 p queue.dequeue #== 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil