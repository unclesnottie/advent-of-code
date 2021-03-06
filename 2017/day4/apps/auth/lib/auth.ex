defmodule Auth do
  @moduledoc """
  Documentation for Auth.
  """

  @doc false
  def passphrase_valid?(pass) when is_binary(pass) do
    words =
      pass
      |> String.split()

    num_words =
      words
      |> Enum.count()

    num_unique =
      words
      |> Enum.uniq()
      |> Enum.count()

    num_words == num_unique
  end

  @doc false
  def passphrase_valid2?(pass) when is_binary(pass) do
    words =
      pass
      |> String.split()

    num_words =
      words
      |> Enum.count()

    num_unique =
      words
      |> normalize_words()
      |> Enum.uniq()
      |> Enum.count()

    num_words == num_unique
  end

  @doc false
  def count_valid(passes) when is_binary(passes) do
    passes
    |> String.split("\n", trim: true)
    |> Enum.filter(&passphrase_valid?/1)
    |> Enum.count()
  end

  @doc false
  def count_valid2(passes) when is_binary(passes) do
    passes
    |> String.split("\n", trim: true)
    |> Enum.filter(&passphrase_valid2?/1)
    |> Enum.count()
  end

  @doc false
  defp normalize_words(words) when is_list(words) do
    words
    |> Enum.map(fn word ->
      word
      |> String.graphemes()
      |> Enum.sort()
      |> Enum.join()
    end)
  end
end
