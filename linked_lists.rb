class LinkedList

    def initialize(value)
        @head = Node.new(value, nil)
    end

    def append(value)
        current_node = @head
        while current_node.next != nil
            current_node = current_node.next
        end
        current_node.next = Node.new(value, nil)
    end

    def prepend(value)
        old_head = @head
        @head = Node.new(value, old_head)
    end

    def size
        c = 1
        current_node = @head
        while current_node.next != nil
            current_node = current_node.next
            c += 1
        end
        c
    end

    def head
        @head.name
    end

    def tail
        current_node = @head
        while current_node.next != nil
            current_node = current_node.next
        end
        current_node.name
    end

    def at(index)
        c = 0
        current_node = @head
        while c < index
            current_node = current_node.next
            c += 1
        end
        current_node.name
    end

    def pop
        current_node = @head
        while current_node.next.next != nil
            current_node = current_node.next
        end
        current_node.next = nil
    end

    def contains?(value)
        current_node = @head
        while current_node.next != nil
            return true if current_node.value == value
            current_node = current_node.next
        end
        return false
    end

    def find(data)
        current_node = @head
        c = 0
        while current_node.next != nil
            return c if current_node.value == data
            current_node = current_node.next
            c += 1
        end
        return nil
    end

    def to_s
        current_node = @head
        str = ""
        while current_node.next != nil
            str +=  "(#{current_node.value} ) -> "
            current_node = current_node.next
        end
        str += "( #{current_node.value} ) -> nil"
    end

    def insert_at(value,index)
        c = 1
        current_node = @head
        while c < index
            current_node = current_node.next
            c += 1
        end
        old_current_node_next = current_node.next
        current_node.next = Node.new(value,old_current_node_next)
    end

    def remove_at(index)
        c = 1
        current_node = @head
        while c < index
            current_node = current_node.next
            c += 1
        end
        old_current_node_next = current_node.next
        current_node.next = current_node.next.next
    end

    def return_list
        elements = []
        current_node = @head
        while current_node.next != nil
            elements << current_node
            puts""
            puts "name: #{current_node.name}"
            puts "value: #{current_node.value}"
            puts "next: #{current_node.next.object_id}"
            current_node = current_node.next
        end
        puts""
        puts "name: #{current_node.name}"
        puts "value: #{current_node.value}"
        puts "next: #{"nil" if current_node.next.nil?}"
        puts""
        elements << current_node
    end

end

class Node
    
    attr_accessor :value, :next, :name

    def initialize(value, next_node)
        @value = value
        @next = next_node
        @name = self.object_id
    end

end

list = LinkedList.new(32)
list.append(33)
list.prepend(31)
list.append(34)
list.prepend(30)
list.pop
list.insert_at(31.5,2)
list.remove_at(1)
list.return_list
puts "size: #{list.size}"
puts "head: #{list.head}"
puts "tail: #{list.tail}"
puts "at(2): #{list.at(2)}"
puts "contains?(332): #{list.contains?(332)}"
puts "find(32): #{list.find(32)}"
puts "to_s: #{list.to_s}"