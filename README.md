# TestWeather

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Featured Dependencies

## ExOwm

ExOwm is currently handling the following main OpenWeatherMap APIs:

defp deps() do
  [{:ex_owm, "~> 1.2.3"}]
end

Sample API calls may look following:

ExOwm.get_current_weather([%{lat: 52.374031, lon: 4.88969}], units: :metric, lang: :pl)

## CSV

RFC 4180 compliant CSV parsing and encoding for Elixir. Allows to specify other separators, so it could also be named: TSV, but it isn't.

defp deps() do
  [{:csv, "~> 2.4.1"}]
end

Sample to convert a filestream into a stream of rows in order of the given stream:

"../test/fixtures/docs/valid.csv"
|> Path.expand(__DIR__)
|> File.stream!
|> CSV.decode
|> Enum.take(2)

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
