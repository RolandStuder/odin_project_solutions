def factorial(n)
  return 1 if n == 1
  n * factorial(n-1)
end

puts factorial(1)
puts factorial(2)
puts factorial(3)
puts factorial(4)

def palindrome?(word)
  return true if word.length <= 1
  return false unless word[0].downcase == word[-1].downcase
  palindrome?(word[1..-2])
end

puts palindrome?('Anna')
puts palindrome?('Sugus')
puts palindrome?('abcdef')

def bottles_of_beer(n)
  if n == 0
    puts "no more bottles of beer on the wall"
  else 
    puts "#{n} bottles of beer on the wall"
    bottles_of_beer(n-1)
  end
end

puts bottles_of_beer(99)

def fibonacci(n)
  return 1 if n == 1
  return 0 if n == 0
  fibonacci(n-1) + fibonacci(n-2)
end

puts fibonacci(5)
puts fibonacci(6)

def flatten(arr,result=[])
  arr.each do |elem|
    if elem.kind_of?(Array)
      flatten(elem,result)
    else
      result << elem
    end
  end
  result
end

puts flatten([[1, 2], [3, 4]]).inspect
puts flatten( [[1, [8, 9]], [3, 4]]).inspect

def int_to_roman(n,result="")
  roman_mapping = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  return result << roman_mapping[n] if n == 1
  roman_mapping.each do |k,v|
    if n >= k
      int_to_roman(n-k,result << v)
      break
    end
  end
  result
end

puts int_to_roman(1)
puts int_to_roman(2)
puts int_to_roman(12)
puts int_to_roman(1324)


  def roman_to_int(roman,result=0)
  roman_mapping = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  return result unless roman
  roman_mapping.each do |k,v|
    if roman[0..1] == k
      result += v
      return roman_to_int(roman[2..-1],result)
    elsif roman[0] == k
      result += v
      return roman_to_int(roman[1..-1],result)
    end
  end
end

puts roman_to_int('MCCCXXIIII')


