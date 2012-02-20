module ApplicationHelper
  def markdown(text)
    rnder = HTMLwithPrettyPrint.new(:hard_wrap => true)
    mkdwn = Redcarpet::Markdown.new(rnder, :no_intra_emphasis => true, :fenced_code_blocks => true, :space_after_headers => true)
    mkdwn.render(text).html_safe
  end
end

class HTMLwithPrettyPrint < Redcarpet::Render::HTML
  def postprocess(full_document)
    full_document.gsub("<pre>", "<pre class=\"prettyprint linenums\">")
  end
end

