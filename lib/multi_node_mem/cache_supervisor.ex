defmodule MultiNodeMem.Cache.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    nodes = [:"e1@tardis", :"e2@tardis"]
    [ MultiNodeMem.Cache.child_spec(nodes),
    ] |> supervise(strategy: :one_for_one)
  end

end
