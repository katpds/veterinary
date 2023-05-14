defmodule VeterinaryWeb.OwnerControllerTest do
  use VeterinaryWeb.ConnCase

  import Veterinary.OwnersFixtures

  alias Veterinary.Owners.Owner

  @create_attrs %{
    address: "some address",
    birthdate: "some birthdate",
    cellphone: 42,
    city: "some city",
    document_id: 42,
    email: "some email",
    gender: "some gender",
    lastname: "some lastname",
    name: "some name",
    phone: 42
  }
  @update_attrs %{
    address: "some updated address",
    birthdate: "some updated birthdate",
    cellphone: 43,
    city: "some updated city",
    document_id: 43,
    email: "some updated email",
    gender: "some updated gender",
    lastname: "some updated lastname",
    name: "some updated name",
    phone: 43
  }
  @invalid_attrs %{address: nil, birthdate: nil, cellphone: nil, city: nil, document_id: nil, email: nil, gender: nil, lastname: nil, name: nil, phone: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all owners", %{conn: conn} do
      conn = get(conn, ~p"/api/owners")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create owner" do
    test "renders owner when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/owners", owner: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/owners/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some address",
               "birthdate" => "some birthdate",
               "cellphone" => 42,
               "city" => "some city",
               "document_id" => 42,
               "email" => "some email",
               "gender" => "some gender",
               "lastname" => "some lastname",
               "name" => "some name",
               "phone" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/owners", owner: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update owner" do
    setup [:create_owner]

    test "renders owner when data is valid", %{conn: conn, owner: %Owner{id: id} = owner} do
      conn = put(conn, ~p"/api/owners/#{owner}", owner: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/owners/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "birthdate" => "some updated birthdate",
               "cellphone" => 43,
               "city" => "some updated city",
               "document_id" => 43,
               "email" => "some updated email",
               "gender" => "some updated gender",
               "lastname" => "some updated lastname",
               "name" => "some updated name",
               "phone" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, owner: owner} do
      conn = put(conn, ~p"/api/owners/#{owner}", owner: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete owner" do
    setup [:create_owner]

    test "deletes chosen owner", %{conn: conn, owner: owner} do
      conn = delete(conn, ~p"/api/owners/#{owner}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/owners/#{owner}")
      end
    end
  end

  defp create_owner(_) do
    owner = owner_fixture()
    %{owner: owner}
  end
end
