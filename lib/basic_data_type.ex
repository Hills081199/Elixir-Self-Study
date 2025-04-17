defmodule BasicDataType do
  @moduledoc """
  Documentation for `DataType`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> DataType.hello()
      :world

  """
  def hello do
    :world
  end

  def int_example do
    age = 30
    IO.puts(age * 2)
  end

  def float_example do
    pi = 3.14
    IO.puts(pi * 2)
  end

  def boolean_example do
    is_active = true
    is_admin = false
    IO.puts("Is active: #{is_active}")
    IO.puts("Is admin: #{is_admin}")
    IO.puts(is_active and is_admin) #=> false
    IO.puts(is_active and not is_admin) # => true
  end

  def atom_example do
    # Trong Elixir, atom là một hằng số (constant) có tên, dùng để biểu diễn những giá trị không thay đổi, định danh, hoặc trạng thái logic.
    atom = :hello
    IO.puts("Atom: #{atom}")
    IO.puts("Is atom: #{is_atom(atom)}")
    IO.puts("Is integer: #{is_integer(atom)}")
    IO.puts("atom == :hello : #{atom == :hello}")
  end

  def string_example do
    name = "John Doe"
    IO.puts("Hello, #{name}!")
    IO.puts("Length of name: #{String.length(name)}")
    IO.puts("Uppercase name: #{String.upcase(name)}")
    IO.puts("Lowercase name: #{String.downcase(name)}")
    IO.puts("First character: #{String.at(name, 0)}")
    IO.puts("Last character: #{String.at(name, -1)}")
    IO.puts("Substring: #{String.slice(name, 0..3)}")
    IO.puts("Reversed name: #{String.reverse(name)}")
    IO.puts("Name contains 'John': #{String.contains?(name, "John")}")
    IO.puts("....")
  end

  def list_example do
    list = [1, 2, 3, 4, 5]
    IO.puts("List: #{inspect(list)}")
    IO.puts("First element: #{List.first(list)}")
    IO.puts("Last element: #{List.last(list)}")
    IO.puts("Length of list: #{length(list)}")
    IO.puts("Sum of list: #{Enum.sum(list)}")
    IO.puts("Max of list: #{Enum.max(list)}")

    #Khác với IO.puts/1 (in ra chuỗi), IO.inspect/1 in ra bất kỳ kiểu dữ liệu nào, kể cả kiểu phức tạp.
    IO.inspect(list)
    IO.inspect(list, label: "List")
    IO.inspect(list, label: "List", pretty: true)
    IO.puts("....")
  end


  def map_example do
    map = %{
      name: "John Doe",
      age: 30,
      is_active: true
    }

    # ACCESS MAOP
    IO.puts("Map: #{inspect(map)}")
    IO.puts("Name: #{map[:name]}")
    IO.puts("Age: #{map[:age]}")
    IO.puts("Is active: #{map[:is_active]}")
    IO.puts("map.name : #{map.name}")
    IO.puts("map.age : #{map.age}")
    IO.puts("map.is_active : #{map.is_active}")
    IO.puts("....")

    # Map.get/2
    IO.puts("Map.get(map, :name) : #{Map.get(map, :name)}")
    IO.puts("Map.get(map, :age) : #{Map.get(map, :age)}")
    IO.puts("Map.get(map, :is_active) : #{Map.get(map, :is_active)}")
    IO.puts("....")

    #Update map
    map = Map.put(map, :age, 31)
    IO.puts("Updated map: #{inspect(map)}")

    #other syntax to update
    map = %{map | age: 32}
    IO.puts("Updated map: #{inspect(map)}") # Cú pháp %{map | age: 32} chỉ dùng khi key đã tồn tại. Nếu key chưa có, dùng Map.put/3:

    #Delete key in map
    map = Map.delete(map, :is_active)
    IO.puts("Updated map after deleting: #{inspect(map)}") # Cú pháp Map.delete/2 dùng để xóa key trong map. Nếu key không tồn tại, không có gì xảy ra.

    #Check key in map
    IO.puts("Is key :name in map? #{Map.has_key?(map, :name)}") # Cú pháp Map.has_key?/2 dùng để kiểm tra key có tồn tại trong map hay không. Nếu key không tồn tại, trả về false.
    IO.puts("Is key :is_active in map? #{Map.has_key?(map, :is_active)}") # Cú pháp Map.has_key?/2 dùng để kiểm tra key có tồn tại trong map hay không. Nếu key không tồn tại, trả về false.

    #loop through map
    IO.puts("Loop through map:")
    for {key, value} <- map do
      IO.puts("#{key}: #{value}")
    end

    #loop through map with Enum.each/2
    IO.puts("Loop through map with Enum.each/2:")
    Enum.each(map, fn {key, value} ->
      IO.puts("#{key}: #{value}")
    end)

    #Map.get/3
    IO.puts("Map.get(map, :name, \"Unknown\") : #{Map.get(map, :name, "Unknown")}") # Cú pháp Map.get/3 dùng để lấy giá trị của key trong map. Nếu key không tồn tại, trả về giá trị mặc định.
    IO.puts("Map.get(map, :is_active, false) : #{Map.get(map, :is_active, false)}") # Cú pháp Map.get/3 dùng để lấy giá trị của key trong map. Nếu key không tồn tại, trả về giá trị mặc định.

    #Get all keys of map
    IO.puts("Keys of map: #{inspect(Map.keys(map))}") # Cú pháp Map.keys/1 dùng để lấy tất cả các key trong map. Trả về danh sách các key.
    IO.puts("....")

  end

  def tuple_example do
    #create tuple with  elements (Các phần tử trong Tuple có thể là bất kỳ kiểu dữ liệu nào (integer, string, list, map, v.v))
    tuple1 = {:ok, "Success"}
    tuple2 = {:error, "Something went wrong", 500}
    IO.inspect(tuple1)
    IO.inspect(tuple2)

    #access tuple by elem/2
    tuple = {:ok, "Hello, Elixir!"}
    IO.puts("First element: #{elem(tuple, 0)}")
    IO.puts("Second element: #{elem(tuple, 1)}")
    IO.puts("Tuple: #{inspect(tuple)}")
    IO.puts("....")

    #calculate length of tuple
    tuple = {1, 2, 3, 4, 5}
    IO.puts("Length of tuple: #{tuple_size(tuple)}") # Cú pháp tuple_size/1 dùng để tính độ dài của tuple. Trả về số lượng phần tử trong tuple.

    #tuple is immutable
    # Cú pháp tuple = {1, 2, 3} là không hợp lệ vì tuple là bất biến (immutable). Để thay đổi giá trị của tuple, ta phải tạo một tuple mới.
    new_tuple = {1, 2, 3}
    IO.inspect(new_tuple)
  end

end
