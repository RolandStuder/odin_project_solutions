require 'pry'

class Fixnum
  def to_a
    [self]
  end
end

module Enumerable
  def my_each
    enum = self.to_a
    for i in 0...(enum.length) do
      yield(enum[i])
    end
    enum
  end

  def my_each_with_index
    enum = self.to_a
    for i in 0...enum.length do
      yield(enum[i].to_a.push i)
    end
  end


  def my_select
    arr = []
    enum = self.to_a
    for i in 0...(enum.length) do
      arr << enum[i] if yield(enum[i])
    end
    self.class == Hash ? arr.to_h : arr
  end

  def my_all?
    enum = self.to_a
    for i in 0...enum.length do
      return false if !yield(enum[i]) 
    end
    true
  end

  def my_any?
    enum = self.to_a
    for i in 0...enum.length do
      return true if yield(enum[i]) 
    end
    false
  end

  def my_none?
    enum = self.to_a
    for i in 0...enum.length do
      return false if yield(enum[i]) 
    end
    true
  end

  def my_count
    count = 0
    enum = self.to_a
    for i in 0...enum.length do
      count += 1  if yield(enum[i]) 
    end
    count
  end

  def my_map proc=nil
    enum = self.to_a
    arr = []
    for i in 0...enum.length do 
      if proc.class == Proc
        arr[i] = proc.call(enum[i])
      else
        arr[i] = yield(enum[i])
      end
    end
    arr
  end

  def my_map!
    enum = self.to_a
    for i in 0...enum.length do 
      enum[i] = yield(enum[i])
    end
    enum
  end

  def my_inject result
    enum = self.to_a
    for i in 0...enum.length do
      result = yield(result, enum[i])
    end
    result
  end
end

def multiply_els arr
  arr.inject(1) { |res, item| res *= item }
end

