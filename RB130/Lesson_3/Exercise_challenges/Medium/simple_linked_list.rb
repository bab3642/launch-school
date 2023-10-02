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

  def self.from_a(array)
    list = SimpleLinkedList.new
    array.instance_of?(Array) ? array.reverse.each { |element| list << element } : nil
    list
  end

  alias push <<

  def last
    @list.last
  end

  def index(obj)
    @list.index(obj)
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
    head ? head.datum : nil
  end

  def include?(obj)
    @list.include?(obj)
  end

  def pop
    @list.shift.datum
  end

  def to_a
    @list.map(&:datum)
  end

  def reverse
    self.class.from_a(@list.reverse.map(&:datum))
  end
end

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(element, next_element = nil)
    @datum = element
    @next = next_element
  end

  def tail?
    @next.nil?
  end

  def next
    @next
  end
end


