defmodule URL do
  def to_query(input, namespace) do
    Enum.map(input, fn({key, value}) -> parse("#{namespace}[#{key}]",value)end)
    |> Enum.join("&")
  end
  def to_query(input) do
    Enum.map(input, fn({key, value}) -> parse(key,value) end)
    |> Enum.join("&")
  end
  def parse(key, value) when is_map(value) do
    to_query(value, key)
  end
  def parse(key, value) do
    "#{key}=#{value}"
  end
end
