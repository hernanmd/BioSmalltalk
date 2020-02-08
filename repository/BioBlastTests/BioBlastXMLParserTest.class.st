Class {
	#name : #BioBlastXMLParserTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'result'
	],
	#category : #'BioBlastTests-Core'
}

{ #category : #accessing }
BioBlastXMLParserTest >> hits01 [
	" Several hits with full headers and footers "

	^ '<?xml version="1.0"?>
<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">
<BlastOutput>
  <BlastOutput_program>blastn</BlastOutput_program>
  <BlastOutput_version>BLASTN 2.2.25+</BlastOutput_version>
  <BlastOutput_reference>Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&amp;auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), &quot;Gapped BLAST and PSI-BLAST: a new generation of protein database search programs&quot;, Nucleic Acids Res. 25:3389-3402.</BlastOutput_reference>
  <BlastOutput_db>nr</BlastOutput_db>
  <BlastOutput_query-ID>35927</BlastOutput_query-ID>
  <BlastOutput_query-def>No definition line</BlastOutput_query-def>
  <BlastOutput_query-len>240</BlastOutput_query-len>
  <BlastOutput_param>
    <Parameters>
      <Parameters_expect>10</Parameters_expect>
      <Parameters_sc-match>2</Parameters_sc-match>
      <Parameters_sc-mismatch>-3</Parameters_sc-mismatch>
      <Parameters_gap-open>5</Parameters_gap-open>
      <Parameters_gap-extend>2</Parameters_gap-extend>
      <Parameters_filter>L;m;</Parameters_filter>
    </Parameters>
  </BlastOutput_param>
<BlastOutput_iterations>
<Iteration>
  <Iteration_iter-num>1</Iteration_iter-num>
  <Iteration_query-ID>35927</Iteration_query-ID>
  <Iteration_query-def>No definition line</Iteration_query-def>
  <Iteration_query-len>240</Iteration_query-len>
<Iteration_hits>
<Hit>
  <Hit_num>1</Hit_num>
  <Hit_id>gi|294959984|gb|GU947019.1|</Hit_id>
  <Hit_def>Bos taurus isolate CB86 mitochondrion, complete genome</Hit_def>
  <Hit_accession>GU947019</Hit_accession>
  <Hit_len>16339</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>8.75206e-121</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>16024</Hsp_hit-from>
      <Hsp_hit-to>16263</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>2</Hit_num>
  <Hit_id>gi|311323927|gb|HM626093.1|</Hit_id>
  <Hit_def>Bos taurus breed Jutland breed clone 38 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>HM626093</Hit_accession>
  <Hit_len>789</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>8.75206e-121</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>196</Hsp_hit-from>
      <Hsp_hit-to>435</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>2</Hit_num>
  <Hit_id>gi|311323927|gb|HM626093.1|</Hit_id>
  <Hit_def>Bos taurus breed Jutland breed clone 38 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>HM626093</Hit_accession>
  <Hit_len>789</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>8.75206e-121</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>196</Hsp_hit-from>
      <Hsp_hit-to>435</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>99</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
</Iteration_hits>
  <Iteration_stat>
    <Statistics>
      <Statistics_db-num>55822</Statistics_db-num>
      <Statistics_db-len>197147896</Statistics_db-len>
      <Statistics_hsp-len>0</Statistics_hsp-len>
      <Statistics_eff-space>0</Statistics_eff-space>
      <Statistics_kappa>0.41</Statistics_kappa>
      <Statistics_lambda>0.625</Statistics_lambda>
      <Statistics_entropy>0.78</Statistics_entropy>
    </Statistics>
  </Iteration_stat>
</Iteration>
</BlastOutput_iterations>
</BlastOutput>'
]

