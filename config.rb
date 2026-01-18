# frozen_string_literal: true

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  # Format date helper
  def format_date(date, format = '%B %d, %Y')
    date.strftime(format)
  end

  # Reading time calculator
  def reading_time(content)
    words_per_minute = 200
    words = content.split.size
    minutes = (words / words_per_minute).ceil
    minutes < 1 ? '1 min read' : "#{minutes} min read"
  end

  # Truncate text helper
  def truncate_words(text, length = 30, omission = '...')
    words = text.split
    if words.size > length
      words[0...length].join(' ') + omission
    else
      text
    end
  end

  # Active link helper
  def nav_link(text, url, options = {})
    options[:class] ||= ''
    options[:class] += ' active' if current_page.url == url
    link_to text, url, options
  end

  # Get site config
  def site_config
    data.config
  end

  # Get menu items
  def menu_items
    data.menu.main
  end

  # Get social links
  def social_links
    data.social
  end

  # Image with lazy loading
  def lazy_image(src, alt = '', options = {})
    options[:loading] = 'lazy'
    options[:alt] = alt
    image_tag(src, options)
  end

  # Generate excerpt from content
  def excerpt(article, length = 150)
    text = strip_tags(article.body)
    truncate_words(text, length)
  end

  # Get related articles
  def related_articles(current_article, limit = 3)
    current_tags = current_article.tags || []
    blog.articles.reject { |a| a == current_article }
                 .select { |a| (a.tags || []) & current_tags != [] }
                 .first(limit)
  end

  # Pagination helper
  def pagination_links(articles, page_number, per_page)
    total_pages = (articles.size.to_f / per_page).ceil
    {
      current: page_number,
      total: total_pages,
      has_prev: page_number > 1,
      has_next: page_number < total_pages,
      prev_page: page_number - 1,
      next_page: page_number + 1
    }
  end
end

# Blog configuration
activate :blog do |blog|
  blog.name = 'blog'
  blog.prefix = 'blog'
  blog.permalink = '{title}.html'
  blog.sources = '{title}.html'
  blog.taglink = 'tags/{tag}.html'
  blog.layout = 'article'
  blog.summary_separator = /READMORE/
  blog.summary_length = 250
  blog.year_link = '{year}.html'
  blog.month_link = '{year}/{month}.html'
  blog.day_link = '{year}/{month}/{day}.html'
  blog.default_extension = '.md'
  blog.tag_template = 'tag.html'
  blog.calendar_template = 'calendar.html'
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = 'page/{num}'
end

# Live reload during development
configure :development do
  activate :livereload
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Minify HTML on build
  activate :minify_html

  # Enable asset hash for cache busting
  activate :asset_hash

  # Enable gzip compression
  activate :gzip

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true
end

# Directory indexes (pretty URLs)
activate :directory_indexes

# Syntax highlighting
activate :syntax, line_numbers: true

# External pipeline for Tailwind CSS via esbuild
activate :external_pipeline,
         name: :tailwind,
         command: build? ? 'npm run build:css' : 'npm run watch:css',
         source: '.tmp/dist',
         latency: 1

# Set directories
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Set layouts directory
set :layouts_dir, 'layouts'

# Set partials directory
set :partials_dir, 'partials'

# Set data directory
set :data_dir, 'data'

# Set build directory
set :build_dir, 'build'

# Markdown configuration
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true,
               smartypants: true,
               tables: true,
               autolink: true,
               with_toc_data: true,
               no_intra_emphasis: true
