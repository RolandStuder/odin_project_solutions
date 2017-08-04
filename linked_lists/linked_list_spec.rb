require './linked_list.rb'
require 'pry'


describe LinkedList do
  before(:each) do
    @list = LinkedList.new
    @list.append('something')
    @list.append('entirely')
    @list.append('else')
    @list.append(true)
    @list.append(12)
    @list.append([])
    @list.append(10)
  end

  it "appends new nodes" do
    @list.append('new')
    expect( @list.tail.value ).to eq 'new'
    expect( @list.size ).to eq 8
  end

  it "prepends new nodes at start" do
    @list.prepend('first!')
    expect( @list.head.value ).to eq 'first!'
    expect( @list.size ).to eq 8
  end

  it "returns size" do
    expect( @list.size ).to eq 7
  end

  it "returns first element as head" do
    expect( @list.head.value ).to eq 'something'
  end

  it "returns last element as tail" do
    expect( @list.tail.value ).to eq 10
  end

  it "#at(index) returns the node at the given index" do
    expect( @list.at(0) ).to eq 'something'
    expect( @list.at(4) ).to eq 12
  end

  it "#pop removes the last element from the @list" do
    expect( @list.pop ).to eq 10
    expect( @list.tail ).not_to eq 10
    expect( @list.size ).to be 6
  end

  it "#contains? returns true if the passed in value is in the @list and otherwise returns false." do
    expect( @list.contains?('The World') ).to be false
    expect( @list.contains?(12) ).to be true
    expect( @list.contains?(42) ).to be false
    expect( @list.contains?('else') ).to be true
    expect( @list.contains?([]) ).to be true
  end

  it "#find(data) returns the index of the node containing data, or nil if not found." do
    expect( @list.find(12) ).to be 4
    expect( @list.find([]) ).to be 5
    expect( @list.find('else') ).to be 2
  end

  it '#to_s represent your Linked@list objects as strings, so you can print them out and preview them in the console.' do
    # The format should be: ( data ) -> ( data ) -> ( data ) -> nil
    expect( @list.to_s ).to eq '( "something" ) -> ( "entirely" ) -> ( "else" ) -> ( true ) -> ( 12 ) -> ( [] ) -> ( 10 ) -> nil'
  end

  it "#insert_at(index) that inserts the node at the given index" do
    @list.insert_at("new", 4)
    expect( @list.size ).to be 8
    expect( @list.at(4) ).to eq "new" 
    expect( @list.at(3) ).to eq true 
    expect( @list.at(5) ).to eq 12
  end

  it "#remove_at(index) that removes the node at the given index. (You will need to update the links of your nodes in the @list when you remove a node.)" do 
    expect( @list.remove_at(2) ).to eq 'else'
    expect( @list.size ).to be 6
    expect( @list.at(2) ).to eq true
    expect( @list.at(1) ).to eq 'entirely'
    expect( @list.at(3) ).to eq 12
  end
end
