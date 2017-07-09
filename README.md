# TwitterColor
### Your friendly elixir color robot

![Example](examples/2.jpg)![Example](examples/3.jpg)![Example](examples/4.jpg)![Example](examples/5.jpg)

An elixir bot that will consume a string, generate an image of random colors, and post it to twitter. You can see the bot in action [here](https://twitter.com/elixirColorBot)


## Development
Want to start your own bot?

1. Clone this repo
1. Run `mix deps.get`
1. Create a `.env` in root. It should contain your keys from Twitter and look like this:

```
export CONSUMER_KEY="Key Goes here"
export CONSUMER_SECRET="Another Key Goes Here"
export ACCESS_TOKEN="And Another key goes here"
export ACCESS_TOKEN_SECRET="This is the last key you need"
```

1. In terminal, navigate to the directory and run `iex -S mix`
1. Run `TwitterColor.main` and posts will automatically start.

## Configuration

In `config.exs`, you can modify the `:quantum` job to post as frequently as you want.
