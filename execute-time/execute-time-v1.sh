#!/bin/bash
datainicial=`date +%s`

#Coloque aqui o restante do script

datafinal=`date +%s`
soma=`expr $datafinal - $datainicial`
resultado=`expr 10800 + $soma`
tempo=`date -d @$resultado +%H:%M:%S`
echo " Tempo gasto: $tempo "