#!/bin/bash
 
#SBATCH --nodes=2
#SBATCH --ntasks=8
#SBATCH --mem-per-cpu=32G
#SBATCH --time=0-10:00:00
#SBATCH --output=logs/bamCoverage%j.stdout
#SBATCH --mail-user=dane.vassiliadis@petermac.org
#SBATCH --mail-type=END
#SBATCH --job-name="bamCoverage"
#SBATCH --partition=debug

module load deeptools/3.5.0
module load samtools/1.17

bname=`basename $1 .bam`

# use RPCG norm
bamCoverage --bam $1 -o bigwigs/${bname}_RPGC.bw --binSize 10 --smoothLength 20 --normalizeUsing RPGC --effectiveGenomeSize 2736124973 -p max

