# TwitterColor

An elixir bot that will consume a string, generate an image of random colors, and post it to twitter.

You need to set up your env. or check your secret gist...

Your `.env` should be in root and look like:

```
export CONSUMER_KEY="Key Goes here"
export CONSUMER_SECRET="Another Key Goes Here"
export ACCESS_TOKEN="And Another key goes here"
export ACCESS_TOKEN_SECRET="This is the last key you need"
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `twitter_color` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:twitter_color, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/twitter_color](https://hexdocs.pm/twitter_color).
