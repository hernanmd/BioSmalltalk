accessing
hits03
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