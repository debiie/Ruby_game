require_relative "Players"
require_relative "Card"
require_relative "Guess"

# //-----------------------------------------
# // NAME		: Stanley Anamelechi 
# // STUDENT NUMBER	: 7819079
# // COURSE		: COMP 2150
# // INSTRUCTOR	: Mike Dormatziki
# // ASSIGNMENT	: assignment 4
# // QUESTION	: question      
# // 
# // REMARKS: What is the purpose of this program?
# //
# //
# //----
class Player < Players 


    # this should a list of the guess that have been mad and start make guesses from there to know if 
    #it should meake a suggestio n or an accusation 
    attr_reader :otherSuggestions,:arrayOfKeys,:arrangedCards,:myGuess,:isArranged 

    def initialize() 
 
        @myCards = Array.new 
    end 

    def setup(numberOfplayers,currentIndex,suspectList,locationList,weaponList)
        @numberOfPerson= numberOfplayers
        isArranged = false 
        @indexOfCurr= currentIndex
        @locationList = locationList
        @locationList2 =nil 
        @weaponList= weaponList
        @weaponList2= weaponList

        @Suspects = suspectList 
        @suspectList2=nil
        @allist= {"person"=>suspectList,"Weapons"=>weaponList,"Places"=>locationList}
 
        @otherSuggestions =Hash.new{|hsh,key| hsh[key] = [] }
        @arrangedCards=Hash.new{|hsh,key| hsh[key] = [] }
        @arrayOfKeys= Array.new 
        @arrayofcards=nil 
        @myGuess=Hash.new{|hsh,key| hsh[key] = [] } #this is a hash of all the guess that i have made previously 
       


    end 

    # The method is has a parameter that is a card 
    def setCard( card )
        #the method should add to th earray of cards the player has 
        if card.instance_of? Card
            @myCards.push (card)
        end 
       

    end

    def arrange () 
        @myCards.each do |ss|
            @arrangedCards[ss.value].push (ss)





    end 
    @arrayofcards= (arrangedCards.keys)
end 

    def newCards(value ,list2 )
        ret = Array.new 

                
                list2.each do |sd|

                  if (!(@arrangedCards[value].include? sd ))

                        ret.push sd
                end 
            end 
             
             

    
        if !(@arrayofcards.include? value ) 
            list2.each do |l2|
                ret.push(l2)
            end 
        end 

 
    return ret 
end 

    def ui()
        arrange()
        @suspectList2=newCards(:person,@Suspects)
        @weaponList2=newCards(:weapon,@weaponList)
        @locationList2= newCards(:place,@locationList)
       
end 
  



    
    def getGuess () 
        if (!@isArranged)
            ui()
            @isArranged= true 
        end 
     
        if ((@suspectList2.length)==1 && (@locationList2.length)==1 && (@weaponList2.length)==1)
            aGuess = Guess.new(@suspectList2[0],@weaponList2[0],@locationList2[0],true )
        else 
            aGuess=Guess.new(@suspectList2[0],@weaponList2[0],@locationList2[0],false)
        end 


    end 
    
        
 
    
    def canAnswer ( index , guess )
        #check the cards that the player has 
        puts ( "Asking player #{indexOfCurr}")
        arr = check ( guess)
        if arr.any?
            #f the player has any of the ues cards 
            #show a  card 
            #f the player has one card thenot should just show the card 
            if arr.length==1 
                return arr.pop
            else 
                # the player has more crads it should chose what card to show 
                # it should pick random numers  from 0 and the length of teh array-1 
                number = rand (0..arr.length-1)
                return arr[number]

            end 
        else 
            #f the player des not have any of card suggested 
            return nil 

    end 
end 

    def receiveInfo(index, ccard )
        # no player can answer the guess c is nill
        if ccard.nil?
            puts("No body was able to answer the guess")
        else 
            puts ("Player #{index} anwered ")
            if ccard.value==:person
                @suspectList2.delete(ccard)
            elsif ccard.value ==:place 
                @locationList2.delete(ccard)
            elsif ccard.value ==:weapon

                @weaponList2.delete(ccard)
            end 
    
    
    end 

    def toString() 
        puts ("Number of players #{numberOfPerson}" )
        puts ("Cards in hand #{@myCards} in Inter")
    end


end 
 

end 
