defmodule BlogWeb.RssController do
  use BlogWeb, :controller

  alias Blog.{Repo, Post}
  alias Atomex.{Feed, Entry}

  @author "Scott Bennett"

  def index(conn, _params) do
    posts = Repo.all_posts()
    feed = build_feed(posts, conn)

    conn
    |> put_resp_content_type("text/xml")
    |> send_resp(200, feed)
  end

  def build_feed(posts, conn) do
    Feed.new(Routes.page_url(conn, :index), DateTime.utc_now(), "PatternMatching.io")
    |> Feed.author(@author)
    |> Feed.link(Routes.rss_url(conn, :index), rel: "self")
    |> Feed.entries(Enum.map(posts, &get_entry(conn, &1)))
    |> Feed.build()
    |> Atomex.generate_document()
  end

  defp get_entry(conn, %Post{
         id: id,
         title: title,
         date: date,
         body: body
       }) do
    Entry.new(
      Routes.page_url(conn, :show, id),
      DateTime.new!(date, Time.new!(0, 0, 0, 0), "Etc/UTC"),
      title
    )
    |> Entry.link(Routes.page_url(conn, :show, id))
    |> Entry.author(@author)
    |> Entry.content(body, type: "html")
    |> Entry.build()
  end
end
