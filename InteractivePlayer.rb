require_relative "Players"
require_relative "Card"
require_relative "Guess"

class InteractivePlayer < Players

    def initialize ()
        @myCards = Array.new
        
    end 


    def setup(numberOfplayers,currentIndex,suspectList,locationList,weaponList)
        @numberOfPerson= numberOfplayers
        @indexOfCurr= currentIndex
        @locationList = locationList
        @weaponList= weaponList
        @suspectList = suspectList
        suspectList.each do |ss|
            puts ss.to_s
        end 
        @allist= {"person"=>suspectList,"Weapons"=>weaponList,"Places"=>locationList}
      
        
    end 
    

    # The method is has a parameter that is a card 
    def setCard( card )
        #the method should add to th earray of cards the player has 
        if card.instance_of? Card
            @myCards.push (card)
        end 
     

    end 
    def allmyCards ()
        @myCards.each do |csd|
            puts ("you recieved #{csd}")
          end 
        end 




   
    def getGuess ()
        # this should list all the suspects and ask the player to make a guess from the list of suspects 
        #thats hsoul meka up part of  the players guess 
        #check #  the suspect list is array 
        completeGuess = Array.new 
            # then ot should orint out all the values and the index
            @allist.each  do |keys,value2 |
                puts("Which  #{keys} do you suspect ")
                
                #value2 .each do |value2 |
                printList(value2 )
                
                #num  = gets 
                num = checkInput(num)
                while ( num >=value2.length)
                    puts ("Invalid number, Try again ")
                    num = gets
                    num = checkInput(num)
                end 
                completeGuess.push (value2[num].type)
            #end
        end 
        puts ("Is this an accustaion?(Y/n)")
        aval = gets.chomp
        while !aval.is_a? String

            puts("Please put (y/n)")
            aval=gets.chomp 
        end 
        aval= aval.downcase

        while aval !='n' && aval !='y' do 

            puts("please choose between(y/n)")
            aval = gets.chomp


        end 
        puts("#{aval} was your choice")
        if   aval.is_a? String 
            if aval=="n"
                #themn it is an suggestion 

                aGuess=Guess.new(completeGuess[0],completeGuess[1],completeGuess[2],false )
            elsif  aval == "y"
                #then its an accustaion 
                aGuess=Guess.new(completeGuess[0],completeGuess[1],completeGuess[2],true  )
            end 
        end 
        

        


        return aGuess 
    end 

    # this is a print method for the cards owned by the 
    def print()
        if myCards.any?

            @myCards.each do |myCards|
                myCards.print()
            end 
        else 
            puts("Empty Array")
        end 
    end

    # the check method should check if the current player has the card that is passee to the current player 
    def check (guess ) 
        ret = Array.new 
        if guess.instance_of? Guess 
            @myCards.each do |cRD|
              
                
                temp =guess.get(cRD.value)

                if !temp.nil?
                    #should print out the answer or a message 
                    ret.push (temp)
                    
                
                end 
            end 
            
        end
        return ret 

    end 


    # the method is to check if the passed input is a string and print out all the reauired error messages
    # for wrong input 

    def checkInput(val ) 
        if val.is_a?(Integer)
            

            return val 
        else
        until val.is_a?(Integer ) do 

            puts ( "Please put in a number!")

            begin
                val = Integer (gets )
            rescue ArgumentError=> e
                val = nil 
            end
        end 
        return val 
    end
    end 

    # this takes in a guess anindex of the curerent player 
    def canAnswer (index, guess )
        # show the current huess and index 
         # the current player should answer the vguess of they have the card 
        #checking the card of the currenyt player 

        # first check  the guess is a guess 
        puts ("Its your turn ")
        arr =check (guess)
        if !arr.any?
            puts("player#{index} made a guess#{guess.to_s}. But u didnt have an answer ")
            return nil 
        else 
            if (arr.length== 1)
                return guess.getValue(arr[0])

            else 
            puts("player#{index} made a guess#{guess.to_s}. Which do you want to show?")
            # print out the options 
            
            arr.each do |arr|
                puts(arr.to_s)
            end 

            #prompt the user or a a value and error check 
            #val = gets.chomp 
           
            val = checkInput(val)
            

            while val>=arr.length 
                puts ("Invalid. Try again!")
                val =gets
                val =checkInput(val)
            end 
           
            if val < arr.length


                #this should return the value of the number passed in 

                return guess.getValue(arr[val])
            end 


        
        end 

    end 
    end 

    #3 this method is calling can Answer 
def receiveInfo(index , ccard )
    # no player can answer the guess c is nill
    if ccard.nil?
        puts("No body was able to answer the guess")
    else 
        puts ("Player #{index} refuted your sugestion by showing  #{ccard}")


    end 


     

end 

def toString() 
    puts ("Number of players #{numberOfPerson}" )
    puts ("Cards in hand #{@myCards} in interactive player ")
end

end
