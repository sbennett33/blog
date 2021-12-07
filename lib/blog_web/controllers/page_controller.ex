defmodule BlogWeb.PageController do
  use BlogWeb, :controller

  alias Blog.Repo

  action_fallback BlogWeb.FallbackController

  def index(conn, _params) do
    {:ok, posts} = Blog.Repo.list()
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"slug" => slug}) do
    with {:ok, post} <- Repo.get_by_slug(slug) do
      render(conn, "show.html", post: post)
    end
  end
end
