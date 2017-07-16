def fibs(n)
  seq = []
  0.upto(n) do |i|
    if seq.length < 2
      seq << i
    else
      seq << seq[-1] + seq[-2]
    end
  end
  seq
end


puts fibs(10).inspect


def fibs_rec(n,seq=[])
  n < 2 ? [n] : fibs_rec(n-1) << fibs_rec(n-1).last + fibs_rec(n-2).last 
end

puts fibs_rec(10).inspect
