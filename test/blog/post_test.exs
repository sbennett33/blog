defmodule Blog.PostTest do
  use ExUnit.Case

  alias Blog.Post

  describe "compile/1" do
    test "creates a post struct from a file" do
      assert %Post{} = post = Post.compile("first-post.md", "test/posts")

      assert post.slug == "first-post"
      assert post.title == "First Post"
      assert post.intro == "The first post is about one topic."

      content =
        post.content
        |> Phoenix.HTML.raw()
        |> Phoenix.HTML.safe_to_string()

      assert content =~ "<strong>Markdown</strong>"
      assert content =~ "Lists are nice, too:"
    end
  end
end
