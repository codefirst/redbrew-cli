#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class GitFetcher < Fetcher
    TYPE = 'git'

    def initialize(dest_path, uri)
      @dest_path = dest_path
      @uri = uri
    end

    def fetch
      # TODO
    end
  end
end
