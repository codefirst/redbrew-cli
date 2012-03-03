#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Redbrew::GitFetcher do
  REPO_URI = 'git://github.com/suer/redmine_incr_code_search.git'

  describe 'extract_repo_name' do
    subject { Redbrew::GitFetcher.new('.', REPO_URI)}
    its(:extract_repo_name) { should == 'redmine_incr_code_search' }
  end

  describe 'fetch' do
    it do
      fetcher = Redbrew::GitFetcher.new('.', REPO_URI)
      fetcher.should_receive(:system).with("git clone #{REPO_URI} ./redmine_incr_code_search") { true }
      fetcher.fetch.should be_true
    end
  end
end
