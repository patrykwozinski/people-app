defmodule People.Availability.Vacations do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias People.Availability.Worker

  schema "vacations" do
    field :is_accepted, :boolean, default: false
    field :start_at, :date
    field :end_at, :date
    belongs_to :worker, Worker

    timestamps()
  end

  @doc false
  def changeset(vacation, attrs) do
    vacation
    |> cast(attrs, [:worker_id, :is_accepted, :start_at, :end_at])
    |> validate_required([:worker_id, :is_accepted, :start_at, :end_at])
  end
end
