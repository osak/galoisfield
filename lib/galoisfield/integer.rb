class Integer
  def to_galois(modulo)
    GaloisField[modulo].new(self)
  end
end
