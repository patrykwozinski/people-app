defmodule People.AvailabilityTest do
  use People.DataCase

  alias People.Availability

  describe "workers" do
    alias People.Availability.Worker

    @valid_attrs %{vacation_days: 42}
    @update_attrs %{vacation_days: 43}
    @invalid_attrs %{vacation_days: nil}

    def worker_fixture(attrs \\ %{}) do
      {:ok, worker} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Availability.create_worker()

      worker
    end

    test "get_worker!/1 returns the worker with given id" do
      worker = worker_fixture()
      assert Availability.get_worker!(worker.id) == worker
    end

    test "create_worker/1 with valid data creates a worker" do
      assert {:ok, %Worker{} = worker} = Availability.create_worker(@valid_attrs)
      assert worker.vacation_days == 42
    end

    test "create_worker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Availability.create_worker(@invalid_attrs)
    end

    test "update_worker/2 with valid data updates the worker" do
      worker = worker_fixture()
      assert {:ok, %Worker{} = worker} = Availability.update_worker(worker, @update_attrs)
      assert worker.vacation_days == 43
    end

    test "update_worker/2 with invalid data returns error changeset" do
      worker = worker_fixture()
      assert {:error, %Ecto.Changeset{}} = Availability.update_worker(worker, @invalid_attrs)
      assert worker == Availability.get_worker!(worker.id)
    end

    test "delete_worker/1 deletes the worker" do
      worker = worker_fixture()
      assert {:ok, %Worker{}} = Availability.delete_worker(worker)
      assert_raise Ecto.NoResultsError, fn -> Availability.get_worker!(worker.id) end
    end

    test "change_worker/1 returns a worker changeset" do
      worker = worker_fixture()
      assert %Ecto.Changeset{} = Availability.change_worker(worker)
    end
  end

  describe "vacations" do
    alias People.Availability.Vacations
    alias People.Availability.Worker

    @valid_attrs %{end_at: ~D[2010-04-20], start_at: ~D[2010-04-17]}

    def random_worker do
      {:ok, worker} = Availability.create_worker(%{vacation_days: 42})

      worker
    end

    def worker_without_vacation_days do
      {:ok, worker} = Availability.create_worker(%{vacation_days: 0})

      worker
    end

    # def vacations_fixture(attrs \\ %{}) do
    #   {:ok, vacations} =
    #     attrs
    #     |> Enum.into(@valid_attrs)
    #     |> Availability.request_vacations()

    #   vacations
    # end

    test "requested vacations successfully" do
      worker = random_worker()
      attrs = %{worker_id: worker.id}
      |>Enum.into(@valid_attrs)

      assert {:ok, %Vacations{} = vacations} = Availability.request_vacations(attrs)
    end

    test "cannot request vacations if no days left" do
      worker = worker_without_vacation_days()
      attrs = %{worker_id: worker.id}
      |>Enum.into(@valid_attrs)

      assert {:error, "no vacation days left"} = Availability.request_vacations(attrs)
    end
  end
end
