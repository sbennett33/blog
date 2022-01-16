defmodule BlogWeb.PageController do
  use BlogWeb, :controller

  alias Blog.Repo

  action_fallback BlogWeb.FallbackController

  def index(conn, _params) do
    posts = Repo.all_posts()
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, post} <- Repo.get_post(id) do
      meta_attrs = [
        %{name: "keywords", content: Enum.join(post.tags, ", ")}
      ]

      render(conn, "show.html", post: post, page_title: post.title, meta_attrs: meta_attrs)
    end
  end
end
