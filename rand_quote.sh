#!/bin/bash

# Random quote generator

arr_clr=("\033[95m" "\033[97m" "\033[31m" "\033[36m" "\033[37m" "\033[90m" "\033[91m" "\033[92m" "\033[94m" "\033[34m" "\033[39m")
arr_qts=("Confidence is a habit that can be developed by acting as if you already had the confidence you desire to have" 
		"You win when you fall in love with patience"
		"Life shrinks or expands in proportion to one's courage"
		"Your will can move mountains, but your doubt can create them"
		"An ounce of action is worth a ton of theory"
		"The only person you are destined to become is the person you decide to be"
		"Real difficulties can be overcome; it is only the imaginary ones that are unconquerable"
		"If you are not willing to risk the usual you will have to settle for ordinary"
		"Discipline is the bridge between goals and accomplishment"
		"Trust the process. Your time is coming. Just do the work and the results will handle themselves.")
arr_voice=("Alex" "Fiona" "Fred" "Karen" "Samantha" "Tessa" "Victoria" "Daniel" "Veena")


print_n_speak () {
rand=$(( $RANDOM % 10 ))
echo
echo -e "${arr_clr[$(( $RANDOM % 10 ))]}${arr_qts[$rand]}"
echo -e "${arr_clr[10]}"
say -v "${arr_voice[$(( $RANDOM % 10 ))]}" "${arr_qts[$rand]}"
}

print_n_speak 





