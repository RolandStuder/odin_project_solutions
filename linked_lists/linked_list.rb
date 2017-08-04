require 'pry'

class LinkedList
	attr_accessor :head
	
	def tail
		current = @head
		while current.next != nil
			current = current.next
		end
		return current
	end

	def append(value)
		@head == nil ? @head = Node.new(value) : tail.next = Node.new(value)
	end	

	def prepend(value)
		@head = Node.new(value,@head)
	end

	def size
		size = 1
		current = @head
		while current.next
			size += 1 unless current == nil
			current = current.next
		end
		return size
	end

	def at(index)
		current = @head
		index.times do
		  raise ArgumentError, 'Index does not exist' unless current.next
		  current = current.next
		end
		current.value


	end

	def pop
		current = @head
		while current.next
			previous = current
			current = current.next
		end
		previous.next = nil
		value = current.value
		current = nil
		return value
	end

	def contains?(obj)
		current = @head
		while current.next
			return true if current.value == obj
			current = current.next
		end
		return false
	end

	def find(obj)
		current = @head
		index = 0
		while current.next
			return index if current.value == obj
			current = current.next
			index += 1
		end
		return false
	end

	def to_s
		result = ""
		current = @head
		while current.next
			result << "( #{current.value.inspect } ) -> "
			current = current.next
		end
		return result << "( #{current.value.inspect } ) -> " << "nil"
	end

	def insert_at(obj, position)
		current = @head
		index = 0
		while current.next
			if ( index+1 ) == position
				previous = current
				new_node = Node.new(obj,current.next) 
				previous.next = new_node
				return true
			end
			index += 1
			current = current.next if current.next
		end
	end

	def remove_at(position)
		current = @head
		index = 0
		while current.next
			if ( index+1 ) == position
				previous = current
				value = current.next.value
				previous.next = current.next.next
				current = nil
				return value
			end
			index += 1
			current = current.next
		end 
	end
end

class Node	
	attr_accessor :value, :next
	
	def initialize(value,next_ref = nil)
		@value = value
		@next = next_ref
		return self
	end
end
