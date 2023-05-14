defmodule Veterinary.OwnersTest do
  use Veterinary.DataCase

  alias Veterinary.Owners

  describe "owners" do
    alias Veterinary.Owners.Owner

    import Veterinary.OwnersFixtures

    @invalid_attrs %{address: nil, birthdate: nil, cellphone: nil, city: nil, document_id: nil, email: nil, gender: nil, lastname: nil, name: nil, phone: nil}

    test "list_owners/0 returns all owners" do
      owner = owner_fixture()
      assert Owners.list_owners() == [owner]
    end

    test "get_owner!/1 returns the owner with given id" do
      owner = owner_fixture()
      assert Owners.get_owner!(owner.id) == owner
    end

    test "create_owner/1 with valid data creates a owner" do
      valid_attrs = %{address: "some address", birthdate: "some birthdate", cellphone: 42, city: "some city", document_id: 42, email: "some email", gender: "some gender", lastname: "some lastname", name: "some name", phone: 42}

      assert {:ok, %Owner{} = owner} = Owners.create_owner(valid_attrs)
      assert owner.address == "some address"
      assert owner.birthdate == "some birthdate"
      assert owner.cellphone == 42
      assert owner.city == "some city"
      assert owner.document_id == 42
      assert owner.email == "some email"
      assert owner.gender == "some gender"
      assert owner.lastname == "some lastname"
      assert owner.name == "some name"
      assert owner.phone == 42
    end

    test "create_owner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Owners.create_owner(@invalid_attrs)
    end

    test "update_owner/2 with valid data updates the owner" do
      owner = owner_fixture()
      update_attrs = %{address: "some updated address", birthdate: "some updated birthdate", cellphone: 43, city: "some updated city", document_id: 43, email: "some updated email", gender: "some updated gender", lastname: "some updated lastname", name: "some updated name", phone: 43}

      assert {:ok, %Owner{} = owner} = Owners.update_owner(owner, update_attrs)
      assert owner.address == "some updated address"
      assert owner.birthdate == "some updated birthdate"
      assert owner.cellphone == 43
      assert owner.city == "some updated city"
      assert owner.document_id == 43
      assert owner.email == "some updated email"
      assert owner.gender == "some updated gender"
      assert owner.lastname == "some updated lastname"
      assert owner.name == "some updated name"
      assert owner.phone == 43
    end

    test "update_owner/2 with invalid data returns error changeset" do
      owner = owner_fixture()
      assert {:error, %Ecto.Changeset{}} = Owners.update_owner(owner, @invalid_attrs)
      assert owner == Owners.get_owner!(owner.id)
    end

    test "delete_owner/1 deletes the owner" do
      owner = owner_fixture()
      assert {:ok, %Owner{}} = Owners.delete_owner(owner)
      assert_raise Ecto.NoResultsError, fn -> Owners.get_owner!(owner.id) end
    end

    test "change_owner/1 returns a owner changeset" do
      owner = owner_fixture()
      assert %Ecto.Changeset{} = Owners.change_owner(owner)
    end
  end
end
