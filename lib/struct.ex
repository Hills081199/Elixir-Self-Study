defmodule User do
  defstruct name: "", age: 0

  def create_user do
    user = %User{name: "John Doe", age: 30}
    IO.puts("Name: #{user.name}, Age: #{user.age}")
  end

  def update_user do
    user = %User{name: "John Doe", age: 30}
    updated_user = %{user | age: 31}
    IO.puts("Updated User: Name: #{updated_user.name}, Age: #{updated_user.age}")
  end

  def printInfo(%User{name: name, age: age}) do
    IO.puts("User's name is #{name} and age is #{age}")
  end

  def common do
    user = %User{}
    if is_struct(user) do
      IO.puts("This is a struct")
    else
      IO.puts("This is not a struct")
    end
  end
end

#Nest struct
defmodule Product do
  defstruct [:name, :price, in_stock: true, user: %User{}]

  def common do
    product = %Product{name: "Laptop", price: 1000, user: %User{name: "John Doe", age: 30}}
    IO.puts("Product: #{product.name}, Price: #{product.price}, User: #{product.user.name}, Age: #{product.user.age}")
  end
end

defmodule Example do
  def check_user_age(%User{age: age}) when age < 18 do
    IO.puts("User is a minor.")
  end

  def check_user_age(%User{age: age}) when age >= 18 do
    IO.puts("User is an adult.")
  end
end

#Guard Clause: when trong Elixir cho phép bạn thêm điều kiện vào mỗi function clause. Điều này giống như việc dùng các điều kiện bổ sung trong if/else, nhưng rất mạnh mẽ và linh hoạt trong Elixir.
