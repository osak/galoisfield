require "galoisfield/version"
require "galoisfield/integer.rb"

module GaloisField
  def self.[](modulo)
    @@cache ||= {}
    @@cache[modulo] ||= create_impl(modulo)
  end

  def self.create_impl(modulo)
    mod = Module.new do
      cls = Class.new(Numeric)
      cls.instance_eval do
        const_set(:MODULO, modulo)
        include GaloisNumberImpl
      end
      const_set("Number", cls)
    end
    name = "GaloisField#{modulo}"
    const_set(name.intern, mod)
    mod
  end

  module GaloisNumberImpl
    def initialize(num)
      unless num.is_a?(Integer)
        raise TypeError.new("Galois numbers can be created only from integer value.")
      end
      @value = num % self.class::MODULO
    end

    def +(other)
      self.class.new(@value + other.to_i)
    end

    def -(other)
      self.class.new(@value - other.to_i)
    end

    def *(other)
      self.class.new(@value * other.to_i)
    end

    def /(other)
      self * other.inv
    end

    def **(exp)
      unless exp.is_a?(Integer)
        raise TypeError.new("Galois numbers can be powered only by integer value.")
      end
      res = 1
      pow = @value
      while exp > 0
        if exp.odd?
          res *= pow
          res %= self.class::MODULO
        end
        pow *= pow
        pow %= self.class::MODULO
        exp /= 2
      end
      res.to_galois(self.class::MODULO)
    end

    # Returns the inverse of this number.
    # @note This method works properly only if the modulo is prime.
    def inv
      self**(self.class::MODULO-2)
    end

    def ==(other)
      self.class == other.class && self.to_i == other.to_i
    end

    def eql?(other)
      self == other
    end

    def hash
      @value
    end

    def coerce(val)
      if val.is_a?(Integer)
        [val.to_galois(self.class::MODULO), self]
      else
        super
      end
    end

    def to_i
      @value
    end

    def to_s
      @value.to_s
    end

    def inspect
      "#{@value}(mod #{self.class::MODULO})"
    end
  end
end
