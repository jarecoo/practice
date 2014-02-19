class Doge
  attr_accessor :name, :age

  def initialize(name="rufis")
    @name = name
  end

  def bark
    "woof"
  end

  def urinate
    true
  end

  def dog_age
    age * 7
  end

end
