#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-
require 'open-uri'
require 'json'

module Redbrew
  class RedbrewWeb
    URL = 'http://redbrew.heroku.com'

    def self.plugin(plugin_id)
      api_url = URL + "/plugins/#{plugin_id}.json"
      parse_json(api_url)
    end

    def self.search(keyword)
      api_url = URL + "/plugins?q=#{keyword}&format=json"
      parse_json(api_url)
    end

    private
    def self.parse_json(api_url)
      content = open(api_url).read
      JSON.parse(content)
    end
  end
end

