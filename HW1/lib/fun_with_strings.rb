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

  def anagram_groups
    self.downcase.split.group_by {|word| word.downcase.chars.sort }.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
