#!/bin/bash
DB="psql -X --username=freecodecamp --dbname=salon --tuples-only -c";
echo -e "\n\n~~ Salon Appointment Scheduler ~~\n\n";

function LIST_SERVICES() {
    if [[ ! -z $1 ]]
    then echo $1;
    fi
    AVAILABLE_SERVICES=$($DB "select service_id, name from services");
    # Create a while loop for services
    echo "Please select what you're here for today:";  
    echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME 
    do echo "$SERVICE_ID) $SERVICE_NAME"
    done
    SCHEDULE_SERVICE;
}
function SCHEDULE_SERVICE {
    # Get input from the user
    read SERVICE_ID_SELECTED
    # Check if the result is an integer
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then LIST_SERVICES "Please enter an integer matching the services above";
    else SELECTED_SERVICE=$($DB "select name from services where service_id=$SERVICE_ID_SELECTED");
    # Check if that service exists
    if [[ -z $SELECTED_SERVICE ]]
    then LIST_SERVICES "Please enter a valid service from the list";
    else
    echo -e "\nThank you. What is your phone number, please?\n";
    read CUSTOMER_PHONE;
    # Check to see if that phone number has already been used. 
    CUSTOMER_NAME=$($DB "select name from customers where phone='$CUSTOMER_PHONE'");
    # If there is no name, get there name from them
    if [[ -z $CUSTOMER_NAME ]]
    then echo "Thank you. It looks like we don't have your information stored yet. Please enter your name:";
    read CUSTOMER_NAME;
    # Enter the information into the database
    NEW_CUSTOMER_RESULT=$($DB "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')");
    echo "Welcome, $CUSTOMER_NAME";
    else echo "Welcome back,$CUSTOMER_NAME";
    fi
    # end of empty name check
    CUSTOMER_ID=$($DB "select customer_id from customers where phone='$CUSTOMER_PHONE'");
    # Create an appointment
    echo "What time would you like your appointment to be?";
    read SERVICE_TIME;
    NEW_APPOINTMENT_RESULT=$($DB "insert into appointments(time, customer_id, service_id) values('$SERVICE_TIME',$CUSTOMER_ID,$SERVICE_ID_SELECTED)");
    echo "I have put you down for a $(echo $SELECTED_SERVICE | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    fi 
    # end of empty service check
    fi 
    # end of int check
}
LIST_SERVICES;