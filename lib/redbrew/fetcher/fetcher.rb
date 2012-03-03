#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

class NotImplemented < Exception; end

module Redbrew
  class Fetcher
    def initialize(dest_path, uri)
      @dest_path = dest_path
      @uri = uri
    end

    def fetch
      raise NotImplemented, "'fetch' must be implemented in subclass."
    end

    def self.create(type, dest_path, uri)
      if type == GitFetcher::TYPE
        GitFetcher.new(dest_path, uri)
      end
    end
  end
end
