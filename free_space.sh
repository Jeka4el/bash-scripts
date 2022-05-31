#!/bin/bash

free_space=$(df / | tail -n1 | tr -s ' ' | cut -d ' ' -f 5 | tr -d %)

if [ $free_space -gt 90 ]
then
logger -t LOGGER 'WARNING - free space left < 90%'
fi
