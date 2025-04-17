defmodule PipelineOp do
  def example do


    # Example of using the pipeline operator
    result = 1
             |> add(2)
             |> multiply(3)
             |> subtract(4)

    IO.puts("Result: #{result}") #=> Result: 5

    "hello"
    |> String.upcase()
    |> String.reverse()
    |> IO.puts()

    #pipeline operator với Enum and anonymous functions
    [1,2,3,4]
    |> Enum.map(fn x -> x*2 end)
    |> Enum.filter(fn x -> x > 4 end)

    # pipeline operator with map
    %{name: "John", age: 30}
    |> Map.put(:city, "New York")
    |> Map.update!(:age, fn age -> age + 1 end)
    |> IO.inspect(label: "Updated Map")

  end

  # Định nghĩa các hàm sử dụng với pipe
  def add(a, b), do: a + b
  def multiply(a, b), do: a * b
  def subtract(a, b), do: a - b

  # multi task
  "   functional programming in elixir   "
    |> String.trim()
    |> String.split()
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
    |> IO.puts()  # => "Functional Programming In Elixir"

end
