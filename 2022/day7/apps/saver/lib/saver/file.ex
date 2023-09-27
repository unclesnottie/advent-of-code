defmodule Saver.File do
  @moduledoc ~S"""
  File struct
  """

  defstruct ~w[name size]a

  @type t :: %__MODULE__{
          name: binary,
          size: non_neg_integer()
        }

  @doc """
  Create new file
  """
  @spec new(binary, non_neg_integer()) :: t()
  def new(name, size) when is_binary(name) and is_integer(size) and size >= 0 do
    %__MODULE__{
      name: name,
      size: size
    }
  end
end
