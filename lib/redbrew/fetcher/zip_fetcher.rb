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
      cmd = "#{WGET_BIN} #{@uri} -O #{tmpdir}/#{file_name}"
      system(cmd)
      extract_dir = "#{tmpdir}/#{File.basename(file_name, '.zip')}#{Time.now.strftime('%Y%m%d%H%M%S')}"
      cmd = "#{UNZIP_BIN} #{tmpdir}/#{file_name} -d #{extract_dir}"
      system(cmd)
      FileUtils.move(plugin_root_dir(extract_dir), "#{@dest_path}/#{File.basename(file_name, '.zip')}")
    end

    def tmp_dir
      Dir.tmpdir
    end

    def extract_file_name
      @uri[@uri.rindex('/') + 1, @uri.size - 1]
    end

    def plugin_root_dir(extract_dir)
      sub = Dir.glob("#{extract_dir}/*")
      sub.size == 1 ? sub.first : extract_dir
    end
  end
end
