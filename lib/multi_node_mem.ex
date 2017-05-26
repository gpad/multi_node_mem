defmodule MultiNodeMem do
  @moduledoc """
  Documentation for MultiNodeMem.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MultiNodeMem.hello
      :world

  """
  def hello do
    Node.connect :e2@tardis
    MultiNodeMem.Cache.set(:a, 12)
    MultiNodeMem.Cache.get(:a)
    :world
  end
end
