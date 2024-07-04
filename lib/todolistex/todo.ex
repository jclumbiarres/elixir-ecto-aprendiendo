defmodule DataCollector.TodoList do
  alias DataCollector.TodoList
  use Ecto.Schema
  import Ecto.Changeset

  schema "todolist" do
    field(:nombre, :string)
    field(:descripcion, :string)
    field(:completado, :boolean, default: false)

    timestamps()
  end

  def changeset(todolist, params \\ %{}) do
    todolist
    |> cast(params, [:nombre, :descripcion, :completado])
    |> validate_required([:nombre, :descripcion, :completado])
  end

  def completar(todolist) do
    %DataCollector.TodoList{todolist | completado: true}
  end

  def actualizar(todolist, params) do
    todolist
    |> DataCollector.TodoList.changeset(params)
  end

  def anadir(_todolist, params) do
    {:ok, _} =
      %DataCollector.TodoList{}
      |> DataCollector.TodoList.changeset(params)
      |> validate_required([:nombre, :descripcion, :completado])
      |> DataCollector.Repo.insert()
  end

  def listar do
    TodoList
    |> DataCollector.Repo.all()
  end

  def listaId(id) do
    TodoList
    |> DataCollector.Repo.get(id)
  end
end
