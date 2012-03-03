#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class GitFetcher < Fetcher
    TYPE = 'git'
    GIT_BIN = 'git'

    def initialize(dest_path, uri)
      @dest_path = dest_path
      @uri = uri
    end

    def fetch
      repo_name = extract_repo_name
      cmd = "#{GIT_BIN} clone #{@uri} #{@dest_path}/#{repo_name}"
      system(cmd)
    end

    def extract_repo_name
      repo_name = @uri[@uri.rindex('/') + 1, @uri.size - 1]
      repo_name.sub!(/\.git$/, '')
      repo_name
    end
  end
end
