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
    TodoList.listar(%TodoList{}, %{})
  end
end
