#!/bin/bash 
#Created - Rafael Costa
#Date - 23/05/2020

FILE=test.zip
TEMP_DIR=tmp
DESTINATION_DIR=destination

INITIAL_TIME=0
END_TIME=0
TIME_OF_EXECUTION=0

main (){
    
    #testing unzip and move method
    echo -e "\nMOVENDO"
    INITIAL_TIME=`date +%s`
    for i in `seq 1 15`
    do 
        moveFiles
    done
    # calculando tempo de execucao
    calculate_time_execute

    #testing copy method
    echo -e "\nCOPIANDO"
    INITIAL_TIME=`date +%s`
    unzip -q ./$FILE -d ./$TEMP_DIR/
    for i in `seq 1 15`
    do 
        copyFiles
    done
    # calculando tempo de execucao
    calculate_time_execute
}

function calculate_time_execute(){
    END_TIME=`date +%s`
    TIME_OF_EXECUTION=$(($END_TIME - $INITIAL_TIME))
    echo -e "Tempo de execucao: $TIME_OF_EXECUTION segundos"
}

function moveFiles(){

    #echo "limpando o diretorio temporario"
    rm -rf ./$TEMP_DIR/*

    #echo "limpando o diretorio de destino"
    rm -rf ./$DESTINATION_DIR/*

    #echo "descompactando os arquivos na pasta temporaria"
    unzip -q ./$FILE -d ./$TEMP_DIR/

    #echo "movendo arquivos da pasta temporaria para o pasta de destino"
    mv ./$TEMP_DIR/* ./$DESTINATION_DIR/
}

function copyFiles(){

    #echo "limpando o diretorio de destino"
    rm -rf ./$DESTINATION_DIR/*

    #echo "movendo arquivos da pasta temporaria para o pasta de destino"
    cp -R ./$TEMP_DIR/* ./$DESTINATION_DIR/
}

main