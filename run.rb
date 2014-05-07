require_relative 'Anagram.rb'

a = Anagram.new

puts 'Enter a word: '
a.origin = gets
a.origin.delete! "\n"

list = a.partial_anagrams
puts "found #{list.size} partial anagrams for the word \"#{a.origin}\""
puts list.join ' '
puts "\n"

list = a.anagrams
puts "found #{list.size} two word anagrams for the word \"#{a.origin}\""
list.each do |a|
  puts a
end