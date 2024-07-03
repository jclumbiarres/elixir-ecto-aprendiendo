defmodule DataCollector.Repo do
  use Ecto.Repo, otp_app: :todolistex, adapter: Ecto.Adapters.SQLite3
end
