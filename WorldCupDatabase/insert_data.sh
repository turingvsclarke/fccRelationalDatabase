#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
$PSQL "truncate games cascade"
$PSQL "truncate teams cascade"
# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
# skip the first line
do
if [[ $YEAR != "year" ]]
then 
# Add a team for each opponent and winner. 
# Check if the winner has already been inserted and insert if not
# Check if the opponent has already been inserted and insert if not
RESULT="$($PSQL "select * from teams where name='$WINNER'")"
if [[ -z $RESULT ]]
then 
echo "$($PSQL "insert into teams(name) values('$WINNER')")"
else 
echo $WINNER
fi
RESULT="$($PSQL "select * from teams where name='$OPPONENT'")"
if [[ -z $RESULT ]]
then 
echo "$($PSQL "insert into teams(name) values('$OPPONENT')")"
else 
echo $WINNER
fi
# Get the ids of those two teams
WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'");
OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'");

# Add the game
$PSQL "insert into games(year, round, opponent_goals, opponent_id, winner_id, winner_goals) values($YEAR, '$ROUND', $OPPONENT_GOALS, $OPPONENT_ID, $WINNER_ID, $WINNER_GOALS)";

fi

done 