#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class Installer
    def initialize(plugin, redmine_home)
      @plugin = plugin
      @redmine_home = redmine_home
    end

    def install
      type = 'git'
      uri = @plugin['url']
      dest_path = @redmine_home.vendor_plugins
      fetcher = Fetcher.create(type, dest_path, uri)
      fetcher.fetch
      # TODO eval formula
    end
  end
end
