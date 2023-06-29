#!/bin/bash
# Toggle Hiding of Desktop Icons on Mac
# Author:  Jonathan Wang
# Created: 5/18/2020

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
