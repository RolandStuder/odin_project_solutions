def merge_sort(a)
  return a if a.length < 2
  b = a.slice!(0,a.length/2)
  result = []
  while a.length > 0 && b.length > 0
    result << (a[0] < b[0] ? a.shift : b.shift)
  end
  result << a unless a.empty?
  result << b unless b.empty?
  result.flatten
 end