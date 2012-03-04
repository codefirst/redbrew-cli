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
      plugin = Redbrew::RedbrewWeb.plugin(plugin_id)
      Installer.new(plugin, @redmine_home).install
    end

    def reboot(type)
      Redbrew::Rebooter::Rebooter.create(type, @redmine_home).reboot
    end
  end
end
