#!/bin/bash
# fonte: https://tecnologiagourmet.wordpress.com/tag/shell-script-calcular-tempo-gasto/
initialTime=$(date +%s)
#
#seu código aqui
#
#

#calculando o tempo execucao
timeOfExecution=$(($(date +%s) - $initialTime))
finalTime=`echo "scale=2; $timeOfExecution " | bc -l`

echo "Tempo de execução: $finalTime segundo(s)"

executionDate=`date +%d/%m/%Y-%H:%M:%S`
echo "Ambientes de homologação atualizados" $executionDate