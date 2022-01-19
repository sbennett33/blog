defmodule PatternMatchingWeb.Blog.PageController do
  use PatternMatchingWeb, :controller

  alias PatternMatching.Repo

  action_fallback PatternMatchingWeb.FallbackController

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
