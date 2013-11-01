#!/bin/sh

echo "ATTENTION! This script will DELETE your 'performance' folder if it is present!"
echo "Make sure that you MOVE the folder elsewhere if you want to keep any prototyped work!"
echo
read -p "Are you ready?" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff - delete the performance folder:

    rm -R performance

    # 
    # This essentially says:
    # "Get me everything in and next to https://www.gov.uk/performance/services"
    # "... but IGNORE the Dashboard and Transactions Explorer"
    # 
    # What you should end up with from the wget is a set of .html files which link locally to each other
    # Most or all of css / js / images etc will come from https://gov.uk, so you will STILL NEED a web connection
    # 

    wget --mirror --page-requisites --adjust-extension --no-parent --convert-links --exclude-directories=/performance/transactions-explorer/,/performance/dashboard/ --reject=dashboard,transactions-explorer https://www.gov.uk/performance/services

    echo "Limelight has been grabbed!"

    # 
    # Next up, we're going to move the /performance/ folder into the root
    # 

    echo "Moving files..."
    mv www.gov.uk/performance/ .
    echo "Done."

    # 
    # Then delete the leftover www.gov.uk folder (and robots.txt)
    # 

    echo "Deleting unused files..."
    rm -R www.gov.uk
    echo "Done."
fi