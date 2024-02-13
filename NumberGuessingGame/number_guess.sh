#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"
echo "Enter your username:"
read USERNAME
# Query the database for that username
USER_RESULT=$($PSQL "select games_played, best_game from users where username='$USERNAME'");
if [[ -z $USER_RESULT ]]
then
echo "Welcome, $USERNAME! It looks like this is your first time here.";
else
echo "$USER_RESULT" | while read GAMES_PLAYED BAR BEST_GAME
do
GP=$GAMES_PLAYED;
BG=$BEST_GAME;
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
done
fi
# Generate random number
RANDOM_NUMBER=$(($RANDOM%1000))
echo "Guess the secret number between 1 and 1000:"
read GUESS;
COUNT=1;
while [[ $GUESS != $RANDOM_NUMBER ]]
do
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then echo "That is not an integer, guess again:"
elif (( $GUESS > $RANDOM_NUMBER ))
then
echo "It's lower than that, guess again:"
elif (( $GUESS < $RANDOM_NUMBER ))
then echo "It's higher than that, guess again:"
fi
((++COUNT))
read GUESS;
done

# Add the score
if [[ -z $USER_RESULT ]]
then 
NEW_SCORE=$($PSQL "insert into users(games_played, best_game, username) values(1, $COUNT, '$USERNAME')");
else
echo "$USER_RESULT" | while read GAMES_PLAYED BAR BEST_GAME
do 
if (( $COUNT < $BEST_GAME ))
then echo "That was your best game!"
NEW_SCORE=$($PSQL "update users set games_played=$(($GAMES_PLAYED+1)), best_game=$COUNT where username='$USERNAME'")
else 
echo "that wasnt a new best"
NEW_SCORE=$($PSQL "update users set games_played=$(($GAMES_PLAYED+1)), best_game=$BEST_GAME where username='$USERNAME'")
fi
done
fi

echo "You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"