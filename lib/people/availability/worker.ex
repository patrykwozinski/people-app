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

  @doc false
  def can_request?(worker, start_at, end_at) do
    used_days = worker.vacations()
    |>Enum.map(fn vacation -> Date.diff(vacation.end_at, vacation.start_at) end)
    |>Enum.sum()

    requested_days = Date.diff(end_at, start_at)

    worker.vacation_days > used_days + requested_days
  end
end
