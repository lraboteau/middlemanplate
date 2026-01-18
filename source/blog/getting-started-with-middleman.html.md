---
title: Getting Started with Middleman
date: 2024-01-15
author: John Doe
tags:
  - Middleman
  - Ruby
  - Tutorial
description: Learn how to get started with Middleman, a powerful static site generator built with Ruby.
image: /images/banner.png
---

Middleman is a fantastic static site generator that makes building websites a breeze. In this guide, we'll walk you through the basics of getting started with Middleman.

## What is Middleman?

Middleman is a static site generator built with Ruby. It's perfect for building blogs, portfolios, marketing sites, and more. With Middleman, you write your content in Markdown, and it generates beautiful HTML pages.

READMORE

## Installation

First, make sure you have Ruby installed on your system. Then, install Middleman:

```bash
gem install middleman
```

## Creating a New Project

Create a new Middleman project with:

```bash
middleman init my-project
cd my-project
```

## Development Server

Start the development server:

```bash
bundle exec middleman server
```

Your site will be available at `http://localhost:4567`.

## Building for Production

When you're ready to deploy, build your site:

```bash
bundle exec middleman build
```

This creates a `build` folder with your static files ready for deployment.

## Conclusion

Middleman is a powerful and flexible static site generator. With its Ruby-based architecture and extensive plugin ecosystem, you can build anything from simple blogs to complex marketing sites.

Happy coding! 🚀