{ #category : #accessing }
BioBlastXMLParserTest >> hits03 [
	" One hit with full headers and footers "

	^ '<?xml version="1.0"?>
<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">
<BlastOutput>
  <BlastOutput_program>blastn</BlastOutput_program>
  <BlastOutput_version>BLASTN 2.2.25+</BlastOutput_version>
  <BlastOutput_reference>Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&amp;auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), &quot;Gapped BLAST and PSI-BLAST: a new generation of protein database search programs&quot;, Nucleic Acids Res. 25:3389-3402.</BlastOutput_reference>
  <BlastOutput_db>nr</BlastOutput_db>
  <BlastOutput_query-ID>18205</BlastOutput_query-ID>
  <BlastOutput_query-def>No definition line</BlastOutput_query-def>
  <BlastOutput_query-len>358</BlastOutput_query-len>
  <BlastOutput_param>
    <Parameters>
      <Parameters_expect>10</Parameters_expect>
      <Parameters_sc-match>2</Parameters_sc-match>
      <Parameters_sc-mismatch>-3</Parameters_sc-mismatch>
      <Parameters_gap-open>5</Parameters_gap-open>
      <Parameters_gap-extend>2</Parameters_gap-extend>
      <Parameters_filter>L;m;m;</Parameters_filter>
    </Parameters>
  </BlastOutput_param>
<BlastOutput_iterations>
<Iteration>
  <Iteration_iter-num>1</Iteration_iter-num>
  <Iteration_query-ID>18205</Iteration_query-ID>
  <Iteration_query-def>No definition line</Iteration_query-def>
  <Iteration_query-len>358</Iteration_query-len>
<Iteration_hits>
<Hit>
  <Hit_num>1</Hit_num>
  <Hit_id>gi|306977463|gb|HQ184044.1|</Hit_id>
  <Hit_def>Bos taurus isolate Rom600 mitochondrion, complete genome</Hit_def>
  <Hit_accession>HQ184044</Hit_accession>
  <Hit_len>16342</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>646.892</Hsp_bit-score>
      <Hsp_score>716</Hsp_score>
      <Hsp_evalue>0</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>358</Hsp_query-to>
      <Hsp_hit-from>14586</Hsp_hit-from>
      <Hsp_hit-to>14943</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>358</Hsp_identity>
      <Hsp_positive>358</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>358</Hsp_align-len>
      <Hsp_qseq>CCATCAAACATTTCATCATGATGAAATTTCGGTTCCCTCCTAGGAATCTGCCTAATCCTACAAATCCTCACAGGCCTATTCCTAGCAATACACTACACATCCGACACAACAACAGCATTCTCCTCTGTTACCCATATCTGCCGAGACGTGAACTACGGCTGAATCATCCGATACATACACGCAAACGGAGCTTCAATGTTTTTTATCTGCTTATATATGCACGTAGGACGAGGCTTATATTATGGGTCTTACACTTTTCTAGAAACATGAAATATTGGAGTAATCCTTCTGCTCACAGTAATAGCCACAGCATTTATAGGATATGTCCTACCATGAGGACAAATATCATTCTGAGGAG</Hsp_qseq>
      <Hsp_hseq>CCATCAAACATTTCATCATGATGAAATTTCGGTTCCCTCCTAGGAATCTGCCTAATCCTACAAATCCTCACAGGCCTATTCCTAGCAATACACTACACATCCGACACAACAACAGCATTCTCCTCTGTTACCCATATCTGCCGAGACGTGAACTACGGCTGAATCATCCGATACATACACGCAAACGGAGCTTCAATGTTTTTTATCTGCTTATATATGCACGTAGGACGAGGCTTATATTATGGGTCTTACACTTTTCTAGAAACATGAAATATTGGAGTAATCCTTCTGCTCACAGTAATAGCCACAGCATTTATAGGATATGTCCTACCATGAGGACAAATATCATTCTGAGGAG</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
</Iteration_hits>
  <Iteration_stat>
    <Statistics>
      <Statistics_db-num>15156680</Statistics_db-num>
      <Statistics_db-len>1341397761</Statistics_db-len>
      <Statistics_hsp-len>0</Statistics_hsp-len>
      <Statistics_eff-space>0</Statistics_eff-space>
      <Statistics_kappa>0.41</Statistics_kappa>
      <Statistics_lambda>0.625</Statistics_lambda>
      <Statistics_entropy>0.78</Statistics_entropy>
    </Statistics>
  </Iteration_stat>
</Iteration>
</BlastOutput_iterations>
</BlastOutput>'
]

