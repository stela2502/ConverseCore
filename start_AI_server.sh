#!/bin/bash

SCRIPT=$(readlink -f $0)
SANDBOX_PATH=$(dirname $SCRIPT)

if squeue --format="%.18i %.9P %.8j %.8u %.2t %.10M %.6D %.6C %R" | grep -q "start_Co"; then
    #echo "there is a working server"
    SERVER_PID=$(squeue --format="%.18i %.9P %.8j %.8u %.2t %.10M %.6D %.6C %R" | grep "start_Co" | awk '{print $1}')
    latest_err_file=$(ls -t ${SANDBOX_PATH}/*${SERVER_PID}.err 2>/dev/null | head -n1)
    if [ ! -f ${latest_err_file} ]; then 
        echo "Server is scheduled, but has not started - check again later - please."
        exit 1
    fi
    #echo "last err file: ${latest_err_file}"
    echo "the AI server is running (${SERVER_PID}) here:"
    grep "Running on" ${latest_err_file} | tail -n1
else
    echo "starting the server"
    { cd ${SANDBOX_PATH}; sbatch start_ConverseCore.sbatch; }
    echo "After the batch process is started you can re-run this script to obtain the connection info"
fi
