module ApplicationHelper

  SITE_NAME = 'CrowdFunder'

  def site_name
    return SITE_NAME
  end

  def titler(page_title)
    page_title.empty? ? site_name : "#{site_name} | #{page_title}"
  end

  def capitalize_word(str)
    str.split(' ').map(&:capitalize).join(' ')
  end

  def markdown(text)
    options = {
      autolink: true, filter_html: true, hard_wrap: true, highlight: true,
      no_intra_emphasis: true, no_styles: true, prettify: true, quote: true
    }
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::SmartyHTML, options)
    @markdown.render(text).html_safe
  end

end
