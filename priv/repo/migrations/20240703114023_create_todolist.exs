defmodule DataCollector.Repo.Migrations.CreateTodolist do
  use Ecto.Migration

  def change do
      create table(:todolist) do
        add(:nombre, :string)
        add(:descripcion, :string)
        add(:completado, :boolean, default: false)
        timestamps()
      end
  end
end
