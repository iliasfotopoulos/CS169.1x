module FunWithStrings

  def palindrome?
    temp = self.downcase.gsub(/\W/){""}
    temp == temp.reverse
  end

  def count_words
    h = Hash.new(0)

    self.downcase.gsub(/[!.,-]/, '').split(" ").each do |word|
      h[word] += 1
    end

    return h
  end

  def count_chars
    h = Hash.new(0)

    self.each_char do |char|
      h[char] += 1
    end

    return h
  end

  def anagram_strings(a,b)
    h1 = count_chars(a)
    h2 = count_chars(b)
    return h1 == h2
  end

  def anagram_groups
    words = self.split(" ")
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
