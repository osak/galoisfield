$:.unshift File.expand_path("..", __FILE__)
$:.unshift File.expand_path("../lib", __FILE__)
require 'galoisfield'

describe GaloisField do
  it "should generate Module" do
    expect(GaloisField[42]).to be_instance_of(Module)
  end

  it "should return same module for same modulo" do
    expect(GaloisField[42]).to be_equal(GaloisField[42])
  end

  describe "Galois Number" do
    context "Arithmetic expression" do
      before do
        @a = 3.to_galois(5)
        @b = 4.to_galois(5)
      end

      it {expect(@a + @b).to eq(2.to_galois(5))}
      it {expect(@a - @b).to eq(4.to_galois(5))}
      it {expect(@a * @b).to eq(2.to_galois(5))}
      it {expect(@a / @b).to eq(2.to_galois(5))}
      it {expect(@a ** 2).to eq(4.to_galois(5))}
      it {expect(@a.inv).to eq(2.to_galois(5))}
    end

    it "should be hashed" do
      hash = {}
      val = 42.to_galois(10)
      hash[val] = 42
      expect(hash[val]).to eq(42)
    end

    it "should be converted into integer" do
      val = 42.to_galois(10).to_i
      expect(val).to be_kind_of(Integer)
      expect(val).to eq(2)
    end

    it "should be converted into string" do
      expect(42.to_galois(10).to_s).to eq("2")
    end

    it "should be inspected" do
      expect(42.to_galois(10).inspect).to eq("2(mod 10)")
    end
  end
end

describe Integer do
  it "should be converted into galois number" do
    a = 42.to_galois(10)
    expect(a).to be_instance_of(GaloisField[10]::Number)
    expect(a.to_i).to eq(2)
  end
end

