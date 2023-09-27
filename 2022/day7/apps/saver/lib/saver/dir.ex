defmodule Saver.Dir do
  @moduledoc ~S"""
  Dir struct
  """

  defstruct ~w[name parent dirs files]a

  @type t :: %__MODULE__{
          name: binary,
          dirs: %{binary => Saver.Dir.t()},
          files: Saver.FileMap.t()
        }

  @doc """
  Create new directory
  """
  @spec new() :: t()
  def new(), do: new("")

  @spec new(binary) :: t()
  def new(name) when is_binary(name) do
    %__MODULE__{
      name: name,
      dirs: %{},
      files: Saver.FileMap.new()
    }
  end
end
