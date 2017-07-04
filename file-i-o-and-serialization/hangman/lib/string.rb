class String
  def to_a
    self.each_char.reduce([]) {|res, char| res << char}
  end
end