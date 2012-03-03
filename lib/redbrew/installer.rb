#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class Installer
    def initialize(plugin, redmine_home)
      @plugin = plugin
      @redmine_home = redmine_home
    end

    def install
      dsl = @plugin['formula']
      formula = Redbrew::Formula.new(@redmine_home)
      formula.instance_eval { eval dsl }
      formula.run
    end
  end
end
