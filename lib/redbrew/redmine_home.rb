#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class RedmineHome
    def initialize(redmine_home_path = ".")
      @redmine_home_path = redmine_home_path
    end

    def valid?
      File.exist?(@redmine_home_path + '/lib/redmine/version.rb')
    end

    def version
      # TODO
    end
  end
end
