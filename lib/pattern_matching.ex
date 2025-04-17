defmodule PatMatch do
  @moduledoc """
  Documentation for `PatMatch`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PatMatch.hello()
      :world

  """
  def hello do
    :world
  end

  def example do
    # Pattern matching with variables
    {a, b} = {1, 2}
    IO.puts("a: #{a}, b: #{b}")

    # Pattern matching with lists
    [head | tail] = [1, 2, 3, 4]
    IO.puts("Head: #{head}, Tail: #{inspect(tail)}") #=> Head: 1, Tail: [2, 3, 4]

    # Pattern matching with tuples
    {x, y} = {10, "Success"}
    IO.puts("x: #{x}, y: #{y}")

    # Match success
    {status, message} = {:ok, "Operation successful"}
    IO.puts("Status: #{status}, Message: #{message}")

    # Match success
    a = 1
    1 = a
    IO.puts("a: #{a}")
    # Match thất bại:
    # 1 = 2           # => MatchError
    # {1, 2} = {1, 2, 3} # => MatchError (số phần tử không khớp)

    # Match with list
    list = [1, 2, 3]
    [1 | tail] = list
    IO.puts("Tail: #{inspect(tail)}") #=> Tail: [2, 3]
    [head | _] = list
    IO.puts("Head: #{head}")
    [head | tail] = list
    IO.puts("Head: #{head}, Tail: #{inspect(tail)}")

    # Match with tuple
    tuple = {1, 2, 3}
    IO.puts("Tuple: #{inspect(tuple)}")

    # {1, 2} = tuple # MatchError
    #{1, 2, 4} = tuple # MatchError

    {:ok, value} = {:ok, 42}
    IO.puts("Value: #{value}")  #42
    {:error, reason} = {:error, "Something went wrong"}
    IO.puts("Reason: #{reason}") # "Something went wrong"

    # # ** (MatchError) no match of right hand side value: {:error, "Oops"}
    # {:ok, value} = {:error, "Oops"} # MatchError

    # MATCH WITH MAP
    %{name: name, age: age} = %{name: "John", age: 30}
    IO.puts("Name: #{name}, Age: #{age}")

    ## MatchError
    # %{name: name} = %{age: 30} # MatchError

    # Pattern matching with  case
    case {1, 2} do
      {1, 2} -> IO.puts("Matched: {1, 2}")
      {3, 4} -> IO.puts("Matched: {3, 4}")
      {1, _} -> IO.puts("Matched: {1, _}")
      {_, 2} -> IO.puts("Matched: {_, 2}")
      _ -> IO.puts("No match")
    end

    # Pattern matching with lists
    list = [1, 2, 3, 4, 5]
    [a, b | tail] = list
    IO.puts("a: #{a}, b: #{b}, tail: #{inspect(tail)}") #=> a: 1, b: 2, tail: [3, 4, 5]
    [head | _] = list
    IO.puts("Head: #{head}") #=> Head: 1

    # Pin operator
    x = 1
    x = 2 #=> 2
    IO.puts("x: #{x}") #=> x: 2

    x = 1
    # ^x = 2 #=> MatchError
  end

  def pin_operator_example do
    x = 1

    case 1 do
      ^x -> IO.puts("Matched with pinned x: #{x}")
      _ -> IO.puts("No match")
    end

    case 2 do
      ^x -> IO.puts("Matched with pinned x")
      _ -> IO.puts("No match because 2 ≠ #{x}")
    end

    # Không dùng pin, sẽ gán lại x
    case 2 do
      x -> IO.puts("New x = #{x}")
    end
  end
end
