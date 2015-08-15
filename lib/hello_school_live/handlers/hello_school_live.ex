defmodule HelloSchoolLive.Handlers.HelloSchoolLive do
  def init(_type, req, []) do
    {:ok, req, :no_state}
  end

  def handle(req, state) do
    {:ok, reply} = :cowboy_req.reply 200, [{"content-type", "text/plain"}], "Hello, School Live!", req
    {:ok, reply, state}
  end

  def terminate(_, _, _), do: :ok
end
