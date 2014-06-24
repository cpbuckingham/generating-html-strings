class HTMLGenerator
  def initialize(layout = nil)
    @layout = layout || "CONTENT"
  end

  def section(text)
    layout("<section>#{text}</section>")
  end

  def unordered_list(items)
    layout("<ul>" + items.map { |i| "<li>#{i}</li>" }.join + "</ul>")
  end

  def button(text, options = {})
    opening_tag = if options[:class]
                    "<button class='#{options[:class]}'>"
                  else
                    "<button>"
                  end
    layout("#{opening_tag}#{text}</button>")
  end

  def layout(inner_html)
    @layout.gsub("CONTENT", inner_html)
  end
end

