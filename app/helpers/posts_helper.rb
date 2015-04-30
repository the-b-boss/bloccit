module PostsHelper
  def markdown_title(markdown)
    render_as_markdown(@post.title)
  end

  def markdown_body(markdown)
    render_as_markdown(@post.body)
  end

  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end
end
