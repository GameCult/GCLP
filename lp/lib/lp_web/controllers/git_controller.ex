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
    def oauth(conn, %{"code" => code}) do
      #some persistance side effect
      # persist(code)        access_token = Github.Oauth2.Client.access_token!(
          config: [client_id: @client_id, client_secret: @client_secret],
          params: [code: code]
        )

        github_client = %Github.Client{access_token: access_token}

        %{"login" => login} = github_client |> Github.Users.find!() |> Map.fetch!(:body)
        [%{"email" => email} | _] = github_client |> Github.Users.Emails.list!() |> Map.fetch!(:body)
      render(conn, "oauth2.html", [login: login, email: email])
      # redirect(conn, "git.html")
      # html(conn,"")

    end

    # ___ example from github
    # def github_callback(conn, %{"code" => code}) do
    #   access_token = Github.Oauth2.Client.access_token!(
    #     config: [client_id: @client_id, client_secret: @client_secret],
    #     params: [code: code]
    #   )

    #   github_client = %Github.Client{access_token: access_token}

    #   %{"login" => login} = github_client |> Github.Users.find!() |> Map.fetch!(:body)
    #   [%{"email" => email} | _] = github_client |> Github.Users.Emails.list!() |> Map.fetch!(:body)
    #   ...
    # end

    # ___

    def github(conn, _params) do
      authorize_url = Github.Oauth2.Client.authorize_url!(
        # config: [client_id: Application.fetch_env!(:lp, :client_id), client_secret: Application.fetch_env!(:lp, :client_secret)],
        config: [client_id: @client_id, client_secret: @client_secret],
        scope: "user:email"
      )
      conn |> redirect(external: authorize_url)
    end
  end
