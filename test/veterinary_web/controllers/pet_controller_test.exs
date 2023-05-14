defmodule VeterinaryWeb.PetControllerTest do
  use VeterinaryWeb.ConnCase

  import Veterinary.PetsFixtures

  alias Veterinary.Pets.Pet

  @create_attrs %{
    additionalCharacteristics: "some additionalCharacteristics",
    birthdate: "some birthdate",
    breed: "some breed",
    chip: true,
    color: "some color",
    gender: "some gender",
    kind: "some kind",
    name: "some name",
    size: "some size",
    weight: 42
  }
  @update_attrs %{
    additionalCharacteristics: "some updated additionalCharacteristics",
    birthdate: "some updated birthdate",
    breed: "some updated breed",
    chip: false,
    color: "some updated color",
    gender: "some updated gender",
    kind: "some updated kind",
    name: "some updated name",
    size: "some updated size",
    weight: 43
  }
  @invalid_attrs %{additionalCharacteristics: nil, birthdate: nil, breed: nil, chip: nil, color: nil, gender: nil, kind: nil, name: nil, size: nil, weight: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pets", %{conn: conn} do
      conn = get(conn, ~p"/api/pets")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pet" do
    test "renders pet when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/pets", pet: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/pets/#{id}")

      assert %{
               "id" => ^id,
               "additionalCharacteristics" => "some additionalCharacteristics",
               "birthdate" => "some birthdate",
               "breed" => "some breed",
               "chip" => true,
               "color" => "some color",
               "gender" => "some gender",
               "kind" => "some kind",
               "name" => "some name",
               "size" => "some size",
               "weight" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/pets", pet: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pet" do
    setup [:create_pet]

    test "renders pet when data is valid", %{conn: conn, pet: %Pet{id: id} = pet} do
      conn = put(conn, ~p"/api/pets/#{pet}", pet: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/pets/#{id}")

      assert %{
               "id" => ^id,
               "additionalCharacteristics" => "some updated additionalCharacteristics",
               "birthdate" => "some updated birthdate",
               "breed" => "some updated breed",
               "chip" => false,
               "color" => "some updated color",
               "gender" => "some updated gender",
               "kind" => "some updated kind",
               "name" => "some updated name",
               "size" => "some updated size",
               "weight" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pet: pet} do
      conn = put(conn, ~p"/api/pets/#{pet}", pet: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pet" do
    setup [:create_pet]

    test "deletes chosen pet", %{conn: conn, pet: pet} do
      conn = delete(conn, ~p"/api/pets/#{pet}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/pets/#{pet}")
      end
    end
  end

  defp create_pet(_) do
    pet = pet_fixture()
    %{pet: pet}
  end
end
