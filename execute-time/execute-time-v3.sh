#!/bin/bash

#pega a data em segundos
initalTime=`date +%s`
echo init: $initalTime

sleep 5

endTime=`date +%s`
#diferenca do tempo final e inicial do processo
timeOfExecution=$(($endTime - $initalTime))

echo "Tempo de execucao: $timeOfExecution segundos"