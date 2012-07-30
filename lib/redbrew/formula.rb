#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class Formula
    def initialize(redmine_home)
      @redmine_home = redmine_home
    end

    def git(uri)
      @type = 'git'
      @uri = uri
    end

    def mercurial(uri)
      @type = 'mercurial'
      @uri = uri
    end

    def subversion(uri)
      @type = 'subversion'
      @uri = uri
    end

    def zip(uri)
      @type = 'zip'
      @uri = uri
    end

    def required(ver)
      @required = ver
    end

    def exec(&p)
      @proc = p
    end

    def run
      if @required
        ver = Gem::Version.create(@redmine_home.version)
        unless Gem::Requirement.create(@required).satisfied_by?(ver)
          raise "This plugin cannot be installed to Redmine #{@redmine_home.version}. Required #{@required}"
        end
      end
      fetcher = Fetcher.create(@type, @redmine_home.plugins_directory, @uri)
      fetcher.fetch if fetcher
      @proc.call if @proc
    end
  end
end

