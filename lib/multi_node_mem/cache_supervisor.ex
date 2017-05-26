defmodule MultiNodeMem.Cache.Supervisor do
  use Supervisor
  require Logger

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    nodes = [:"e1@tardis", :"e2@tardis"]

    Distribution.connect_to_nodes(nodes)
    if (Distribution.first_node?(nodes, node())) do
      Distribution.stop_mnesia(nodes)
      Logger.debug ">>> Creating mnesia schema for: #{inspect nodes} ..."
      ret = :mnesia.create_schema(nodes)
      Logger.debug ">>> Creating mnesia schema: #{inspect ret} !!!"
      Distribution.start_mnesia(nodes)
    else
      # Application.stop(:mnesia)
      Logger.debug ">>> Wait mnesia... "
      if Distribution.wait_mnesia_starting(10) == :timeout do
        :mnesia.start()
      end
    end

    [ MultiNodeMem.Cache.child_spec([nodes: nodes, init_mnesia: false]),
    ] |> supervise(strategy: :one_for_one)
  end

end
