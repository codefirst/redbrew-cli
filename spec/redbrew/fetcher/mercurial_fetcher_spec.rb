#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Redbrew::MercurialFetcher do
  MERCURIAL_REPO_URI = 'https://bitbucket.org/haru_iida/redmine_mobile_face'

  describe 'extract_repo_name' do
    subject { Redbrew::MercurialFetcher.new('.', MERCURIAL_REPO_URI)}
    its(:extract_repo_name) { should == 'redmine_mobile_face' }
  end

  describe 'fetch' do
    it do
      fetcher = Redbrew::MercurialFetcher.new('.', MERCURIAL_REPO_URI)
      fetcher.should_receive(:system).with("hg clone #{MERCURIAL_REPO_URI} ./redmine_mobile_face") { true }
      fetcher.fetch.should be_true
    end
  end
end
