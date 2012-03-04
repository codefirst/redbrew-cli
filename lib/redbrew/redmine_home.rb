#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class RedmineHome
    def initialize(redmine_home_path = ".")
      @redmine_home_path = redmine_home_path
    end

    def valid?
      File.exist? version_file
    end

    def version
      major = '0'
      minor = '0'
      tiny = '0'
      content = open(version_file).read
      if content =~ (/.+MAJOR\s+=\s+(\d+)/m)
        major = $1
      end
      if content =~ (/.+MINOR\s+=\s+(\d+)/m)
        minor = $1
      end
      if content =~ (/.+TINY\s+=\s+(\d+)/m)
        tiny = $1
      end
      "#{major}.#{minor}.#{tiny}"
    end

    def tmp
      "#{@redmine_home_path}/tmp/"
    end

    def vendor_plugins
      @redmine_home_path + '/vendor/plugins/'
    end

    private
    def version_file
      @redmine_home_path + '/lib/redmine/version.rb'
    end
  end
end
