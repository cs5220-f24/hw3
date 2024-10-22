#!/bin/bash
#SBATCH --account=m4776
#SBATCH -C gpu
#SBATCH --qos=shared
#SBATCH --time=00:01:00
#SBATCH -N 1
#SBATCH -n 1

srun ./hello_world.x
