defmodule Saver.Dir do
  @moduledoc ~S"""
  Dir struct
  """

  defstruct ~w[name parent dirs files]a

  @type t :: %__MODULE__{
          name: binary,
          parent: binary | nil,
          dirs: list(binary),
          files: list(Saver.File.t())
        }

  @doc """
  Create new directory
  """
  @spec new(binary) :: t()
  @spec new(binary, binary) :: t()
  def new(name, parent \\ nil) when is_binary(name) and (is_binary(parent) or is_nil(parent)) do
    %__MODULE__{
      name: name,
      parent: parent,
      dirs: [],
      files: []
    }
  end
end
