defmodule LpWeb.TableController do
    use LpWeb, :controller
  
    def index(conn, _params) do
      render(conn, "table.html")

    end
    def sample(conn, _params) do
      render(conn, "table_sample.html")
    end
  end