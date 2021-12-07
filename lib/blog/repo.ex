defmodule Blog.Repo do
  use GenServer

  alias Blog.Crawler

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def get_by_slug(slug) do
    GenServer.call(__MODULE__, {:get_by_slug, slug})
  end

  def list() do
    GenServer.call(__MODULE__, :list)
  end

  def init(opts) do
    posts_path = Keyword.get(opts, :path)

    state = %{
      path: posts_path,
      posts: []
    }

    {:ok, state, {:continue, :compile_posts}}
  end

  def handle_continue(:compile_posts, %{path: path}) do
    posts = Crawler.crawl(path)

    state = %{
      path: path,
      posts: posts
    }

    {:noreply, state}
  end

  def handle_call({:get_by_slug, slug}, _, %{posts: posts} = state) do
    response =
      case Enum.find(posts, fn post -> post.slug == slug end) do
        nil -> {:error, :not_found}
        post -> {:ok, post}
      end

    {:reply, response, state}
  end

  def handle_call(:list, _, %{posts: posts} = state) do
    {:reply, {:ok, posts}, state}
  end
end
