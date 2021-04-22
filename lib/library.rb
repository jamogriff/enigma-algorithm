class Library

  def self.character_set
    ("a".."z").to_a << " "
  end
  
  def self.code_book
    { A: 1, B: 2,
      C: 3, D: 4 }
  end

end
