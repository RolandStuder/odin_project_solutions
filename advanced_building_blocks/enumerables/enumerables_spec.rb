require './enumerables.rb'

describe Enumerable do
  a = [1,2,3]
  h = {a: 1, b: 2}
  describe "my_each" do
    it "return enum" do
      expect([].my_each).to be_kind_of Enumerable
    end

    it "loops through integers" do
      number = 0
      [1,2,3].my_each{ |n| number += n}
      expect(number).to be 6
    end

    it "loops through hashes" do
      res = []
      h.my_each{ |k,v| res << k.to_s + v.to_s}
      expect(res).to eq ['a1','b2']
    end
  end

  describe "my_each_with_index" do
    it "return enum" do
      expect([].my_each).to be_kind_of Enumerable
    end

    it "returns indexes and values" do
      res = []
      a.my_each_with_index{ |v,i| res << v.to_s + i.to_s }
      expect(res).to eq(['10', '21', '32'])
    end

    it "returns indexes and values for hashes" do
      res = []
      h.my_each_with_index{ |k,v,i| res << k.to_s + v.to_s + i.to_s }
      expect(res).to eq(['a10', 'b21'])
    end
  end

  describe "my_select" do 
    it "select from array" do
      expect(a.my_select{|c| c > 2}).to eq [3]
      expect(a.my_select{|c| c > 1}).to eq [2,3]
    end

    it "selects from hash" do
      expect(h.my_select{ |k,v| v > 1}).to eq({b: 2})
    end 
  end

  describe "my_all?" do
    it "works for array" do
      expect(a.my_all?{|n| n < 10}).to be true
      expect(a.my_all?{|n| n > 1}).to be false
    end

    it "works for hash" do
      expect(h.my_all?{|k,v| v < 10}).to be true
      expect(h.my_all?{|k,v| v > 1}).to be false
    end
  end

  describe "my_any?" do
    it "works for array" do
      expect(a.my_any?{|n| n < 10}).to be true
      expect(a.my_any?{|n| n > 1}).to be true
      expect(a.my_any?{|n| n < -1}).to be false
    end

    it "works for hash" do
      expect(h.my_any?{|k,v| v < 10}).to be true
      expect(h.my_any?{|k,v| v > 1}).to be true
      expect(h.my_all?{|k,v| v < 1}).to be false
    end
  end

  describe "my_none?" do
    it "works for array" do
      expect(a.my_none?{|n| n == 0}).to be true
      expect(a.my_none?{|n| n == 3}).to be false
    end

    it "works for hash" do
      expect(h.my_none?{|k,v| k == :a}).to be false
      expect(h.my_none?{|k,v| k == 1}).to be true
    end
  end

  describe "my_count" do
    it "works for array" do
      expect(a.my_count{|n| n == 1}).to be 1
      expect(a.my_count{|n| n >= 2}).to be 2
    end

    it "works for hash" do
      expect(h.my_count{|k,v| k == :a}).to be 1
      expect(h.my_count{|k,v| k == 1}).to be 0
    end
  end

  describe "my_map" do
    it "works for array" do
      expect(a.my_map{|n| n * 2}).to eq [2,4,6]
      expect(a.my_map{|n| n ** 2}).to eq [1, 4, 9]
    end

    it "works for hash" do
      expect(h.my_map{|k,v| v ** 3}).to eq [1,8]
      expect(h.my_map{|k,v| k.to_s }).to eq ['a','b']
    end

    it "works with a proc" do
      proc = Proc.new {|n| n * 2}
      expect(a.my_map(proc)).to eq [2,4,6]
    end
  end

  describe "my_map!" do
    it "works for array" do
      a2 = [1,2,3]
      a2.my_map!{|n| n * 2}
      expect(a2).to eq [2,4,6]
    end
  end

  describe "my_inject" do
    it "injects int" do
      expect(a.my_inject(0) {|r,n| r += n}).to eq 6
    end
  end

  describe "multiply_elems" do
    it "works with inject" do
      expect(multiply_els([2,4,5])).to eq 40
    end
  end
end
