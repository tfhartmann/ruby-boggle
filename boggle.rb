#!/usr/bin/env ruby

require 'optparse'
require_relative 'load_words'




response = Load_words.get('http://www.puzzlers.org/pub/wordlists/ospd.txt')

# Put data into an array
a_body = response.body.split("\n")

a_body.each do | word |
        puts "this is a word : #{word}"
end
