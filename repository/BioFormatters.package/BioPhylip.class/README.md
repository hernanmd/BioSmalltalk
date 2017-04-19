PHYLIP format comes in fourth forms: 

Phylip standard interleaved	.phylipi
Phylip standard sequential	.phylips
Phylip relaxed interleaved	.rphylipi
Phylip relaxed sequential	.rphylips

Phylip relaxed

It is 'relaxed' when a Phylip formatted file sequence names are longer than 10 characters. Relaxed Phylip (sequential and interleaved) will produce the same output as standard Phylip, except that in the relaxed format sequence names are not truncated to 10 characters. Instead, sequence names are left as they are and buffered with whitespaces based on the longest sequence name in the submitted data set. This ensures proper display of the aligned sequences in the interleaved format and consistent sequence name lengths for both interleaved and sequential formats.

Phylip files must begin with a line that looks like:

  78  i

which shows the number of sequences in the file (3), the number of characters in each sequence (78), and then the letter "i" or "s" which indicates "interleaved" or "sequential". The i or s letters are optional.

Standard phylip files have a limitation of 10 characters in the sequence names. For this reason, we also provide relaxed phylip options that will preserve the full length of your sequence names.


Internal Representation and Key Implementation Points.

    Instance Variables
	numberOfCharacters:		<Object>
	numberOfTaxa:		<Object>
	sequences:		<Object>


    Implementation Points