defmodule Todolistex do
  alias DataCollector.{TodoList}

  @spec insertar(String.t(), String.t(), boolean()) :: any()
  def insertar(nombre, desc, completado) do
    todo = %{
      nombre: nombre,
      descripcion: desc,
      completado: completado
    }

    try do
      %TodoList{}
      |> TodoList.anadir(todo)
    rescue
      _ -> {:error, "Esto... ha petao"}
    end
  end

  def listar do
    TodoList.listar()
  end

  def listaId(id) do
    TodoList.listaId(id)
  end

  def completar(id) do
    todo = TodoList.listaId(id)
    TodoList.completar(todo)
  end

  def borraTodo do
    TodoList.borrarTodo()
  end

  def borrarId(id) do
    TodoList.borrarId(id)
  end
end
