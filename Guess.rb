
class Guess 
    attr_reader  :person, :weapon, :place, :isAccusation ,:eachGuess#the type should be a booleab 
    attr_reader :aHash 
    def initialize(person,weapon,place,type )
        #this should do some error checking  the person number is greater 
        

        # set the values to the instance variables
        @person =person
        @weapon= weapon
        @place=place
        @isAccusation= type
        
        @aHash = Hash.new# store the cards from the guesses 
        @aHash[@person] =person
        @aHash[@weapon]= weapon
        @aHash[@place] = place

        @eachGuess =  Hash.new
        @eachGuess[:person] = person
        @eachGuess[:place]= place
        @eachGuess[:weapon]= weapon
    
    end
    
    
    def method_missing(method, *args, &block)

        "I haven't learned to #{method} yet :("
      end


      # th e method is to check if 

    def getValue(key)
        
        return @aHash[key]
    end 

    def get(key )
        return@eachGuess[key]
    end 
     
     def == (guess)
        # this should be comparing  two huesses 

        #first check iuf what was passed was a guess 
        if guess.instance_of? Guess
            if self.person==guess.person
                return true  
             
            elsif  self.weapon==guess.weapon
                return true 
             
            elsif self.place==guess.place
                return true

            end 
         
        else 
            return false 
        end 
    end 
    
    def to_s () 
        #puts ("in the to_s of guess")
        return ("#{self.person} at #{@place} with the #{@weapon}")
    end 
end 

  