module Narl
  module Utils
    def self.validate_grid!(x, y)
      raise ArgumentError, "x and y must have same length" unless x.length == y.length
      raise ArgumentError, "need at least two points" if x.length < 2

      (0...x.length - 1).each do |i|
        raise ArgumentError, "x must be strictly increasing" unless x[i] < x[i + 1]
      end
    end
  end
end