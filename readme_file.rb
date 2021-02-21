# frozen_string_literal: true

require './feed'

class ReadmeFile
  def update_readme!
    new_readme = template.gsub(/\{posts\}/, posts)
    override_readme(new_readme)
  end

  private

  def override_readme(content)
    File.write('README.md', content)
  end

  def posts
    feed.entries.map { |entry| post_template(entry) }.join("\n  ")
  end

  def post_template(post_entry)
    published = post_entry.published.strftime('%b %d, %Y')
    "<p>&nbsp; - #{published} - <a href=\"#{post_entry.url}\">#{post_entry.title}</a></p>"
  end

  def template
    File.open('README.template').read
  end

  def feed
    Feed.new
  end
end
