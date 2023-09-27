defmodule Saver do
  @moduledoc """
  Documentation for `Saver`.
  """

  @doc """
  Entry function into Saver
  """
  def process(filename) when is_binary(filename) do
    part_one_impl(filename)
  end

  # Implements solution to part one
  defp part_one_impl(filename) when is_binary(filename) do
    filename
    |> read_commands()
    |> IO.inspect(label: "Processed commands")
    |> Enum.reduce({%{}, nil}, &process_command/2)
    |> IO.inspect(label: "Dir tree")

    # Temp success return value
    {:ok, "Success"}
  end

  # Reads list of commands
  defp read_commands(filename) when is_binary(filename) do
    filename
    |> File.stream!()
    |> Stream.map(&String.split/1)
    |> Stream.map(&string_list_to_command/1)
    |> Stream.reject(&is_nil/1)
    |> Enum.to_list()
  end

  # Converts string list commands
  defp string_list_to_command(["$", "cd", ".."]), do: {:cd, :up}
  defp string_list_to_command(["$", "cd", dir]), do: {:cd, dir}
  defp string_list_to_command(["$", "ls"]), do: nil
  defp string_list_to_command(["dir", dir]), do: {:dir, dir}

  defp string_list_to_command([size, name]) do
    {int, _} = Integer.parse(size, 10)
    {:file, name, int}
  end

  # Processes a single command
  defp process_command({:cd, :up}, {dir_map, curr_dir = %{parent: nil}}) do
    {dir_map, curr_dir}
  end

  defp process_command({:cd, :up}, {dir_map, %{parent: name}}) do
    {dir_map, Map.get(dir_map, name)}
  end

  defp process_command({:cd, dir}, {dir_map, _}) when dir_map == %{} do
    new_dir = Saver.Dir.new(dir)
    new_dir_map = %{} |> Map.put_new(dir, new_dir)
    {new_dir_map, new_dir}
  end

  defp process_command({:cd, dir}, {dir_map, curr_dir}) do
    case Map.get(dir_map, dir) do
      nil ->
        new_dir = Saver.Dir.new(dir, curr_dir.name)
        parent_dir = curr_dir |> Map.put(:dirs, [dir | curr_dir.dirs])
        new_dir_map = dir_map |> Map.put_new(dir, new_dir) |> Map.put(curr_dir.name, parent_dir)
        {new_dir_map, new_dir}

      found_dir ->
        {dir_map, found_dir}
    end
  end

  defp process_command({:dir, dir}, {dir_map, curr_dir}) do
    case Map.get(dir_map, dir) do
      nil ->
        new_dir = Saver.Dir.new(dir, curr_dir.name)
        parent_dir = curr_dir |> Map.put(:dirs, [dir | curr_dir.dirs])
        new_dir_map = dir_map |> Map.put_new(dir, new_dir) |> Map.put(curr_dir.name, parent_dir)
        {new_dir_map, parent_dir}

      found_dir ->
        parent_dir = curr_dir |> Map.put(:dirs, [dir | curr_dir.dirs])
        new_dir_map = dir_map |> Map.put(curr_dir.name, parent_dir)
        {new_dir_map, parent_dir}
    end
  end

  defp process_command({:file, name, size}, {dir_map, curr_dir}) do
    new_curr_dir = curr_dir |> Map.put(:files, [Saver.File.new(name, size) | curr_dir.files])
    new_dir_map = dir_map |> Map.put(curr_dir.name, new_curr_dir)
    {new_dir_map, new_curr_dir}
  end
end
