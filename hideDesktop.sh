#!/bin/bash

currentState=`defaults read com.apple.finder CreateDesktop`

if [[ $currentState == "false" ]];
then
    echo "Showing Desktop"
    defaults write com.apple.finder CreateDesktop true
else
    echo "Hiding Desktop"
   defaults write com.apple.finder CreateDesktop false
fi

killall Finder
