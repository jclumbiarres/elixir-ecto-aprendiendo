defmodule DataCollector.Usuario do
  use Ecto.Schema
  import Ecto.Changeset

  schema "usuarios" do
    field(:nombre, :string)
    field(:contrasena, :string)

    timestamps()
  end

  def changeset(usuario, params \\ %{}) do
    usuario
    |> cast(params, [:nombre, :contrasena])
    |> validate_required([:nombre, :contrasena])
  end
end
