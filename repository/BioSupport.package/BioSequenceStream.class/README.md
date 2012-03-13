GTSequenceStream enable streaming behavior over biological sequence bases. You may use this class for counting bases in a file without instantiating all of them in memory, like a GTSequence does. For example:

( GTSequenceStream on: 'c:\your_file_with_a_sequence' ) length.
