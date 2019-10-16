class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def reverse_list(list, previous=nil)
  if list
    next_node = list.next_node
    list.next_node = previous
    reverse_list(next_node, list)
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

node1 = LinkedListNode.new(20)
node2 = LinkedListNode.new(9, node1)
node3 = LinkedListNode.new(91, node2)
node4 = LinkedListNode.new(13, node3)
node5 = LinkedListNode.new(27, node4)

print_values(node5)
puts "-------"
revlist = reverse_list(node5)
print_values(node1)