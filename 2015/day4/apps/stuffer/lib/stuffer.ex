defmodule Stuffer do
  @moduledoc """
  Documentation for Stuffer.
  """

  def find_key2(str) when is_binary(str) do
    Stream.iterate(0, &(&1 + 1))
    |> Enum.find(fn x ->
      "#{str}#{x}"
      |> md5
      |> String.starts_with?("000000")
    end)
  end

  def find_key(str) when is_binary(str) do
    Stream.iterate(0, &(&1 + 1))
    |> Enum.find(fn x ->
      "#{str}#{x}"
      |> md5
      |> String.starts_with?("00000")
    end)
  end

  def md5(str) when is_binary(str) do
    :crypto.hash(:md5, str)
    |> Base.encode16()
  end
end
