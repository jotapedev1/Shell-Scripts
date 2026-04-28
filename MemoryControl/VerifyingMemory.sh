#!/bin/bash

totalMemory=$(free | grep -i mem | awk '{ print $2 }')
usedMemory=$(free | grep -i mem | awk '{ print $3 }')
relation=$(bc <<< "scale=2;$usedMemory/$totalMemory * 100" | awk -F. '{ print $1 }')

if [ $relation -gt 50 ]
then
mail -s "Memory Consumption too high!" joaodrive420@gmail.com<<del
The memory consumption is critical. Look: $(free -h | grep -i mem | awk '{ print $3 }')
del
fi