{ #category : #accessing }
BioBlastXMLParserTest >> hits04 [
	" One hit with 2 HSPs "
	
	^ '<?xml version="1.0"?>
<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">
<BlastOutput>
  <BlastOutput_program>blastn</BlastOutput_program>
  <BlastOutput_version>BLASTN 2.2.25+</BlastOutput_version>
  <BlastOutput_reference>Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&amp;auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), &quot;Gapped BLAST and PSI-BLAST: a new generation of protein database search programs&quot;, Nucleic Acids Res. 25:3389-3402.</BlastOutput_reference>
  <BlastOutput_db>nr</BlastOutput_db>
  <BlastOutput_query-ID>18205</BlastOutput_query-ID>
  <BlastOutput_query-def>No definition line</BlastOutput_query-def>
  <BlastOutput_query-len>358</BlastOutput_query-len>
  <BlastOutput_param>
    <Parameters>
      <Parameters_expect>10</Parameters_expect>
      <Parameters_sc-match>2</Parameters_sc-match>
      <Parameters_sc-mismatch>-3</Parameters_sc-mismatch>
      <Parameters_gap-open>5</Parameters_gap-open>
      <Parameters_gap-extend>2</Parameters_gap-extend>
      <Parameters_filter>L;m;m;</Parameters_filter>
    </Parameters>
  </BlastOutput_param>
<BlastOutput_iterations>
<Iteration>
  <Iteration_iter-num>1</Iteration_iter-num>
  <Iteration_query-ID>18205</Iteration_query-ID>
  <Iteration_query-def>No definition line</Iteration_query-def>
  <Iteration_query-len>358</Iteration_query-len>
<Iteration_hits>
<Hit>
  <Hit_num>4340</Hit_num>
  <Hit_id>gi|4097247|gb|U50941.1|BTU50941</Hit_id>
  <Hit_def>Bos taurus mitochondrial D-loop DNA</Hit_def>
  <Hit_accession>U50941</Hit_accession>
  <Hit_len>213</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>210.477</Hsp_bit-score>
      <Hsp_score>232</Hsp_score>
      <Hsp_evalue>1.81032e-53</Hsp_evalue>
      <Hsp_query-from>20</Hsp_query-from>
      <Hsp_query-to>135</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>116</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>116</Hsp_identity>
      <Hsp_positive>116</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>116</Hsp_align-len>
      <Hsp_qseq>TACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGA</Hsp_qseq>
      <Hsp_hseq>TACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
    <Hsp>
      <Hsp_num>2</Hsp_num>
      <Hsp_bit-score>64.4042</Hsp_bit-score>
      <Hsp_score>70</Hsp_score>
      <Hsp_evalue>1.69852e-09</Hsp_evalue>
      <Hsp_query-from>206</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>116</Hsp_hit-from>
      <Hsp_hit-to>150</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>35</Hsp_identity>
      <Hsp_positive>35</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>35</Hsp_align-len>
      <Hsp_qseq>AAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>AAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
</Iteration_hits>
  <Iteration_stat>
    <Statistics>
      <Statistics_db-num>15156680</Statistics_db-num>
      <Statistics_db-len>1341397761</Statistics_db-len>
      <Statistics_hsp-len>0</Statistics_hsp-len>
      <Statistics_eff-space>0</Statistics_eff-space>
      <Statistics_kappa>0.41</Statistics_kappa>
      <Statistics_lambda>0.625</Statistics_lambda>
      <Statistics_entropy>0.78</Statistics_entropy>
    </Statistics>
  </Iteration_stat>
</Iteration>
</BlastOutput_iterations>
</BlastOutput>'
]

