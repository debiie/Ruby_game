
class InstanceVars
  @@var = "class"
  @var = "class instance"
    
  def initialize
    @var = "instance"
  end
  
  
  def InstanceVars.test #class method  calls the class instance 
    puts(@var)  # class context --> "class instance"
  end
  
  def test
    InstanceVars.test # class level method defined on line 11
    puts(@@var)
    puts(@var)
  end
end

x = InstanceVars.new()
x.test


class Sub < InstanceVars
  @@var = "subclass" ## <<---- this is shared between InstanceVars and Sub
  @var = "subclass class instance"
  
  def initialize
    @var = "subclass instance"
  end
  
  def Sub.test
    puts(@var)
  end
  
  def test
    Sub.test
    puts(@@var)
    puts(@var)
  end
end

puts('--------------------')
y = Sub.new()
y.test

puts('---------------------')
z = InstanceVars.new()
z.test