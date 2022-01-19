defmodule PatternMatching.CrawlerTest do
  use ExUnit.Case

  alias PatternMatching.Crawler
  alias PatternMatching.Post

  describe "crawl/1" do
    test "compiles list of posts" do
      posts = Crawler.crawl("test/posts")

      assert length(posts) == 2

      Enum.each(posts, fn post ->
        assert %Post{} = post
      end)
    end
  end
end
