defmodule People.Availability.Vacation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vacations" do
    field :is_accepted, :boolean, default: false
    field :end_at, :date
    field :start_at, :date
    field :worker_id, :id

    timestamps()
  end

  @doc false
  def changeset(vacation, attrs) do
    vacation
    |> cast(attrs, [:is_accepted, :start_at, :end_at])
    |> validate_required([:is_accepted, :start_at, :end_at])
  end
end
