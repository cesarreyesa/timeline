defmodule Timeline.Note do
  use Timeline.Web, :model

  schema "notes" do
    field :note, :string
    field :date, Ecto.Date

    timestamps
  end

  @required_fields ~w(note date)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
