accessing
hits04
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