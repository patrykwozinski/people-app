defmodule People.Availability do
  @moduledoc """
  The Availability context.
  """

  import Ecto.Query, warn: false
  alias People.Repo

  alias People.Availability.Worker

  @doc """
  Gets a single worker.

  Raises `Ecto.NoResultsError` if the Worker does not exist.

  ## Examples

      iex> get_worker!(123)
      %Worker{}

      iex> get_worker!(456)
      ** (Ecto.NoResultsError)

  """
  def get_worker!(id), do: Repo.get!(Worker, id)

  @doc """
  Creates a worker.

  ## Examples

      iex> create_worker(%{field: value})
      {:ok, %Worker{}}

      iex> create_worker(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_worker(attrs \\ %{}) do
    %Worker{}
    |> Worker.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a worker.

  ## Examples

      iex> update_worker(worker, %{field: new_value})
      {:ok, %Worker{}}

      iex> update_worker(worker, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_worker(%Worker{} = worker, attrs) do
    worker
    |> Worker.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a worker.

  ## Examples

      iex> delete_worker(worker)
      {:ok, %Worker{}}

      iex> delete_worker(worker)
      {:error, %Ecto.Changeset{}}

  """
  def delete_worker(%Worker{} = worker) do
    Repo.delete(worker)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking worker changes.

  ## Examples

      iex> change_worker(worker)
      %Ecto.Changeset{source: %Worker{}}

  """
  def change_worker(%Worker{} = worker) do
    Worker.changeset(worker, %{})
  end

  alias People.Availability.Vacation

  @doc """
  Returns the list of vacations.

  ## Examples

      iex> list_vacations()
      [%Vacation{}, ...]

  """
  def list_vacations do
    Repo.all(Vacation)
  end

  @doc """
  Gets a single vacation.

  Raises `Ecto.NoResultsError` if the Vacation does not exist.

  ## Examples

      iex> get_vacation!(123)
      %Vacation{}

      iex> get_vacation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vacation!(id), do: Repo.get!(Vacation, id)

  @doc """
  Creates a vacation.

  ## Examples

      iex> create_vacation(%{field: value})
      {:ok, %Vacation{}}

      iex> create_vacation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vacation(attrs \\ %{}) do
    %Vacation{}
    |> Vacation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vacation.

  ## Examples

      iex> update_vacation(vacation, %{field: new_value})
      {:ok, %Vacation{}}

      iex> update_vacation(vacation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vacation(%Vacation{} = vacation, attrs) do
    vacation
    |> Vacation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vacation.

  ## Examples

      iex> delete_vacation(vacation)
      {:ok, %Vacation{}}

      iex> delete_vacation(vacation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vacation(%Vacation{} = vacation) do
    Repo.delete(vacation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vacation changes.

  ## Examples

      iex> change_vacation(vacation)
      %Ecto.Changeset{source: %Vacation{}}

  """
  def change_vacation(%Vacation{} = vacation) do
    Vacation.changeset(vacation, %{})
  end
end
