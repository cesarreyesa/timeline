defmodule Timeline.NoteControllerTest do
  use Timeline.ConnCase

  alias Timeline.Note
  @valid_params note: %{date: %{day: 17, month: 4, year: 2010}, note: "some content"}
  @invalid_params note: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /notes", %{conn: conn} do
    conn = get conn, note_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing notes"
  end

  test "GET /notes/new", %{conn: conn} do
    conn = get conn, note_path(conn, :new)
    assert html_response(conn, 200) =~ "New note"
  end

  test "POST /notes with valid data", %{conn: conn} do
    conn = post conn, note_path(conn, :create), @valid_params
    assert redirected_to(conn) == note_path(conn, :index)
  end

  test "POST /notes with invalid data", %{conn: conn} do
    conn = post conn, note_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New note"
  end

  test "GET /notes/:id", %{conn: conn} do
    note = Repo.insert %Note{}
    conn = get conn, note_path(conn, :show, note)
    assert html_response(conn, 200) =~ "Show note"
  end

  test "GET /notes/:id/edit", %{conn: conn} do
    note = Repo.insert %Note{}
    conn = get conn, note_path(conn, :edit, note)
    assert html_response(conn, 200) =~ "Edit note"
  end

  test "PUT /notes/:id with valid data", %{conn: conn} do
    note = Repo.insert %Note{}
    conn = put conn, note_path(conn, :update, note), @valid_params
    assert redirected_to(conn) == note_path(conn, :index)
  end

  test "PUT /notes/:id with invalid data", %{conn: conn} do
    note = Repo.insert %Note{}
    conn = put conn, note_path(conn, :update, note), @invalid_params
    assert html_response(conn, 200) =~ "Edit note"
  end

  test "DELETE /notes/:id", %{conn: conn} do
    note = Repo.insert %Note{}
    conn = delete conn, note_path(conn, :delete, note)
    assert redirected_to(conn) == note_path(conn, :index)
    refute Repo.get(Note, note.id)
  end
end
