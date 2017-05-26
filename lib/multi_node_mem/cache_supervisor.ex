defmodule MultiNodeMem.Cache.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    [ MultiNodeMem.Cache.child_spec,
    ] |> supervise(strategy: :one_for_one)
  end

end
