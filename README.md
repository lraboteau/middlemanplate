<h1 align=center>Ruby Middleman + Tailwind CSS Starter and Boilerplate</h1>

<p align=center>Middlemanplate is a free starter template built with Ruby Middleman and TailwindCSS, providing everything you need to jumpstart your Middleman project and save valuable time.</p>

<p align=center>Made with ♥ by <a href="https://zeon.studio/">Zeon Studio</a> and converted to Ruby Middleman by <a href="https://gitlab.com/lraboteau">lraboteau</a>.</p>

<p align=center> If you find this project useful, please give it a ⭐ to show your support. </p>

<h2 align="center"> <a target="_blank" href="https://middlemanplate.netlify.app/" rel="nofollow">👀 Demo</a> | <a target="_blank" href="https://middlemanapp.com/basics/install/" rel="nofollow">📚 Middleman Docs</a>
</h2>

<p align=center>
  <a href="https://github.com/middleman/middleman/releases">
    <img src="https://img.shields.io/static/v1?label=MIDDLEMAN&message=5.x&color=cc0000&logo=ruby"  alt="Middleman Version 5.x"/>
  </a>

  <a href="https://github.com/zeon-studio/middlemanplate/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/zeon-studio/middlemanplate" alt="license"></a>

  <img src="https://img.shields.io/github/languages/code-size/zeon-studio/middlemanplate" alt="code size">

  <a href="https://github.com/zeon-studio/middlemanplate/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/zeon-studio/middlemanplate" alt="contributors"></a>
</p>

## 📌 Key Features

- 👥 Multi-Authors
- 🎯 Similar Posts Suggestion
- 🔍 Search Functionality
- 🌑 Dark Mode
- 🏷️ Tags & Categories
- 🔗 Netlify setting pre-configured
- 📞 Support contact form
- 📱 Fully responsive
- 📝 Write and update content in Markdown / ERB
- 📎 Google Tag Manager Ready
- 💬 Disqus Comment Ready
- 🔳 Syntax Highlighting
- ⚡ Fast builds with esbuild

### 📄 15+ Pre-designed Pages

- 🏠 Homepage
- 👤 About
- 📞 Contact
- 📝 Blog
- 📝 Blog Single
- 🚫 Custom 404
- 📄 Privacy Policy
- 🏷️ Tags
- 🏷️ Tag Single
- 🗓️ Archive by Date
- 🔍 Search

## 🔗 Tech Stack

- **Ruby Middleman 5.x** (from GitHub main branch) - Static site generator
- **Tailwind CSS 3.4+** - Utility-first CSS framework
- **esbuild** - Fast JavaScript bundler
- **ERB Templates** - Ruby templating
- **Markdown** - Content authoring
- **middleman-syntax** - Code syntax highlighting with Rouge

## 📁 Project Structure

```
middlemanplate/
├── config.rb              # Middleman configuration
├── Gemfile                # Ruby dependencies
├── package.json           # Node.js dependencies (Tailwind)
├── tailwind.config.js     # Tailwind configuration
├── Dockerfile             # Docker configuration
├── netlify.toml           # Netlify deployment config
├── data/                  # YAML data files
│   ├── config.yml         # Site configuration
│   ├── menu.yml           # Navigation menus
│   └── social.yml         # Social media links
└── source/                # Source files
    ├── layouts/           # ERB layouts
    │   ├── layout.erb     # Main layout
    │   └── article.erb    # Blog article layout
    ├── partials/          # Reusable components
    │   ├── _header.erb
    │   ├── _footer.erb
    │   ├── _hero.erb
    │   ├── _blog_card.erb
    │   └── _call_to_action.erb
    ├── stylesheets/       # CSS files
    │   └── main.css       # Tailwind entry point
    ├── javascripts/       # JavaScript files
    │   └── site.js        # Main JavaScript
    ├── images/            # Static images
    ├── blog/              # Blog posts (Markdown)
    ├── index.html.erb     # Homepage
    ├── about.html.erb     # About page
    ├── contact.html.erb   # Contact page
    └── ...                # Other pages
```

## 🚀 Getting Started

### 📦 Prerequisites

- Ruby 3.2+ (tested with 4.0.0)
- Bundler 2.4+
- Node.js 20+
- npm or yarn

### 👉 Install Dependencies

```bash
# Install Ruby gems
bundle install

# Install Node packages
npm install
```

### 👉 Development

Start the development server with live reload:

```bash
# Option 1: Run separately
npm run watch:css &
bundle exec middleman server

# Option 2: Use Foreman (if installed)
foreman start -f Procfile.dev
```

Your site will be available at `http://localhost:4567`

### 👉 Build for Production

```bash
# Build CSS
npm run build:css

# Build static site
bundle exec middleman build
```

The built files will be in the `build/` directory.

### 👉 Build and Run With Docker

```bash
# Build the image
docker build -t middlemanplate .

# Run the container
docker run -p 8080:80 middlemanplate
```

Access at `http://localhost:8080`

## 📝 Adding Content

### Blog Posts

Create new blog posts in `source/blog/`:

```markdown
---
title: My New Post
date: 2024-01-15
author: Your Name
tags:
  - Tutorial
  - Ruby
description: A short description of the post
image: /images/post-image.png
---

Your content here...

READMORE

More content after the fold...
```

### Pages

Create new pages in `source/`:

```erb
---
title: Page Title
description: Page description
---

<section class="section">
  <div class="container mx-auto px-4">
    <h1>Your content</h1>
  </div>
</section>
```

## ⚙️ Configuration

### Site Configuration

Edit `data/config.yml`:

```yaml
title: "Your Site Title"
description: "Your site description"
author: "Your Name"
base_url: "https://yoursite.com"
email: "hello@yoursite.com"
```

### Navigation

Edit `data/menu.yml`:

```yaml
main:
  - name: "Home"
    url: "/"
  - name: "Blog"
    url: "/blog/"
```

### Social Links

Edit `data/social.yml`:

```yaml
- name: "Twitter"
  url: "https://twitter.com/yourhandle"
- name: "GitHub"
  url: "https://github.com/yourusername"
```

## 🎨 Customization

### Colors

Edit `tailwind.config.js` to customize the color palette:

```javascript
theme: {
  extend: {
    colors: {
      primary: {
        500: '#your-color',
        600: '#your-color',
        // ...
      }
    }
  }
}
```

### Fonts

Update the Google Fonts link in `source/layouts/layout.erb` and the font family in `tailwind.config.js`.

## 🚢 Deployment

### Netlify

1. Connect your repository to Netlify
2. Build command: `npm install && npm run build:css && bundle install && bundle exec middleman build`
3. Publish directory: `build`

### Docker

Use the included `Dockerfile` for containerized deployment.

### GitHub Pages

```bash
bundle exec middleman build
# Deploy the `build/` directory to gh-pages branch
```

## 🐞 Reporting Issues

We use GitHub Issues as the official bug tracker. Please search [existing issues](https://github.com/zeon-studio/middlemanplate/issues) before opening a new one.

## 📝 License

Copyright (c) 2023 - Present, Designed & Developed by [Zeon Studio](https://zeon.studio/)

**Code License:** Released under the [MIT](https://github.com/zeon-studio/middlemanplate/blob/main/LICENSE) license.

**Image license:** The images are only for demonstration purposes. They have their license, we don't have permission to share those images.

## 💻 Need Custom Development Services?

If you need a custom theme, theme customization, or complete website development services from scratch you can [Hire Us](https://zeon.studio/).
