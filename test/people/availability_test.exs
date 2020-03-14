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
    alias People.Availability.Vacation

    @valid_attrs %{end_at: ~D[2010-04-17], is_accepted: true, start_at: ~D[2010-04-17]}
    @update_attrs %{end_at: ~D[2011-05-18], is_accepted: false, start_at: ~D[2011-05-18]}
    @invalid_attrs %{end_at: nil, is_accepted: nil, start_at: nil}

    def vacation_fixture(attrs \\ %{}) do
      {:ok, vacation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Availability.create_vacation()

      vacation
    end

    test "list_vacations/0 returns all vacations" do
      vacation = vacation_fixture()
      assert Availability.list_vacations() == [vacation]
    end

    test "get_vacation!/1 returns the vacation with given id" do
      vacation = vacation_fixture()
      assert Availability.get_vacation!(vacation.id) == vacation
    end

    test "create_vacation/1 with valid data creates a vacation" do
      assert {:ok, %Vacation{} = vacation} = Availability.create_vacation(@valid_attrs)
      assert vacation.end_at == ~D[2010-04-17]
      assert vacation.is_accepted == true
      assert vacation.start_at == ~D[2010-04-17]
    end

    test "create_vacation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Availability.create_vacation(@invalid_attrs)
    end

    test "update_vacation/2 with valid data updates the vacation" do
      vacation = vacation_fixture()
      assert {:ok, %Vacation{} = vacation} = Availability.update_vacation(vacation, @update_attrs)
      assert vacation.end_at == ~D[2011-05-18]
      assert vacation.is_accepted == false
      assert vacation.start_at == ~D[2011-05-18]
    end

    test "update_vacation/2 with invalid data returns error changeset" do
      vacation = vacation_fixture()
      assert {:error, %Ecto.Changeset{}} = Availability.update_vacation(vacation, @invalid_attrs)
      assert vacation == Availability.get_vacation!(vacation.id)
    end

    test "delete_vacation/1 deletes the vacation" do
      vacation = vacation_fixture()
      assert {:ok, %Vacation{}} = Availability.delete_vacation(vacation)
      assert_raise Ecto.NoResultsError, fn -> Availability.get_vacation!(vacation.id) end
    end

    test "change_vacation/1 returns a vacation changeset" do
      vacation = vacation_fixture()
      assert %Ecto.Changeset{} = Availability.change_vacation(vacation)
    end
  end
end
