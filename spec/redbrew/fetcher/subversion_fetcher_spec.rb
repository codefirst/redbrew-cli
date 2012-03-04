#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Redbrew::SubversionFetcher do
  SVN_REPO_URI = 'http://r-labs.googlecode.com/svn/trunk/plugins/redmine_hudson/'

  describe 'extract_repo_name' do
    subject { Redbrew::SubversionFetcher.new('.', SVN_REPO_URI)}
    its(:extract_repo_name) { should == 'redmine_hudson' }
  end

  describe 'fetch' do
    it do
      fetcher = Redbrew::SubversionFetcher.new('.', SVN_REPO_URI)
      fetcher.should_receive(:system).with("svn checkout #{SVN_REPO_URI} ./redmine_hudson") { true }
      fetcher.fetch.should be_true
    end
  end
end
