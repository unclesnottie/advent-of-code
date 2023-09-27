defmodule Saver.FileMap do
  use Agent

  @type t :: pid()

  # ===== Public API ==========================================================

  @doc """
  Starts a new FileMap.
  """
  @spec new() :: pid()
  def new() do
    {:ok, pid} = start_link([])
    pid
  end

  @doc """
  Gets a value from the `filemap` by `filename`.
  """
  @spec get(t(), binary) :: non_neg_integer() | nil
  def get(filemap, filename) do
    Agent.get(filemap, &Map.get(&1, filename))
  end

  @doc """
  Get total size of all files.
  """
  @spec get_total_size(t()) :: non_neg_integer()
  def get_total_size(filemap) do
    Agent.get(filemap, &(Map.values(&1) |> Enum.sum()))
  end

  @doc """
  Puts the `size` for the given `filename` in the `filemap`.
  """
  @spec put(t(), binary, non_neg_integer()) :: :ok
  def put(filemap, filename, size) do
    Agent.update(filemap, &Map.put(&1, filename, size))
  end

  # ===== Agent Callbacks =====================================================
  @doc """
  Starts a new FileMap.
  """
  @spec start_link(GenServer.options()) :: Agent.on_start()
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end
end
