#!/usr/bin/env ruby

require 'optparse'
require_relative 'load_words'

options = {}



response = Load_words.get('http://www.puzzlers.org/pub/wordlists/ospd.txt')

# Put data into an array
a_body = response.body.split("\n")

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


a_body.each do | word |
        #puts "this is a word : #{word}"
        if options[:string] == word 
            puts "Test!"
            puts "test2"
        end
end
#debug
puts options
puts options[:string]
puts ARGV

# Binary search  (cut list in half) 
# ( might be better to use a hash to lookup words) 
# hash set 
#

