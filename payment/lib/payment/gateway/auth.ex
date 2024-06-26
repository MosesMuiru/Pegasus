defmodule Payment.Gateway.Auth do
  use Tesla

  plug Tesla.Middleware.BaseUrl,
       "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"

  plug Tesla.Middleware.Headers, [{"authorization", "Basic #{System.get_env("AUTH_KEY")}"}]
  plug Tesla.Middleware.JSON

  @spec get_auth_key :: String.t()
  def get_auth_key do
    {:ok, body} = get("")
    %{"access_token" => token} = body.body
    token
  end
end
