defmodule HelloSchoolLive.Models.Character do
  use Ecto.Model
  schema "characters" do
    field :name, :string
  end
end