{ #category : #accessing }
BioBlastXMLParserTest >> hits05 [
	" Several hits with full headers and footers "

	^ '<?xml version="1.0"?>
<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">
<BlastOutput>
  <BlastOutput_program>blastn</BlastOutput_program>
  <BlastOutput_version>BLASTN 2.2.25+</BlastOutput_version>
  <BlastOutput_reference>Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&amp;auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), &quot;Gapped BLAST and PSI-BLAST: a new generation of protein database search programs&quot;, Nucleic Acids Res. 25:3389-3402.</BlastOutput_reference>
  <BlastOutput_db>nr</BlastOutput_db>
  <BlastOutput_query-ID>35927</BlastOutput_query-ID>
  <BlastOutput_query-def>No definition line</BlastOutput_query-def>
  <BlastOutput_query-len>240</BlastOutput_query-len>
  <BlastOutput_param>
    <Parameters>
      <Parameters_expect>10</Parameters_expect>
      <Parameters_sc-match>2</Parameters_sc-match>
      <Parameters_sc-mismatch>-3</Parameters_sc-mismatch>
      <Parameters_gap-open>5</Parameters_gap-open>
      <Parameters_gap-extend>2</Parameters_gap-extend>
      <Parameters_filter>L;m;</Parameters_filter>
    </Parameters>
  </BlastOutput_param>
<BlastOutput_iterations>
<Iteration>
  <Iteration_iter-num>1</Iteration_iter-num>
  <Iteration_query-ID>35927</Iteration_query-ID>
  <Iteration_query-def>No definition line</Iteration_query-def>
  <Iteration_query-len>240</Iteration_query-len>
<Iteration_hits>
<Hit>
  <Hit_num>1</Hit_num>
  <Hit_id>gi|294959984|gb|GU947019.1|</Hit_id>
  <Hit_def>Bos taurus isolate CB86 mitochondrion, complete genome</Hit_def>
  <Hit_accession>GU947019</Hit_accession>
  <Hit_len>16339</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>8.75206e-121</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>16024</Hsp_hit-from>
      <Hsp_hit-to>16263</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>2</Hit_num>
  <Hit_id>gi|311323927|gb|HM626093.1|</Hit_id>
  <Hit_def>Bos taurus breed Jutland breed clone 38 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>HM626093</Hit_accession>
  <Hit_len>789</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>8.75206e-121</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>196</Hsp_hit-from>
      <Hsp_hit-to>435</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
</Iteration_hits>
  <Iteration_stat>
    <Statistics>
      <Statistics_db-num>55822</Statistics_db-num>
      <Statistics_db-len>197147896</Statistics_db-len>
      <Statistics_hsp-len>0</Statistics_hsp-len>
      <Statistics_eff-space>0</Statistics_eff-space>
      <Statistics_kappa>0.41</Statistics_kappa>
      <Statistics_lambda>0.625</Statistics_lambda>
      <Statistics_entropy>0.78</Statistics_entropy>
    </Statistics>
  </Iteration_stat>
</Iteration>
</BlastOutput_iterations>
</BlastOutput>'
]

{ #category : #accessing }
BioBlastXMLParserTest >> hits06 [
	" Several hits with 2 HSPs "

	^ '<?xml version="1.0"?>
<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">
<BlastOutput>
  <BlastOutput_program>blastn</BlastOutput_program>
  <BlastOutput_version>BLASTN 2.2.25+</BlastOutput_version>
  <BlastOutput_reference>Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&amp;auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), &quot;Gapped BLAST and PSI-BLAST: a new generation of protein database search programs&quot;, Nucleic Acids Res. 25:3389-3402.</BlastOutput_reference>
  <BlastOutput_db>nr</BlastOutput_db>
  <BlastOutput_query-ID>35927</BlastOutput_query-ID>
  <BlastOutput_query-def>No definition line</BlastOutput_query-def>
  <BlastOutput_query-len>240</BlastOutput_query-len>
  <BlastOutput_param>
    <Parameters>
      <Parameters_expect>10</Parameters_expect>
      <Parameters_sc-match>2</Parameters_sc-match>
      <Parameters_sc-mismatch>-3</Parameters_sc-mismatch>
      <Parameters_gap-open>5</Parameters_gap-open>
      <Parameters_gap-extend>2</Parameters_gap-extend>
      <Parameters_filter>L;m;</Parameters_filter>
    </Parameters>
  </BlastOutput_param>
<BlastOutput_iterations>
<Iteration>
  <Iteration_iter-num>1</Iteration_iter-num>
  <Iteration_query-ID>35927</Iteration_query-ID>
  <Iteration_query-def>No definition line</Iteration_query-def>
  <Iteration_query-len>240</Iteration_query-len>
<Iteration_hits>
<Hit>
  <Hit_num>4340</Hit_num>
  <Hit_id>gi|4097247|gb|U50941.1|BTU50941</Hit_id>
  <Hit_def>Bos taurus mitochondrial D-loop DNA</Hit_def>
  <Hit_accession>U50941</Hit_accession>
  <Hit_len>213</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>210.477</Hsp_bit-score>
      <Hsp_score>232</Hsp_score>
      <Hsp_evalue>1.81032e-53</Hsp_evalue>
      <Hsp_query-from>20</Hsp_query-from>
      <Hsp_query-to>135</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>116</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>116</Hsp_identity>
      <Hsp_positive>116</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>116</Hsp_align-len>
      <Hsp_qseq>TACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGA</Hsp_qseq>
      <Hsp_hseq>TACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
    <Hsp>
      <Hsp_num>2</Hsp_num>
      <Hsp_bit-score>64.4042</Hsp_bit-score>
      <Hsp_score>70</Hsp_score>
      <Hsp_evalue>1.69852e-09</Hsp_evalue>
      <Hsp_query-from>206</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>116</Hsp_hit-from>
      <Hsp_hit-to>150</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>35</Hsp_identity>
      <Hsp_positive>35</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>35</Hsp_align-len>
      <Hsp_qseq>AAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>AAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>2</Hit_num>
  <Hit_id>gi|311323927|gb|HM626093.1|</Hit_id>
  <Hit_def>Bos taurus breed Jutland breed clone 38 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>HM626093</Hit_accession>
  <Hit_len>789</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>8.75206e-121</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>196</Hsp_hit-from>
      <Hsp_hit-to>435</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
</Iteration_hits>
  <Iteration_stat>
    <Statistics>
      <Statistics_db-num>55822</Statistics_db-num>
      <Statistics_db-len>197147896</Statistics_db-len>
      <Statistics_hsp-len>0</Statistics_hsp-len>
      <Statistics_eff-space>0</Statistics_eff-space>
      <Statistics_kappa>0.41</Statistics_kappa>
      <Statistics_lambda>0.625</Statistics_lambda>
      <Statistics_entropy>0.78</Statistics_entropy>
    </Statistics>
  </Iteration_stat>
</Iteration>
</BlastOutput_iterations>
</BlastOutput>'
]

