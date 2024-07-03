defmodule DataCollector.Worker do
  use GenServer
  alias DataCollector.{Usuario, Repo}

  @spec start_link(any()) :: :ignore | {:error, any()} | {:ok, pid()}
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @spec init(any()) :: {:ok, nil}
  def init(_opts) do
    Process.send_after(self(), :work, 1000)
    {:ok, nil}
  end

  def handle_info(:work, state) do
    IO.puts("Worker is working")

    data = %{
      nombre: "Usuario_#{Enum.random(1..1000)}",
      contrasena: "#{Enum.random(1..1000)}"
    }

    %Usuario{}
    |> Usuario.changeset(data)
    |> Repo.insert()

    Process.send_after(self(), :work, 1000)
    {:noreply, state}
  end
end
