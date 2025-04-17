defmodule Control do
  def if_example do
    age = 20

    if age >= 18 do
      IO.puts("You are an adult.")
    else
      IO.puts("You are a minor.")
    end
  end

  def if_inline_example do
    age = 20

    message = if age >= 18, do: "You are an adult.", else: "You are a minor."
    IO.puts(message)
  end

  def unless_example do
    age = 20

    unless age < 18 do
      IO.puts("You are not a minor.")
    else
      IO.puts("You are a minor.")
    end
  end

  def case_example do
    number = 3

    case number do
      1 -> IO.puts("Number is one.")
      2 -> IO.puts("Number is two.")
      3 -> IO.puts("Number is three.")
      _ -> IO.puts("Number is something else.")
    end

    value = {:ok, "Data Loaded"}
    case value do
      {:ok, data} -> IO.puts("Success: #{data}")
      {:error, reason} -> IO.puts("Error: #{reason}")
      _ -> IO.puts("Unknown response")
    end

    # case with guard clauses
    number = 10
    case number do
      n when n < 0 -> IO.puts("Negative number")
      n when n == 0 -> IO.puts("Zero")
      n when n > 0 -> IO.puts("Positive number")
    end

    # case with wildcard
    value = 10
    case value do
      _ when value > 10 -> IO.puts("Lớn hơn 10")
      _ when value == 10 -> IO.puts("Bằng 10")
      _ when value < 10 -> IO.puts("Nhỏ hơn 10")
    end

    # case wthi map
    user = %{role: :admin}

    case user do
      %{role: :admin} -> IO.puts("Welcome admin")
      %{role: :user} -> IO.puts("Welcome user")
      _ -> IO.puts("Unknown role")
    end

    # assign value into case
    result = case value do
      1 -> "One"
      2 -> "Two"
      _ -> "Unknown"
    end
    IO.puts("Result: #{result}")

  end

  def case_pattern_example({:ok, result}) do
    IO.puts("Got result: #{result}")
  end

  def case_pattern_example({:error, reason}) do
    IO.puts("Failed with reason: #{reason}")
  end

  def case_pattern_example(_) do
    IO.puts("Unknown response")
  end

  def case_pattern_example do
    # Example usage
    case_pattern_example({:ok, "Data loaded"})
    case_pattern_example({:error, "Network error"})
    case_pattern_example({:unknown, "Unknown response"})
    nested_case_example({:ok, "Hello"})
  end

  def nested_case_example(value) do
    case value do
      {:ok, data} ->
        if String.length(data) > 5 do
          IO.puts("Data is long: #{data}")
        else
          IO.puts("Data is short: #{data}")
        end

       _ ->
        IO.puts("Unknown response")
    end
  end

  def cond_example do
    age = 20

    cond do
      age < 18 -> IO.puts("You are a minor.")
      age >= 18 and age < 65 -> IO.puts("You are an adult.")
      age >= 65 -> IO.puts("You are a senior citizen.")
      true -> IO.puts("Age not specified.")
    end

    cond do
      2 + 2 == 5 -> IO.puts("Toán học sai bét")
      2 + 2 == 4 -> IO.puts("Chính xác!")  # dòng này chạy
      true -> IO.puts("Cái gì đó khác")    # mặc định nếu không điều kiện nào đúng
    end

    # cond with nil
    value = nil
    cond do
      value == nil -> IO.puts("Value is nil") # dòng này chạy
      value == 0 -> IO.puts("Value is zero")
      true -> IO.puts("Value is something else")
    end
  end

  def with_example(map) do
    with {:ok, name} <- Map.fetch(map, :name),
          true <- String.length(name) > 2

          do
          {:ok, "Valid name: #{name}"}

          else
            :error -> {:error, "Name key not found"}  # lỗi ở bước 1
            false -> {:error, "Name is too short"} # lỗi ở bước 2
          end
    end

  def divide_numbers(a, b) do
    def divide_numbers(a, b) do
      with {:ok, _} <- check_non_zero(b),
           {:ok, result} <- perform_division(a, b) do
        {:ok, result}
      else
        :error -> {:error, "Cannot divide by zero"}
        {:error, _} -> {:error, "Invalid input"}
      end
    end

    defp check_non_zero(0), do: :error
    defp check_non_zero(_), do: {:ok, "Valid number"}

    defp perform_division(a, b) when is_number(a) and is_number(b), do: {:ok, a / b}
    defp perform_division(_, _), do: {:error, "Invalid input"}
  end

end
