defmodule EzSlotsWeb.WheelController do
  use EzSlotsWeb, :controller

  @paytable %{
    1 => %{
      1 => 1.5,
      2 => 2,
      3 => 0,
      4 => 1.5,
      5 => 0,
      6 => 1,
      7 => 0,
      8 => 2.5,
      9 => 0,
      10 => 1,
      11 => 0,
      12 => 2.5,
      13 => 0,
      14 => 1.5,
      15 => 0,
      16 => 3,
      17 => 0,
    },
    2 => %{
      1 => 0,
      2 => 1,
      3 => 0.5,
      4 => 0,
      5 => 0.2,
      6 => 3,
      7 => 0,
      8 => 1.4,
      9 => 0.5,
      10 => 0,
      11 => 1,
      12 => 3,
      13 => 1.4,
      14 => 0,
      15 => 0.2,
      16 => 1,
      17 => 3,
    },
    3 => %{
      1 => 0,
      2 => 2,
      3 => 0,
      4 => 2,
      5 => 0,
      6 => 2,
      7 => 0,
      8 => 2,
      9 => 0,
      10 => 2,
      11 => 0,
      12 => 2,
      13 => 0,
      14 => 2,
      15 => 0,
      16 => 2,
      17 => 0.7,
    }
  }

  def spin(conn, %{"amount" => bet_amount, "theme" => theme}) do
    sector = Erlng.uniform(17)
    win_amount = get_in(@paytable, [theme, sector]) * Maybe.to_number(bet_amount)
    result = %{
      bet_amount: bet_amount,
      current_volume: nil,
      new_balance: "100500",
      outcome: (win_amount != 0),
      release_volume: nil,
      result: sector,
      symbol: "FUN",
      url: "https://cryptogames.io/bet/w4LmVKWw",
      win_amount: win_amount |> Maybe.to_integer |> Maybe.maybe_to_string
    }
    json(conn, result)
  end

end
