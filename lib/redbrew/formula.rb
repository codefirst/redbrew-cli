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

    def redmine_version(version)
      @redmine_version = version
    end

    def exec(&p)
      @proc = p
    end

    def run
      # TODO check redmine_version
      fetcher = Fetcher.create(@type, @redmine_home.vendor_plugins, @uri)
      fetcher.fetch if fetcher
      @proc.call if @proc
    end
  end
end

