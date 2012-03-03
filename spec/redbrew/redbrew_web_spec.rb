#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe Redbrew::RedbrewWeb do
  context 'get plugin' do
    response = <<-JSON
    {
      "name": "RedmineAttachmentsSize",
      "created_at": "2012-02-28T13:56:48Z",
      "create_user_id": 1,
      "updated_at": "2012-02-28T13:56:48Z",
      "url": "https://github.com/suer/redmine_attachments_size",
      "id": 1,
      "formula": "formula",
      "desription": "Disk Usage Plugin",
      "update_user_id": 1
    }
    JSON

    FakeWeb.register_uri(:get, 'http://redbrew.heroku.com/plugins/RedmineAttachmentsSize.json', :body => response)

    subject { Redbrew::RedbrewWeb.plugin('RedmineAttachmentsSize') }
    its(['name']) { should == 'RedmineAttachmentsSize' }
    its(['create_user_id']) { should == 1 }
  end

  context 'search plugins' do
    response = <<-JSON
    [{
      "name": "RedmineAttachmentsSize",
      "created_at": "2012-02-28T13:56:48Z",
      "create_user_id": 1,
      "updated_at": "2012-02-28T13:56:48Z",
      "url": "https://github.com/suer/redmine_attachments_size",
      "id": 1,
      "formula": "formula",
      "desription": "Disk Usage Plugin",
      "update_user_id": 1
    }]
    JSON

    FakeWeb.register_uri(:get, 'http://redbrew.heroku.com/plugins?q=keyword&format=json', :body => response)

    subject { Redbrew::RedbrewWeb.search('keyword')[0] }
    #its(:size) { should == 1 }
    its(['name']) { should == 'RedmineAttachmentsSize' }
    its(['create_user_id']) { should == 1 }
  end
end

