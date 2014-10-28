#!/usr/bin/env ruby

require 'optparse'
require 'set'
require 'pp'
require_relative 'load_words'

options = {}



response = Load_words.get('http://www.puzzlers.org/pub/wordlists/ospd.txt')

# Put data into an array
a_body = response.body.split("\n").to_set

d_body = Hash[a_body.map {|x| [x, x]}]

optparse = OptionParser.new do |opts|
    opts.banner = "Usage: boggle.rb [options]"

    opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options[:verbose] = v
    end
    opts.on("-s", "--string STRING", "Pass in a string to be parsed" ) do |s|
        options[:string] = s
    end
end
optparse.parse!

@word = options[:string] 

def match_word(word, array)
    if array.has_key?(word)
        puts "Matched word : #{word}"
    end
end

match_word(@word, d_body)
#debug
#puts pp(d_body)
puts options
puts options[:string]
puts ARGV

# Binary search  (cut list in half) 
# ( might be better to use a hash to lookup words) 
# hash set 
#

