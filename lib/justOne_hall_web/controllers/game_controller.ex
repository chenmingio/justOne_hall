defmodule JustOneHallWeb.GameController do
  use JustOneHallWeb, :controller

  plug :require_player

  alias JustOne.{GameServer, GameSupervisor}

  def new(conn, _) do
    render(conn, "new.html")
  end

  defp require_player(conn, _opts) do
    if get_session(conn, :current_player) do
      conn
    else
      conn
      |> put_session(:return_to, conn.request_path)
      |> redirect(to: session_path(conn, :new))
      |> halt()
    end
  end

end
