require_relative "utils/validation"

module Narl
  class LinearInterpolation
    def initialize(x, y)
      Narl::Utils.validate_grid!(x, y)
      @x = x
      @y = y
    end

    def call(x0)
      raise ArgumentError, "out of bounds" if x0 < @x.first || x0 > @x.last

      i = interval_index(x0)
      t = (x0 - @x[i]) / (@x[i + 1] - @x[i])
      @y[i] + t * (@y[i + 1] - @y[i])
    end

    private

    def interval_index(x0)
      left = 0
      right = @x.length - 2

      while left <= right
        mid = (left + right) / 2
        return mid if @x[mid] <= x0 && x0 <= @x[mid + 1]
        x0 < @x[mid] ? right = mid - 1 : left = mid + 1
      end
    end
  end
end