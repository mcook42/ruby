# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)

  sides = [a, b, c]
  raise TriangleError if sides.min <= 0 # we can't have a triangle with a side with a non-positive length

  short, medium, long = sides.sort
  raise TriangleError if short + medium <= long

  if a == b && b == c
    return :equilateral
  end

  if a === b || b === c || c === a
    return :isosceles
  end

  :scalene
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
