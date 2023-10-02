# i will be using an array
# elements can contain a range of data

class SimpleLinkedList
  def initialize
    @list = []
  end

  def <<(obj)
    if obj.instance_of?(Element)
      obj.next = head
      @list.unshift(obj)
    else
      @list.unshift(Element.new(obj, head))
    end
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

  def include?(obj)
    @list.include?(obj)
  end
end

class Element
  attr_reader :datum
  attr_accessor :next

  @@list = SimpleLinkedList.new

  def initialize(element, next_element = nil)
    @datum = element
    if next_element.instance_of?(Element)
      @next = next_element
    elsif next_element
      @next = self.class.new(next_element.datum)
    end

  end

  def tail?
    @next == nil
  end

  def next
    @next
  end
end


