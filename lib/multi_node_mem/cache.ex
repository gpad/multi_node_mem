defmodule MultiNodeMem.Cache do
  use Mem,
    worker_number:      2,       # (optional, default: 2) how many processes in worker pool

    maxmemory_size:     "1000M", # (optional, default: nil) max memory used, support such format: [1000, "10k", "1GB", "1000 K"]
    maxmemory_strategy: :lru,    # ([:lru, :ttl, :fifo]) strategy for cleaning memory
    persistence:        true,    # (optional, default: false) whether enable persistence
    nodes: [:"e1@tardis", :"e2@tardis"]
end

    #default_ttl:        300,     # (optional, default: nil) default expire seconds for set/2
