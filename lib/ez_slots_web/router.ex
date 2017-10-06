defmodule EzSlotsWeb.Router do
  use EzSlotsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EzSlotsWeb do
    pipe_through :api
    scope "/" do
      pipe_through :browser # Use the default browser stack
      get "/", PageController, :index
    end

    get "/init", PageController, :init
    get "/chat/load/:lang", PageController, :chat
  end

  # Other scopes may use custom stacks.
  # scope "/api", EzSlotsWeb do
  #   pipe_through :api
  # end
end
