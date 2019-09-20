# #require './card'
require_relative "Guess"
require_relative "Card"
#require_relative "InteractivePlayer"
#require_relative "Player"

class Players
    attr_reader :numberOfPerson,:indexOfCurr
    attr_reader :myCards ,:allist
    attr_reader :locationList,:weaponList,:suspectList
    attr_accessor :aGuess 

    def Players.new (*args ) 
        if self == Players
            raise "Abstract Class" 
        else 
            super
        end 

    end 

    # this method should print an alist of things passed in as a parameter 
    def printList (alist )
        if alist.kind_of?(Array)
            # it hsould orint out all the vlues in the array 
            alist.each_with_index do |alist , indeex |
                puts ("#{indeex}. #{alist.type }")
            end

        else 
            puts("I guess this is also empty")
        end 



    end 
    def receiveInfo (index , cardd)
        
        
        raise "Abstract method not implmented in #{self}"


    end 
    def isAccusation()
        return isAccusation
    end 
    def check (guess ) 
        ret = Array.new 
        if guess.instance_of? Guess 
            @myCards.each do |cRD|
              
            
                temp =guess.get(cRD.value)
                if temp==cRD
                    #should print out the answer or a message 
                    ret.push (temp)
                
                end 
            end 
            
        end
        return ret 

    end 


    def initialize()
        myCards="Broken"
    end 
    def setup (numberOfplayers,currentIndex,suspectList,locationList,weaponList) 
        raise "Abstract method not implmented in #{self}"
    end
  

    def setCard(card )
        #the method should add to th earray of cards 
        raise "Abstract method not implemented in #{self}"
    end 

    # this method should indicate that  the current player can answer
    def canAnswer(index, guess)
        raise "Abstract method  not implemented in #{self}"
    end 

    def getGuess () 
        raise "Abstract method not implemented in #{self}"
    end 

    def toString() 
        puts ("Number of players #{numberOfPerson}" )
        puts ("Cards in hand #{myCards}")
    end
end

