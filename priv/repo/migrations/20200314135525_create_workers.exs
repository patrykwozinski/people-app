defmodule People.Repo.Migrations.CreateWorkers do
  use Ecto.Migration

  def change do
    create table(:workers) do
      add :vacation_days, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :manager_id, references(:workers, on_delete: :nothing)

      timestamps()
    end

    create index(:workers, [:user_id])
    create index(:workers, [:manager_id])
  end
end
