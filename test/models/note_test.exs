defmodule Timeline.NoteTest do
  use Timeline.ModelCase

  alias Timeline.Note

  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, note: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Note.changeset(%Note{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Note.changeset(%Note{}, @invalid_attrs)
    refute changeset.valid?
  end
end
