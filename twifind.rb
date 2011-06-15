# -*- coding: utf-8 -*-
require "rubygems"
require "twitter"
require "pp"

Twitter.configure do |cnf|
  cnf.consumer_key = ""         # Consumer key
  cnf.consumer_secret = ""      # Consumer secret
  cnf.oauth_token = ""          # oauth token
  cnf.oauth_token_secret = ""   # oauth token secret
end

#TL
Twitter.friends_timeline.each do |res|
  p "#{res.from_user}: #{res.text}"
end

options = {"count" => 10}
Twitter.user_timeline("t_ramu", options).each do |res|
  p "#{res.from_user}: #{res.text}"
end

search = Twitter::Search.new
search.containing("rails").language("ja").result_type("recent").per_page(5).each do |r|

