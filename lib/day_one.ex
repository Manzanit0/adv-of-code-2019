defmodule DayOne do
  def solution() do
    part_1 =
      "./priv/day_one_1.txt"
      |> Path.expand()
      |> File.stream!()
      |> Stream.map(&sanitise/1)
      |> Stream.map(&calculate_fuel/1)
      |> Enum.reduce(0, &Kernel.+/2)

    part_2 =
      "./priv/day_one_2.txt"
      |> Path.expand()
      |> File.stream!()
      |> Stream.map(&sanitise/1)
      |> Stream.map(&calculate_fuel_recursively/1)
      |> Enum.reduce(0, &Kernel.+/2)

    %{solution_1: part_1, solution_2: part_2}
  end

  def calculate_fuel(mass) do
    mass
    |> Kernel./(3)
    |> Float.floor()
    |> Kernel.-(2)
    |> positivise()
  end

  def calculate_fuel_recursively(mass, acc \\ 0)

  def calculate_fuel_recursively(mass, acc) when mass <= 0, do: acc

  def calculate_fuel_recursively(mass, accumuluated_fuel) do
    fuel_required = calculate_fuel(mass)
    calculate_fuel_recursively(fuel_required, accumuluated_fuel + fuel_required)
  end

  defp positivise(num) when num < 0, do: 0
  defp positivise(num), do: num

  defp sanitise(row) do
    row
    |> String.replace("\n", "")
    |> String.to_integer()
  end
end
