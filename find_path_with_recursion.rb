#!/usr/bin/env ruby

require 'optparse'
require 'set'
require 'pp'


#response = Load_words.get('http://www.puzzlers.org/pub/wordlists/ospd.txt')
# Put data into an array
#a_body = response.body.split("\n").to_set
#d_body = Hash[a_body.map {|x| [x, x]}]

all_words = []
File.open('ospd.txt').each do | line | 
  all_words.push(line)
end

test_words = [ 'apple', 'zebra', 'eggs' ]

def make_prefix_hash( words )
  result = {}
  words.each do | word |
    prefix = word
    while prefix.length > 0 do
      result[prefix] = word
      prefix = prefix.chop
    end
  end
  return result
end

#puts make_prefix_hash(test_words)
@megahash = make_prefix_hash(all_words)
        
def OLDsearch4awesome( words, prefix )
  words.each { |word| 
    if /^#{prefix}/ =~ word
        return true
    end
  }
  return false
end

def search4awesome( words, prefix )
  words.each { |word| 
    if /^#{prefix}/ =~ word
        return true
    end
  }
  return false
end

def NEWsearch4awesome( prefix )
  return @megahash[prefix]
end

class LessAwesomeSearch
  def initialize(word_list)
    @my_list = word_list
  end

  def search(prefix)
    @my_list.each { |word| 
      if /^#{prefix}/ =~ word
          return true
      end
    }
    return false
  end
end

class AwesomeSearch
  def initialize(word_list)
    @my_hash = make_prefix_hash(word_list)
  end

  def search(prefix)
    return @my_hash[prefix]
  end
end

test_words_lookup = AwesomeSearch.new(test_words)
#other_test_words_lookup = AwesomeSearch.new({"mark" => "mark", "alaric" => "alaric"})

#test_words_lookup = LessAwesomeSearch.new(test_words)

if test_words_lookup.search( 'soup' ) 
    puts 'test failed soup should not have been found'
end 
if not test_words_lookup.search( 'zebra' ) 
    puts 'test failed zebra should have been found'
end 
if not test_words_lookup.search( 'zeb' ) 
    puts 'test failed zeb should have been found in zebra'
end 
if test_words_lookup.search( 'ebra' ) 
    puts 'test failed ebra should not have been found'
end 

#
#for i in 0...10 do
#  rand_word = (0...8).map { ('a'.ord + rand(26)).chr }.join
#  puts rand_word
#  all_words_lookup.search(rand_word)
#  test_words_lookup.search(rand_word)
#end



all_words_lookup = AwesomeSearch.new(all_words)
also_all_words_lookup = LessAwesomeSearch.new(all_words)

#for i in 0...10 do
#  rand_word = (0...2).map { ('a'.ord + rand(26)).chr }.join
#  puts rand_word
#  puts test_words_lookup.search(rand_word)
#  puts all_words_lookup.search(rand_word)
#  puts also_all_words_lookup.search(rand_word)
#end
