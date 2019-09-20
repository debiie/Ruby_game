require_relative "Players"

class Model 
    attr_accessor  :allPlayers ,:people, :places , :weapons,:winningCard,:allCards ,:currentPlayer

def initialize (people , places , weapons)
    @people=people.shuffle

    @places=places.shuffle
    @weapons=weapons.shuffle
    @winningCard= Hash.new{|hsh,key| hsh[key] = [] }
    @allCards=Array.new

end 

def setPlayers(arrayOfPlayers)
    # this should take in an array of players 
    @allPlayers=arrayOfPlayers
    index = 0
    # call the setup for each pkayer in the the list 
    puts "Here are the names of all the suspects "
        puts (printArray(@people))

    puts ("Here are all the locations ")
    puts (printArray(@places))
    puts ("here are all the weapons ")
    puts (printArray(@weapons))

    while ( index < @allPlayers.length )
        
        allPlayers[index].setup(@allPlayers.length,index,people,places,weapons)
        index = index + 1
    end 
    @currentPlayer = 0


end 

def setupCards () 

#chose the winning cards and store it 
    winningPerson = people.pop()
    winningPlace = places.pop()
    winningWeapon = weapons.pop()
    winningCard[winningPerson.value].push (winningPerson)
    winningCard[winningPlace.value].push (winningPlace)
    winningCard[winningWeapon.value].push (winningWeapon)
# remove those cards from the remaing cards 
    #then start to deal cards to other players 

    mixCard(@people)
    mixCard(@places)
    mixCard(@weapons)
    @allCards=@allCards.shuffle
    index = 0 
    while (index < @allCards.length)
        #puts ("#{@allCards[index]} is the casrd")
     distrubte(index, @allCards[index])
        index = index + 1 
    end 

    people.push(winningPerson)
    places.push(winningPlace)
    weapons.push(winningWeapon)

end 


def distrubte(index , ccard)
    

    if  index >= @allPlayers.length
        index = index % @allPlayers.length
    end 
    @allPlayers[index].setCard(ccard )
end 

def mixCard (alist )
    alist.each do |list1|
        @allCards.push (list1)
    end 
end 




def play () 
    gameOver = false 
    while (!gameOver )
        #ask the player 0 which should be the actoive player at the begging of the game 
        currentGuess =@allPlayers[@currentPlayer].getGuess()
        if (currentGuess.isAccusation)
            #testthe accustaion f its true 
            answer = checkWInning(currentGuess)
            puts (answer)
            if ( answer==true)
                gameOver= true 
                puts ("game is over")
            else 
                #remove a player from tehe game
                puts "player #{currentPlayer} was removed from the game " 

            end 

        else 
            #asll the players f they can answer from next index 
            puts ("player #{currentPlayer} : suggestion : #{currentGuess.to_s}")
            nextPlayerAnswer =  @currentPlayer+ 1 
            if ( nextPlayerAnswer >= @allPlayers.length )
                nextPlayerAnswer= nextPlayerAnswer % @allPlayers.length
                
            end 
            # check all the players, f they  can answer 
            anyAnswer = nil 
            indexOfAnswer = nil # the index of the person who answeered 
            while (anyAnswer==nil && nextPlayerAnswer != @currentPlayer )
                # it should kepp askingif nobody as answered and  we havnt gotten back to the current player
                if (nextPlayerAnswer >= @allPlayers.length )
                    nextPlayerAnswer = nextPlayerAnswer % @allPlayers.length
                end 
                indexOfAnswer= nextPlayerAnswer
                anyAnswer = @allPlayers[nextPlayerAnswer].canAnswer(@currentPlayer,currentGuess)
                nextPlayerAnswer = nextPlayerAnswer + 1 


            end 
            if anyAnswer != nil
                #f there was somone that could answer 
                @allPlayers[@currentPlayer].receiveInfo(indexOfAnswer,currentGuess)

            else #f no one could answer 
                @allPlayers[@currentPlayer].receiveInfo(-1,nil )
            end 
    
        end 

            ##move to the next player 
            @currentPlayer = @currentPlayer + 1 
            if (@currentPlayer >= @allPlayers.length)
                @currentPlayer = @currentPlayer % @allPlayers.length
            end 


end 
end 

# this ,ythod checks if the guess is the current guess for the game to be over 

def checkWInning (guess )
    ret = false 
    if (@winningCard[:person][0].type==guess.person && (@winningCard[:place][0].type==guess.place ) && @winningCard[:weapon][0].type==guess.weapon) 
        ret= true 
     
    end 

    
      
    return ret 
end

def printArray (array )
    index =0 
    ret =" "
    while (index < array.length)
        #if !array[index].nil?
        puts (array[index].to_s)
            ret = ret + array[index].to_s
        #end 
        index = index +1 
    end 
end 
end 




