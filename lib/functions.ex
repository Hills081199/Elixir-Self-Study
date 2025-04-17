defmodule Function do
  def say_hello(name) do
    IO.puts("Hello, #{name}!")
  end

  #Trong Elixir, giá trị cuối cùng trong thân hàm sẽ được trả về mặc định, không cần return.
  def add(a, b) do
    a + b
  end

  #Guard clauses
  def check_number(num) when is_integer(num) do
    IO.puts("#{num} is an integer.")
  end
  def check_number(num) when is_float(num) do
    IO.puts("#{num} is a float.")
  end

  #Private function (only accessible within the module)
  defp private_function do
    IO.puts("This is a private function.")
  end

  #anonymous function
  def anonymous_function do
    add = fn a, b -> a + b end
    IO.puts("Sum: #{add.(2, 3)}")

    #anoynmous function with abbreviation
    add_abbr = &(&1 + &2)
    IO.puts("Sum: #{add_abbr.(2, 3)}")
  end

  defmodule Greeter2 do
    def hello(), do: "Hello, anonymous person!"   # hello/0
    def hello(name), do: "Hello, " <> name        # hello/1
    def hello(name1, name2), do: "Hello, #{name1} and #{name2}"
                                                  # hello/2
  end

  defmodule Greeter do
    def hello(name, language_code \\ "vn") do
      phrase(language_code) <> name # <> là toán tử nối chuỗi
    end

    defp phrase("vn"), do: "Chào, "
    defp phrase("en"), do: "Hello, "
  end

  #Pattern matching with function arguments
  def greet(:en), do: "Hello!"
  def greet(:vn), do: "Xin chào!"
end
