defmodule VeterinaryWeb.Router do
  use VeterinaryWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", VeterinaryWeb do
    pipe_through :api

    resources "/owners", OwnerController, except: [:new, :edit]
    resources "/pets", PetController, except: [:new, :edit]
  end
end
