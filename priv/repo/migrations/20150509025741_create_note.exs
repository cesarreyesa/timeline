defmodule Timeline.Repo.Migrations.CreateNote do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :note, :string
      add :date, :date

      timestamps
    end
  end
end
