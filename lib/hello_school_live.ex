defmodule HelloSchoolLive do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    dispatch = :cowboy_router.compile routes
    {:ok, _} = :cowboy.start_http :http, 100, [{:port, 3000}], [{:env, [{:dispatch, dispatch}]}]

    children = [
      worker(HelloSchoolLive.Repo, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloSchoolLive.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp routes do
    [
      {:_, [
            {"/hello-school-live", HelloSchoolLive.Handlers.HelloSchoolLive, []},
            {"/hello-school-live/characters", HelloSchoolLive.Handlers.Characters, []}
          ]
      }
    ]
  end
end
