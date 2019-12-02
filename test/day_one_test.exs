defmodule DayOneTest do
  use ExUnit.Case

  test "case 1" do
    mass = 12
    required_fuel = 2
    assert required_fuel == DayOne.calculate_fuel(mass)
  end

  test "case 2" do
    mass = 14
    required_fuel = 2
    assert required_fuel == DayOne.calculate_fuel(mass)
  end

  test "case 3" do
    mass = 1969
    required_fuel = 654
    assert required_fuel == DayOne.calculate_fuel(mass)
  end

  test "case 4" do
    mass = 100756
    required_fuel = 33583
    assert required_fuel == DayOne.calculate_fuel(mass)
  end
end
