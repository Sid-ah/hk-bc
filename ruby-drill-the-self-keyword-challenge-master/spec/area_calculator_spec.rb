require_relative '../area_calculator'

describe AreaCalculator do
  it 'calculates the area of a rectangle' do
    width = 2
    length = 3

    expected_rectangle_area = 6  # width * length
    calculated_rectangle_area = AreaCalculator.area_of_rectangle(width, length)

    expect(calculated_rectangle_area).to eq expected_rectangle_area
  end

  it 'calculates the area of a square' do
    side = 5

    expected_square_area = 25  # side ** 2
    calculated_square_area = AreaCalculator.area_of_square(side)

    expect(calculated_square_area).to eq expected_square_area
  end

  it 'calculates the area of a triangle' do
    base = 3
    height = 4

    expected_triangle_area = 6  # (base * height) / 2
    calculated_triangle_area = AreaCalculator.area_of_triangle(base, height)

    expect(calculated_triangle_area).to eq expected_triangle_area
  end
end
