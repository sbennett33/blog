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
      render(conn, "show.html", post: post)
    end
  end
end
