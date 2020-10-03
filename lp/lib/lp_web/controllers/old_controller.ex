defmodule LpWeb.OldController do
    use LpWeb, :controller
  
    def index(conn, _params) do
      # conn
      # |> render("old.html")
      render(conn, "old.html")

      # html(conn, """
      # <h1>YetAnotherOldMockup</h1>
      # """
      # )
    end
  end