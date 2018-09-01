module BlogsHelper
  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language || :text).div
    end
  end

  def markdown(text)
    language ||= :ruby
    coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
    options = {
      :fenced_code_blocks => true, #ここのoptionは任意で好きなようにカスタマイズしてok
      :no_intra_emphasis  => true,
      :autolink           => true,
      :strikethrough      => true,
      :lax_html_blocks    => true,
      :superscript        => true
     }
     markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
     markdown_to_html.render(text).html_safe
  end

  def blog_status_color blog
    'color: red;' if blog.draft?
  end
end