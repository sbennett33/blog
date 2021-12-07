defmodule Blog.Crawler do
  alias Blog.Post

  def crawl(path \\ "priv/posts")
  def crawl(nil), do: crawl()

  def crawl(path) do
    Path.wildcard("#{path}/*.md")
    |> Enum.map(&Path.basename/1)
    |> Enum.map(fn file ->
      Post.compile(file, path)
    end)
    |> sort()
  end

  defp sort(posts) do
    Enum.sort(posts, &(&1.date >= &2.date))
  end
end
