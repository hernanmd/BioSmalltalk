Enables streaming behavior over biological sequence bases. You may use this class for counting bases in a file without instantiating all of them in memory, like a sequence does. For example:

(BioSequenceStream on: 'c:\your_file_with_a_sequence') length.
