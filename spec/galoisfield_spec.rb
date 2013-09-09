$:.unshift File.expand_path("..", __FILE__)
$:.unshift File.expand_path("../lib", __FILE__)
require 'galoisfield'

describe GaloisField do
  it "should return Class" do
    expect(GaloisField[42]).to be_instance_of(Class)
  end
end

