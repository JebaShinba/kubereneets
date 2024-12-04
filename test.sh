#!/bin/bash
time=$(date +%H)
if [ $time -lt 12 ]; then
    message="Good Morning User"
elif [ $time -lt 18 ]; then
    message="Good Afternoon User"
else
    message= "Good Evening User"
fi
echo "$message"   hi hello 

#!/bin/bash

time=$(date +%H) # Get the current hour
if [ $time -lt 12 ]; then # Add a space before the closing square bracket
    message="Good Morning User" # No spaces around the equals sign
elif [ $time -lt 18 ]; then # Add a space before the closing square bracket
    message="Good Afternoon User" # No spaces around the equals sign
else
    message="Good Evening User" # No spaces around the equals sign
fi

echo "$message"
