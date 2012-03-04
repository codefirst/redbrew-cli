#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class ZipFetcher < Fetcher
    TYPE = 'zip'
    WGET_BIN = 'wget'
    UNZIP_BIN = 'unzip'

    def initialize(dest_path, uri)
      @dest_path = dest_path
      @uri = uri
    end

    def fetch
      file_name = extract_file_name
      tmpdir = tmp_dir
      cmd = "#{WGET_BIN} #{@uri} -O #{tmp_dir}/#{file_name}"
      system(cmd)
      cmd = "#{UNZIP_BIN} #{tmp_dir}/#{file_name} #{@dest_path}/#{File.basename(file_name, '.zip')}"
      system(cmd)
    end

    def tmp_dir
      Dir.tmpdir
    end

    def extract_file_name
      @uri[@uri.rindex('/') + 1, @uri.size - 1]
    end
  end
end
