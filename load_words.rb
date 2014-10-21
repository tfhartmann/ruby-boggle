#!/usr/bin/env ruby

require 'optparse'
require 'json'
require 'httparty'




class Load_words
  include HTTParty
end

response = Load_words.get('http://www.puzzlers.org/pub/wordlists/ospd.txt')
#puts response.body, response.code, response.message, response.headers.inspect


# Put data into an array
a_body = response.body.split("\n")

a_body.each do | word |
        puts "this is a word : #{word}"
end
