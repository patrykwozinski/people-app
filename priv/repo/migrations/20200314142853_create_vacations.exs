defmodule People.Repo.Migrations.CreateVacations do
  use Ecto.Migration

  def change do
    create table(:vacations) do
      add :is_accepted, :boolean, default: false, null: false
      add :start_at, :date
      add :end_at, :date
      add :worker_id, references(:workers, on_delete: :nothing)

      timestamps()
    end

    create index(:vacations, [:worker_id])
  end
end
