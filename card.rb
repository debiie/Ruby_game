class Card

    # defual intitailizer 
    attr_reader :value, :type
    def initialize  (value, type)
        @type=type;
        @value= value 
    end
    def testint_initailize () 
        puts(@type)
        puts(@value)
    end 

    def method_missing(method, *args, &block)
        "I haven't learned to #{method} yet :("
      end
    def print () 

        puts ("#{@type}")
    end 

    def to_s ()
        return  ("#{type}")
    end 
    def == (card)
        if card.instance_of? Card 
            # if self.value == card.value
            #     return true 
            # end 
            
            if self.type == card.type
                return true 
            end 

        
         else 
             return false 
         end 
        
    end  
end 
