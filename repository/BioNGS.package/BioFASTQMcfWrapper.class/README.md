From the web page https://github.com/ExpressionAnalysis/ea-utils/blob/wiki/FastqMcf.md

fastq-mcf attempts to:

    Detect & remove sequencing adapters and primers
    Detect limited skewing at the ends of reads and clip
    Detect poor quality at the ends of reads and clip
    Detect Ns, and remove from ends
    Remove reads with CASAVA 'Y' flag (purity filtering)
    Discard sequences that are too short after all of the above
    Keep multiple mate-reads in sync while doing all of the above
