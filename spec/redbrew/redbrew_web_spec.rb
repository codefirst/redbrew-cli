#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe Redbrew::RedbrewWeb do
  RESPONSE = <<-JSON
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

  FakeWeb.register_uri(:get, 'http://redbrew.heroku.com/plugins/RedmineAttachmentsSize.json', :body => RESPONSE)

  context 'get plugin' do
    subject { Redbrew::RedbrewWeb.plugin('RedmineAttachmentsSize') }
    its(['name']) { should == 'RedmineAttachmentsSize' }
    its(['create_user_id']) { should == 1 }
  end
end

