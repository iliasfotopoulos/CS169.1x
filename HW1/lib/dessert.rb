class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    self.calories < 200
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  
  def initialize(flavor)    
    @calories = 5
    @name = "#{flavor} jelly bean"
    #super(flavor + " jelly bean", 5)
    @flavor = flavor
  end

  def delicious?
    self.flavor == "licorice" ? false : true
  end

end
