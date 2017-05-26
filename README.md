# MultiNodeMem

Run one node with:
```
iex --sname e1 -S mix
```

And the other with:
```
iex --sname e2 -S mix
```

then on first node execute:
```
MultiNodeMem.Cache.set(:a, 12)
```
```
MultiNodeMem.Cache.get(:a)
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `multi_node_mem` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:multi_node_mem, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/multi_node_mem](https://hexdocs.pm/multi_node_mem).

