#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class SubversionFetcher < Fetcher
    TYPE = 'subversion'
    SVN_BIN = 'svn'

    def initialize(dest_path, uri)
      @dest_path = dest_path
      @uri = uri
    end

    def fetch
      repo_name = extract_repo_name
      cmd = "#{SVN_BIN} checkout #{@uri} #{@dest_path}/#{repo_name}"
      system(cmd)
    end

    def extract_repo_name
      repo_name = @uri.sub(/\/$/, '')
      repo_name[repo_name.rindex('/') + 1, repo_name.size - 1]
    end
  end
end
