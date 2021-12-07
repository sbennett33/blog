defmodule Blog.Post do
  defstruct slug: "", title: "", date: "", intro: "", content: ""

  def compile(file, path \\ "priv/posts") do
    %__MODULE__{
      slug: file_to_slug(file)
    }
    |> do_compile(file, path)
  end

  defp do_compile(post, file, path) do
    Path.join([path, file])
    |> File.read!()
    |> split()
    |> extract(post)
  end

  defp file_to_slug(file) do
    String.replace(file, ~r/\.md$/, "")
  end

  defp split(data) do
    [frontmatter, markdown] = String.split(data, ~r/\n-{3,}\n/, parts: 2)
    {parse_yaml(frontmatter), Earmark.as_html!(markdown)}
  end

  defp extract({props, content}, post) do
    {:ok, date} =
      props
      |> get_prop("date")
      |> Date.from_iso8601()

    %{
      post
      | title: get_prop(props, "title"),
        date: date,
        intro: get_prop(props, "intro"),
        content: content
    }
  end

  defp parse_yaml(yaml) do
    [parsed] = :yamerl_constr.string(yaml)
    parsed
  end

  defp get_prop(props, key) do
    case :proplists.get_value(String.to_charlist(key), props) do
      :undefined -> nil
      x -> to_string(x)
    end
  end
end
