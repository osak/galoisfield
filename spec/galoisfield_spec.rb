$:.unshift File.expand_path("..", __FILE__)
$:.unshift File.expand_path("../lib", __FILE__)
require 'galoisfield'

describe GaloisField do
  it "should return Class" do
    expect(GaloisField[42]).to be_instance_of(Class)
  end

  it "should return same class for same modulo" do
    expect(GaloisField[42]).to be_equal(GaloisField[42])
  end

  context "Arithmetic expression" do
    before do
      @a = 3.to_galois(5)
      @b = 4.to_galois(5)
    end

    it {expect(@a + @b).to eq(2.to_galois(5))}
    it {expect(@a - @b).to eq(4.to_galois(5))}
    it {expect(@a * @b).to eq(2.to_galois(5))}
    it {expect(@a / @b).to eq(2.to_galois(5))}
    it {expect(@a.inv).to eq(2.to_galois(5))}
  end

  it "should be hashed" do
    hash = {}
    val = 42.to_galois(10)
    hash[val] = 42
    expect(hash[val]).to eq(42)
  end
end

describe Integer do
  it "should be converted into galois number" do
    a = 42.to_galois(10)
    expect(a).to be_instance_of(GaloisField[10])
    expect(a.to_i).to eq(2)
  end
end

