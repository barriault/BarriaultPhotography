class HtmlWithPrettyPrint < Redcarpet::Render::HTML
  def postprocess(full_document)
    full_document.gsub("<pre>", "<pre class=\"prettyprint linenums\">")
  end
end
