class Anagram
  attr_accessor :origin

  def anagrams
    list = []

    partial_anagrams.each do |pa_word|
      o = origin.dup
      pa_word.split("").each {|letter| o.delete! letter }

      partial_anagrams(o, false).each do |pa_extra|
        list.push "#{pa_word} #{pa_extra}"
      end
    end

    list
  end

  def partial_anagrams origin_word=origin, partial=true
    list = []
    short_word_list.each do |word|
      match = true
      o = origin_word.dup

      word.split("").each do |letter|
        if o.include? letter or letter == "'"
          o.delete! letter
        else
          match = false
          break
        end
      end

      list.push word if match && ( partial || word.length == origin_word.length )
    end
    list
  end

  def long_word_list
    File.readlines("words_long.txt").each {|word| word.delete! "\n"}
  end

  def short_word_list
    File.readlines("words_short.txt").each {|word| word.delete! "\n"}
  end
end