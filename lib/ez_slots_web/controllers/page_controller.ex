defmodule EzSlotsWeb.PageController do
  use EzSlotsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
