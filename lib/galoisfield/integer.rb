class Integer
  # Converts the number into galois number in specified modulo.
  #
  # @param modulo [Integer]
  def to_galois(modulo)
    GaloisField[modulo]::Number.new(self)
  end
end
