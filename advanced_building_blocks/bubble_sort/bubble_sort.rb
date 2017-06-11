class BubbleSort
  def self.do array
    max = array.length-1
    counter = 0
    loop do
      swap = false
      max -= 1
      (0..max).each do |i|
        if array[i] > array[i+1]
          array[i], array[i+1] = array[i+1], array[i]
          swap, max = true, i
        end
        counter += 1
      end
      break unless swap
    end
    array
  end 
end