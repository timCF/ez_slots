defmodule EzSlotsWeb.PageController do
  use EzSlotsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  @fun_currency %{
    hasDeposit: false,
    hasFaucet: false,
    hasFree: true,
    hasWithdraw: false,
    isVirtual: true,
    minBet: "1",
    name: "Fun Money",
    symbol: "FUN"
  }

  def init(conn, _) do
    response = %{
      bonus: %{
        currentVolume: nil,
        releaseVolume: nil,
      },
      currencies: [@fun_currency],
      currency: @fun_currency,
      user: %{
        balance: "100500",
        socketSessionId: "foo",
        username: "bar",
      }
    }
    json(conn, response)
  end

  def chat(conn, _) do
    json(conn, %{messages: [], online: []})
  end

end
