#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"
if [[ -z $1 ]]
then echo "Please provide an element as an argument."
else 
# Check to see if the argument is an integer
if [[ $1 =~ ^[0-9]+$ ]]
then RESULT=$($PSQL "select atomic_number, name, symbol from elements where atomic_number=$1");
else
RESULT=$($PSQL "select atomic_number, name, symbol from elements where symbol='$1' or name='$1'");
fi
if [[ -z $RESULT ]]
then echo "I could not find that element in the database.";
else
echo "$RESULT" | while read NUMBER BAR NAME BAR SYMBOL
do
PROPS=$($PSQL "select type, atomic_mass, boiling_point_celsius, melting_point_celsius from properties left join types using(type_id) where atomic_number=$NUMBER")
echo "$PROPS" | while read TYPE BAR MASS BAR BOILING BAR MELTING
do
echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius.";
done
done
fi
fi