defmodule Veterinary.OwnersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Veterinary.Owners` context.
  """

  @doc """
  Generate a owner.
  """
  def owner_fixture(attrs \\ %{}) do
    {:ok, owner} =
      attrs
      |> Enum.into(%{
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
      })
      |> Veterinary.Owners.create_owner()

    owner
  end
end
