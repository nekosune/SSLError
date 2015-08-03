require 'rubygems'
require 'bundler/setup'
require "pp"
require 'yaml'

require 'redd'
@config = YAML::load(IO.read('config.yml'))
@redditConfig=@config['reddit']
@redditclient=Redd.it(:script,@redditConfig['clientid'],@redditConfig['secret'],@redditConfig['username'],@redditConfig['password'],user_agent: "SROTDroid V 2.1")
@redditclient.authorize!

pp @redditclient.subreddit_from_name("lgbt")