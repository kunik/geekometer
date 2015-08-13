module ApplicationHelper
    def markdown(text)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
        return markdown.render(text).html_safe
      end

    def syntax_highlighter(html)
      doc = Nokogiri::HTML(html)
      doc.search("//pre[@lang]").each do |pre|
        pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
      doc.to_s
  end
end
