defmodule LpWeb.GitController do
  @client_id Application.fetch_env!(:lp, :client_id)
  @client_secret Application.fetch_env!(:lp, :client_secret)
    use LpWeb, :controller
    # @data "/priv/secret/github_credentials" |> File.stream! |> Enum.to_list

    def index(conn, _params) do
      render(conn, "git.html")
    end
    def show(conn, _params) do
      html(conn,"")
    end
    def oauth(conn, _params) do
      # render(conn, "oauth2.html")
      redirect(conn, "git.html")
    end
    def github(conn, _params) do
      authorize_url = Github.Oauth2.Client.authorize_url!(
        # config: [client_id: Application.fetch_env!(:lp, :client_id), client_secret: Application.fetch_env!(:lp, :client_secret)],
        config: [client_id: @client_id, client_secret: @client_secret],
        scope: "user:email"
      )
      conn |> redirect(external: authorize_url)
    end
  end