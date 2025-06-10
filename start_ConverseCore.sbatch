#!/bin/bash
#SBATCH --ntasks-per-node 10
#SBATCH -N 1
#SBATCH -t 03:00:00
#SBATCH --partition sens-gpu
#SBATCH -A csens2024-3-2
#SBATCH -J start_Co
#SBATCH -o start_Co.%j.out
#SBATCH -e start_Co.%j.err

VERSION=1.0

ml ConverseCore/${VERSION}

exit 0
