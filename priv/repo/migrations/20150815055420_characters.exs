defmodule HelloSchoolLive.Repo.Migrations.Characters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
    end
  end
end
