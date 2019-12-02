defmodule DayOne do
  def solution() do
    "./priv/day_one.txt"
    |> Path.expand()
    |> File.stream!()
    |> Stream.map(&sanitise/1)
    |> Stream.map(&calculate_fuel/1)
    |> Enum.reduce(0, &Kernel.+/2)
  end

  def calculate_fuel(mass) do
    mass
    |> Kernel./(3)
    |> Float.floor()
    |> Kernel.-(2)
  end

  defp sanitise(row) do
    row
    |> String.replace("\n", "")
    |> String.to_integer()
  end
end
