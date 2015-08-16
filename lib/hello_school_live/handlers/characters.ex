defmodule HelloSchoolLive.Handlers.Characters do
  import Ecto.Query

  def init(req, opts) do
    query = from c in HelloSchoolLive.Models.Character, select: c
    characters = HelloSchoolLive.Repo.all(query) |> Enum.map(&(&1.name))
    req2 = :cowboy_req.reply 200, [{"content-type", "application/json"}],
      Poison.Encoder.encode(characters, []), req
    {:ok, req2, opts}
  end
end
