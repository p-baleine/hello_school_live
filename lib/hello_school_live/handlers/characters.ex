defmodule HelloSchoolLive.Handlers.Characters do
  import Ecto.Query

  def init(_type, req, []) do
    {:ok, req, :no_state}
  end

  def handle(req, state) do
    query = from c in HelloSchoolLive.Models.Character, select: c
    characters = HelloSchoolLive.Repo.all(query) |> Enum.map(&(&1.name))
    {:ok, reply} = :cowboy_req.reply 200, [{"content-type", "application/json"}],
      Poison.Encoder.encode(characters, []), req
    {:ok, reply, state}
  end

  def terminate(_, _, _), do: :ok
end
