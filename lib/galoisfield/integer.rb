class Integer
  def to_galois(modulo)
    GaloisField[modulo]::Number.new(self)
  end
end
