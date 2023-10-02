# i will be using an array
# elements can contain a range of data

class SimpleLinkedList
  def initialize
    @list = []
  end

  def <<(obj)
    @list.unshift( (obj.instance_of?(Element) ? obj : Element.new(obj)) )
  end

  alias push <<

  def last
    @list.last
  end

  def index(obj)
    @list.index(obj)
  end

  def [](idx)
    @list[idx]
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def head
    @list.first
  end

  def peek
    head.datum
  end
end

class Element
  attr_reader :datum

  @@list = SimpleLinkedList.new

  def initialize(element, next_element = nil)
    @datum = element
    @@list << self
    @next = self.class.new(next_element.datum) if next_element
  end

  def tail?
    @@list.last == self
  end

  def next
    @next
  end
end

Element.new(1)
