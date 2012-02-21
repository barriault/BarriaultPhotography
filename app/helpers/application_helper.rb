module ApplicationHelper
  def markdown(text)
    rnder = HtmlWithPrettyPrint.new(:hard_wrap => true)
    mkdwn = Redcarpet::Markdown.new(rnder, :no_intra_emphasis => true, :fenced_code_blocks => true, :space_after_headers => true)
    mkdwn.render(text).html_safe
  end
end

