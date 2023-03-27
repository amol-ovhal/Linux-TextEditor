#!/bin/bash
source function.sh
source logfunction.sh

ACTION=$1

case $ACTION in

addLineTop) addLineTop $2 "$3";;

addLineBottom) addLineBottom $2 "$3";;

addLineAt) addLineAt $2 $3 "$4";;

updateFirstWord) updateFirstWord $2 $3 $4;;

updateAllWord) updateAllWords $2 $3 $4;;

insertWord) insertWord $2 $3 $4 $5;;

deleteLineNumber) deleteLineNumber $2 $3;;

deleteLineWord) deleteLineWord $2 $3;;

*)errorMessage "Choose Valid Options - Bye" 

esac