{ #category : #accessing }
BioBlastXMLParserTest >> parserClass [

	^ BioParser
]

{ #category : #accessing }
BioBlastXMLParserTest >> saxParseBlastNodes: hitsSelector [

	result := self parserClass saxParseNcbiXmlBlastNodes: (self perform: hitsSelector)
	
]

{ #category : #accessing }
BioBlastXMLParserTest >> saxTokenizeBlastNodes: hitsSelector [

	result := self parserClass saxTokenizeNcbiXmlBlastNodes: (self perform: hitsSelector)
	
]

{ #category : #testing }
BioBlastXMLParserTest >> test01ParsingNodes [

	self saxParseBlastNodes: #hits03.						
	self assert: ( result isKindOf: BioBlastRootNode ).
	self assert: result nodes isCollection.
	self deny: result isEmpty.
	self assert: result size = 1.
	
	self assert: result hits isCollection.
	self deny: result hits isEmpty.
	self assert: ( result hits allSatisfy: #isHitNode ).
	
]

{ #category : #testing }
BioBlastXMLParserTest >> test01QueryingNodes [

	| filterResult theHsps theHsp |
	
	self saxParseBlastNodes: #hits01.
	filterResult := result hspAlignLengths: [ : node | node blastValue > 100 ].
	
	self assert: filterResult isCollection.
	self deny: filterResult isEmpty.
	self assert: filterResult size equals: 2.

	theHsps := filterResult first hitHsps.
	theHsp := theHsps nodes first.
	self assert: theHsp hspAlignLength blastValue equals: 240.
	self should: [ theHsps nodes second ] raise: Error.

	theHsps := filterResult second hitHsps.
	theHsp := theHsps nodes first.
	self assert: theHsp hspAlignLength blastValue equals: 240.
	self should: [ theHsps nodes second ] raise: Error.

]

{ #category : #testing }
BioBlastXMLParserTest >> test01SelectingNodes [

	| queryRs |
	
	self saxParseBlastNodes: #hits01.
	queryRs := result hspAlignLengths.
	
	self assert: queryRs isCollection.
	self deny: queryRs isEmpty.
	self assert: queryRs size equals: 3.
	self assert: queryRs first blastValue equals: 240.
	self assert: queryRs second blastValue equals: 240.
	self assert: queryRs third blastValue equals: 99.
]

{ #category : #testing }
BioBlastXMLParserTest >> test01TokenizeHeaders [
	self tokenizeBlastHeaderNodes: (self perform: #hits04).
	self assert: (result isKindOf: OrderPreservingDictionary).
	self assert: (result includesKey: 'BlastOutput_db').
	self assert: (result includesKey: 'BlastOutput_query-ID').
	self assert: (result includesKey: 'BlastOutput_query-def').
	self assert: (result includesKey: 'BlastOutput_version').
	self assert: (result includesKey: 'BlastOutput_reference').
	self assert: (result includesKey: 'Parameters_gap-open').
	self assert: (result includesKey: 'Parameters_filter').
	self assert: (result includesKey: 'Parameters_gap-extend').
	self assert: (result includesKey: 'Parameters_sc-mismatch').
	self assert: (result includesKey: 'Parameters_sc-match').
	self assert: (result includesKey: 'Parameters_expect').
	self assert: (result includesKey: 'BlastOutput_query-len').
	self assert: (result includesKey: 'BlastOutput_program').
	self assert: (result at: 'BlastOutput_db') equals: 'nr'.
	self assert: (result at: 'BlastOutput_query-ID') equals: '18205'.
	self
		assert: (result at: 'BlastOutput_query-def')
		equals: 'No definition line'.
	self
		assert: (result at: 'BlastOutput_version')
		equals: 'BLASTN 2.2.25+'.
	self
		assert: (result at: 'BlastOutput_reference')
		equals:
			'Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), "Gapped BLAST and PSI-BLAST: a new generation of protein database search programs", Nucleic Acids Res. 25:3389-3402.'.
	self assert: (result at: 'Parameters_gap-open') equals: '5'.
	self assert: (result at: 'Parameters_filter') equals: 'L;m;m;'.
	self assert: (result at: 'Parameters_gap-extend') equals: '2'.
	self assert: (result at: 'Parameters_sc-mismatch') equals: '-3'.
	self assert: (result at: 'Parameters_sc-match') equals: '2'.
	self assert: (result at: 'Parameters_expect') equals: '10'.
	self assert: (result at: 'BlastOutput_query-len') equals: '358'.
	self assert: (result at: 'BlastOutput_program') equals: 'blastn'
]

{ #category : #testing }
BioBlastXMLParserTest >> test01TokenizeNodes [

	self saxTokenizeBlastNodes: #hits01.						
	self assert: (result isKindOf: OrderedCollection).
	self deny: result isEmpty.
	self assert: result first equals: 'blastn'.
	self assert: (result at: 2) equals: '1'.	
	self assert: result size equals: 68.
	self assert: (result at: 25) equals: '2'.
	
]

{ #category : #testing }
BioBlastXMLParserTest >> test03ParsingNodes [

	| theHit theHsp |

	self saxParseBlastNodes: #hits03.						
	self assert: (result isKindOf: BioBlastRootNode).
	self assert: result nodes isCollection.
	self assert: result nodes size equals: 1.
	self assert: result nodes size equals: result size.
	
	self assert: result hits isCollection.
	self deny: result hits isEmpty.
	self assert: result hits size equals: 1.
	
	theHit := result hits anyOne.
	self assert: theHit hitIdentifier blastValue equals: 'gi|306977463|gb|HQ184044.1|' asLowercase.
	self assert: theHit hitDefinition blastValue equals: 'Bos taurus isolate Rom600 mitochondrion, complete genome' asLowercase.
	self assert: theHit hitAccession blastValue equals: 'HQ184044' asLowercase.
	self assert: theHit hitLength blastValue equals: 16342.
	self assert: (theHit hitHsps isKindOf: BioBlastParentNode).
	self assert: theHit hitHsps size equals: 1.
	
	theHsp := theHit hitHsps nodes anyOne.
	self assert: theHsp hspBitScore blastValue equals: 646.892.
	self assert: theHsp hspScore blastValue equals: 716.
	self assert: theHsp hspEValue blastValue equals: 0.
	self assert: theHsp hspQueryFrom blastValue equals: 1.
	self assert: theHsp hspQueryTo blastValue equals: 358.	
	self assert: theHsp hspHitFrom blastValue equals: 14586.
	self assert: theHsp hspHitTo blastValue equals: 14943.
	self assert: theHsp hspQueryFrame blastValue equals: 1.
	self assert: theHsp hspHitFrame blastValue equals: 1.
	self assert: theHsp hspIdentity blastValue equals: 358.
	self assert: theHsp hspPositive blastValue equals: 358.
	self assert: theHsp hspGaps blastValue equals: 0.
	self assert: theHsp hspAlignLength blastValue equals: 358.
	self assert: theHsp hspQSeq blastValue equals: 'CCATCAAACATTTCATCATGATGAAATTTCGGTTCCCTCCTAGGAATCTGCCTAATCCTACAAATCCTCACAGGCCTATTCCTAGCAATACACTACACATCCGACACAACAACAGCATTCTCCTCTGTTACCCATATCTGCCGAGACGTGAACTACGGCTGAATCATCCGATACATACACGCAAACGGAGCTTCAATGTTTTTTATCTGCTTATATATGCACGTAGGACGAGGCTTATATTATGGGTCTTACACTTTTCTAGAAACATGAAATATTGGAGTAATCCTTCTGCTCACAGTAATAGCCACAGCATTTATAGGATATGTCCTACCATGAGGACAAATATCATTCTGAGGAG' asLowercase.
	self assert: theHsp hspHSeq blastValue equals: 'CCATCAAACATTTCATCATGATGAAATTTCGGTTCCCTCCTAGGAATCTGCCTAATCCTACAAATCCTCACAGGCCTATTCCTAGCAATACACTACACATCCGACACAACAACAGCATTCTCCTCTGTTACCCATATCTGCCGAGACGTGAACTACGGCTGAATCATCCGATACATACACGCAAACGGAGCTTCAATGTTTTTTATCTGCTTATATATGCACGTAGGACGAGGCTTATATTATGGGTCTTACACTTTTCTAGAAACATGAAATATTGGAGTAATCCTTCTGCTCACAGTAATAGCCACAGCATTTATAGGATATGTCCTACCATGAGGACAAATATCATTCTGAGGAG' asLowercase.
	self assert: theHsp hspMidLine blastValue equals: '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'.
	
]

{ #category : #testing }
BioBlastXMLParserTest >> test04ParsingNodes [

	| theHit firstHsp secondHsp |

	self saxParseBlastNodes: #hits04.						
	self assert: (result isKindOf: BioBlastRootNode).
	self assert: result nodes isCollection.
	self assert: result nodes size = 1.
	self assert: result nodes size = result size.
	
	self assert: result hits isCollection.
	self deny: result hits isEmpty.
	self assert: result hits size = 1.
	
	theHit := result hits anyOne.
	self assert: theHit hitIdentifier blastValue = 'gi|4097247|gb|U50941.1|BTU50941' asLowercase.
	self assert: theHit hitDefinition blastValue = 'Bos taurus mitochondrial D-loop DNA' asLowercase.
	self assert: theHit hitAccession blastValue = 'U50941' asLowercase.
	self assert: theHit hitLength blastValue = 213.
	self assert: (theHit hitHsps isKindOf: BioBlastParentNode).
	self assert: theHit hitHsps size = 2.
	
	firstHsp := theHit hitHsps nodes first.
	self assert: firstHsp hspBitScore blastValue = 210.477.
	self assert: firstHsp hspScore blastValue = 232.
	self assert: firstHsp hspEValue blastValue = 1.81032e-53.
	self assert: firstHsp hspQueryFrom blastValue = 20.
	self assert: firstHsp hspQueryTo blastValue = 135.	
	self assert: firstHsp hspHitFrom blastValue = 1.
	self assert: firstHsp hspHitTo blastValue = 116.
	self assert: firstHsp hspQueryFrame blastValue = 1.
	self assert: firstHsp hspHitFrame blastValue = 1.
	self assert: firstHsp hspIdentity blastValue = 116.
	self assert: firstHsp hspPositive blastValue = 116.
	self assert: firstHsp hspGaps blastValue = 0.
	self assert: firstHsp hspAlignLength blastValue = 116.
	self assert: firstHsp hspQSeq blastValue = 'TACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGA' asLowercase.
	self assert: firstHsp hspHSeq blastValue = 'TACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGA' asLowercase.
	self assert: firstHsp hspMidLine blastValue = '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'.

	secondHsp := theHit hitHsps nodes second.
	self assert: secondHsp hspBitScore blastValue = 64.4042.
	self assert: secondHsp hspScore blastValue = 70.
	self assert: secondHsp hspEValue blastValue = 1.69852e-09.
	self assert: secondHsp hspQueryFrom blastValue = 206.
	self assert: secondHsp hspQueryTo blastValue = 240.	
	self assert: secondHsp hspHitFrom blastValue = 116.
	self assert: secondHsp hspHitTo blastValue = 150.
	self assert: secondHsp hspQueryFrame blastValue = 1.
	self assert: secondHsp hspHitFrame blastValue = 1.
	self assert: secondHsp hspIdentity blastValue = 35.
	self assert: secondHsp hspPositive blastValue = 35.
	self assert: secondHsp hspGaps blastValue = 0.
	self assert: secondHsp hspAlignLength blastValue = 35.
	self assert: secondHsp hspQSeq blastValue = 'AAACCGTGGGGGTCGCTATCCAATGAATTTTACCA' asLowercase.
	self assert: secondHsp hspHSeq blastValue = 'AAACCGTGGGGGTCGCTATCCAATGAATTTTACCA' asLowercase.
	self assert: secondHsp hspMidLine blastValue = '|||||||||||||||||||||||||||||||||||'.
	
]

{ #category : #testing }
BioBlastXMLParserTest >> test05ParsingNodes [

	| firstHit secondHit theHsp |

	self saxParseBlastNodes: #hits05.						
	self assert: (result isKindOf: BioBlastRootNode).
	self assert: result nodes isCollection.
	self assert: result nodes size = 2.
	self assert: result nodes size = result size.
	
	self assert: result hits isCollection.
	self deny: result hits isEmpty.
	self assert: result hits size = 2.
	
	firstHit := result hits first.
	self assert: firstHit hitIdentifier blastValue = 'gi|294959984|gb|GU947019.1|' asLowercase.
	self assert: firstHit hitDefinition blastValue = 'Bos taurus isolate CB86 mitochondrion, complete genome' asLowercase.
	self assert: firstHit hitAccession blastValue = 'GU947019' asLowercase.
	self assert: firstHit hitLength blastValue = 16339.
	self assert: (firstHit hitHsps isKindOf: BioBlastParentNode).
	self assert: firstHit hitHsps size = 1.
	
	theHsp := firstHit hitHsps nodes first.
	self assert: theHsp hspBitScore blastValue = 434.095.
	self assert: theHsp hspScore blastValue = 480.
	self assert: theHsp hspEValue blastValue = 8.75206e-121.
	self assert: theHsp hspQueryFrom blastValue = 1.
	self assert: theHsp hspQueryTo blastValue = 240.	
	self assert: theHsp hspHitFrom blastValue = 16024.
	self assert: theHsp hspHitTo blastValue = 16263.
	self assert: theHsp hspQueryFrame blastValue = 1.
	self assert: theHsp hspHitFrame blastValue = 1.
	self assert: theHsp hspIdentity blastValue = 240.
	self assert: theHsp hspPositive blastValue = 240.
	self assert: theHsp hspGaps blastValue = 0.
	self assert: theHsp hspAlignLength blastValue = 240.
	self assert: theHsp hspQSeq blastValue = 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA' asLowercase.
	self assert: theHsp hspHSeq blastValue = 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA' asLowercase.
	self assert: theHsp hspMidLine blastValue = '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'.

	secondHit := result hits second.
	self assert: secondHit hitIdentifier blastValue = 'gi|311323927|gb|HM626093.1|' asLowercase.
	self assert: secondHit hitDefinition blastValue = 'Bos taurus breed Jutland breed clone 38 D-loop, partial sequence; mitochondrial' asLowercase.
	self assert: secondHit hitAccession blastValue = 'HM626093' asLowercase.
	self assert: secondHit hitLength blastValue = 789.
	self assert: (secondHit hitHsps isKindOf: BioBlastParentNode).
	self assert: secondHit hitHsps size = 1.
	
	theHsp := secondHit hitHsps nodes first.
	self assert: theHsp hspBitScore blastValue = 434.095.
	self assert: theHsp hspScore blastValue = 480.
	self assert: theHsp hspEValue blastValue = 8.75206e-121.
	self assert: theHsp hspQueryFrom blastValue = 1.
	self assert: theHsp hspQueryTo blastValue = 240.	
	self assert: theHsp hspHitFrom blastValue = 196.
	self assert: theHsp hspHitTo blastValue = 435.
	self assert: theHsp hspQueryFrame blastValue = 1.
	self assert: theHsp hspHitFrame blastValue = 1.
	self assert: theHsp hspIdentity blastValue = 240.
	self assert: theHsp hspPositive blastValue = 240.
	self assert: theHsp hspGaps blastValue = 0.
	self assert: theHsp hspAlignLength blastValue = 240.
	self assert: theHsp hspQSeq blastValue = 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA' asLowercase.
	self assert: theHsp hspHSeq blastValue = 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA' asLowercase.
	self assert: theHsp hspMidLine blastValue = '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'.
	
]

{ #category : #accessing }
BioBlastXMLParserTest >> tokenizeBlastHeaderNodes: aString [

	result := self parserClass tokenizeNcbiXmlBlastHeader: aString.

]
