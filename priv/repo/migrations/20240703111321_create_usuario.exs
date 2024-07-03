defmodule DataCollector.Repo.Migrations.CreateUsuario do
  use Ecto.Migration

  def change do
      create table(:usuarios) do
        add(:nombre, :string)
        add(:contrasena, :string)
        timestamps()
      end
  end
end
