require './bubble_sort'

describe BubbleSort do
  it "sorts arrays ascending" do
    expect(BubbleSort.do [1,3,2] ).to eq [1,2,3] 
    expect(BubbleSort.do [1,-3,-5] ).to eq [-5,-3,1]
    expect(BubbleSort.do [20, 1,-3,-5] ).to eq [-5,-3,1,20]
    expect(BubbleSort.do [20, 20,-3,-5] ).to eq [-5,-3,20,20]
    expect(BubbleSort.do [20, 20,-3,100] ).to eq [-3,20,20,100]
    expect(BubbleSort.do [20, 20,-3,100] ).to eq [-3,20,20,100]
    expect(BubbleSort.do [1, 2,3,4] ).to eq [1,2,3,4]
    expect(BubbleSort.do [5,1, 2,3,4,6,6,6,6,-1] ).to eq [-1,1,2,3,4,5,6,6,6,6]
    expect(BubbleSort.do [5,1, 2,3,4,6,6,6,6] ).to eq [1,2,3,4,5,6,6,6,6]
  end
end
