accessing-properties
prvBlastProperties

	^ 'ALIGNMENT LENGTH;The Hsp_align-len is an integer value which contains the length of the alignment used. If there are multiple HSPs, this will answer a Number with the one with the highest alignment.;Hsp_align-len;SmallInteger
HIT LENGTH;Length of subject;Hit_len;SmallInteger
HIT DEFINITION;Definition line of subject:  A definition is a mandatory description of the origin and function of a sequence, and is typically found in FASTA descriptions. Although the string line is structured, it does not use a controlled vocabulary. In the BlastOutput XML file it matches with the Hit_def node. Example: H.sapiens CDK2 mRNA.;Hit_def;String
NUMBER OF IDENTITIES IN HSP;A HSP is a High Score Segment Pair. This property specify the number of identities in HSP;Hsp_identity;SmallInteger
NUMBER OF POSITIVES IN HSP;A HSP is a High Score Segment Pair. This property specify the number of positive (conservative) substitutions in the alignment;Hsp_positive;SmallInteger
E-VALUE OF HSP;A HSP is a High Score Segment Pair. This numeric property specify the e-value of HSP;Hsp_evalue;FixedDecimal
SCORE BITS OF HSP;score (in bits) of HSP;Hsp_bit-score;FixedDecimal
SCORE OF HSP;score of HSP;Hsp_score;FixedDecimal
NUMBER OF START OF HSP IN QUERY;A HSP is a High Score Segment Pair. This property specify the offset (number) of query at the start of the alignment (one-offset);Hsp_query-from;SmallInteger
NUMBER OF END OF HSP IN QUERY;A HSP is a High Score Segment Pair. This numeric property specify the end of HSP;Hsp_query-to;SmallInteger
NUMBER OF START OF HSP IN SUBJECT;A HSP is a High Score Segment Pair. This property specify the offset (number) of database sequence at the start of the alignment (one-offset), i.e. start of HSP in subject;Hsp_hit-from;SmallInteger
NUMBER OF END OF HSP IN SUBJECT;A HSP is a High Score Segment Pair. This numeric property specify the end of HSP in subject;Hsp_hit-to;SmallInteger
NUMBER OF SCORE DENSITY;A HSP is a High Score Segment Pair. This numeric property specify the score density;Hsp_density;SmallInteger
NUMBER OF TRANSLATION FRAME OF QUERY;The filter selects translation frame of query;Hsp_query-frame;SmallInteger
NUMBER OF TRANSLATION FRAME OF SUBJECT;tThe filter selects ranslation frame of subject;Hsp_hit-frame;SmallInteger
NUMBER OF GAPS IN HSP;A HSP is a High Score Segment Pair. The filter selects the number of gaps in HSP;Hsp_gaps;SmallInteger
ALIGNMENT STRING FOR THE QUERY (WITH GAPS);The filter selects alignment string for the query (with gaps);Hsp_qseq;String
ALIGNMENT STRING FOR SUBJECT (WITH GAPS);The filter selects alignment string for subject (with gaps);Hsp_hseq;String'