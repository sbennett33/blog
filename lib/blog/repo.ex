defmodule Blog.Repo do
  alias Blog.Post

  use NimblePublisher,
    build: Post,
    from: Application.app_dir(:blog, "priv/posts/**/*.md"),
    as: :posts,
    highlighters: [:makeup_elixir],
    earmark_options: [footnotes: true]

  # The @posts variable is first defined by NimblePublisher.
  # Let's further modify it by sorting all posts by descending date.
  @posts Enum.sort_by(@posts, & &1.date, {:desc, Date})

  # Let's also get all tags
  @tags @posts |> Enum.flat_map(& &1.tags) |> Enum.uniq() |> Enum.sort()

  # And finally export them
  def all_posts, do: @posts
  def all_tags, do: @tags

  def get_post(id) do
    case Enum.find(all_posts(), &(&1.id == id)) do
      nil -> {:error, :not_found}
      post -> {:ok, post}
    end
  end
end
