#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class Core
    def initialize(redmine_home = nil)
      @redmine_home = redmine_home
    end

    def search(keyword)
      Redbrew::RedbrewWeb.search(keyword)
    end

    def install(plugin_id)
      # TODO
    end
  end
end
