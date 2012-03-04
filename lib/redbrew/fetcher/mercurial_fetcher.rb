#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class MercurialFetcher < Fetcher
    TYPE = 'mercurial'
    HG_BIN = 'hg'

    def initialize(dest_path, uri)
      @dest_path = dest_path
      @uri = uri
    end

    def fetch
      repo_name = extract_repo_name
      cmd = "#{HG_BIN} clone #{@uri} #{@dest_path}/#{repo_name}"
      system(cmd)
    end

    def extract_repo_name
      @uri[@uri.rindex('/') + 1, @uri.size - 1]
    end
  end
end
