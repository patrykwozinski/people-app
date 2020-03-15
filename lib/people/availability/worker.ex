defmodule People.Availability.Worker do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias People.Availability.Vacations

  schema "workers" do
    field :vacation_days, :integer
    field :user_id, :id
    field :manager_id, :id
    has_many :vacations, Vacations

    timestamps()
  end

  @doc false
  def changeset(worker, attrs) do
    worker
    |> cast(attrs, [:vacation_days])
    |> validate_required([:vacation_days])
  end
end
