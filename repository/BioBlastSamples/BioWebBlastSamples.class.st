"
Contains sample output from the NCBI WWW QBlast server

To import a new sample use the LibraryImporter this way

LDTextLibraryImporter named: #GTWWWBlastSamples

and browse to the directory where the output is located.

"
Class {
	#name : #BioWebBlastSamples,
	#superclass : #BioSamples,
	#category : #'BioBlastSamples-Core'
}

{ #category : #compiling }
BioWebBlastSamples class >> acceptsLoggingOfCompilation [
	^ true
]

{ #category : #examples }
BioWebBlastSamples >> blastResultsSample01 [

	^ BioNCBIBlastReader new
		results: '1FNVBPN501S-Alignment.xml' asFileReference;
		hitNodes
]

{ #category : #examples }
BioWebBlastSamples >> blastResultsSample02 [

	^ '<?xml version="1.0"?>
<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">
<BlastOutput>
  <BlastOutput_program>blastn</BlastOutput_program>
  <BlastOutput_version>BLASTN 2.2.23+</BlastOutput_version>
  <BlastOutput_reference>Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&amp;auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), &quot;Gapped BLAST and PSI-BLAST: a new generation of protein database search programs&quot;, Nucleic Acids Res. 25:3389-3402.</BlastOutput_reference>
  <BlastOutput_db>nr</BlastOutput_db>
  <BlastOutput_query-ID>47837</BlastOutput_query-ID>
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
  <Iteration_query-ID>47837</Iteration_query-ID>
  <Iteration_query-def>No definition line</Iteration_query-def>
  <Iteration_query-len>240</Iteration_query-len>
<Iteration_hits>
<Hit>
  <Hit_num>1</Hit_num>
  <Hit_id>gi|256041716|gb|FJ815972.1|</Hit_id>
  <Hit_def>Bos taurus isolate AHE24 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ815972</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>2</Hit_num>
  <Hit_id>gi|256041695|gb|FJ815951.1|</Hit_id>
  <Hit_def>Bos taurus isolate AAA49 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ815951</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>3</Hit_num>
  <Hit_id>gi|256041622|gb|FJ815878.1|</Hit_id>
  <Hit_def>Bos taurus isolate FRI10197 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ815878</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>4</Hit_num>
  <Hit_id>gi|256041566|gb|FJ815822.1|</Hit_id>
  <Hit_def>Bos taurus isolate CCQ22 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ815822</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>5</Hit_num>
  <Hit_id>gi|256041453|gb|FJ815709.1|</Hit_id>
  <Hit_def>Bos taurus isolate ARG56 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ815709</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>6</Hit_num>
  <Hit_id>gi|256041384|gb|FJ815640.1|</Hit_id>
  <Hit_def>Bos taurus isolate RG8079 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ815640</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>7</Hit_num>
  <Hit_id>gi|199589056|gb|FJ014263.1|</Hit_id>
  <Hit_def>Bos taurus isolate JA6 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ014263</Hit_accession>
  <Hit_len>255</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>3</Hsp_hit-from>
      <Hsp_hit-to>242</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>8</Hit_num>
  <Hit_id>gi|126507448|gb|EF094976.1|</Hit_id>
  <Hit_def>Bos taurus isolate CUr2 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EF094976</Hit_accession>
  <Hit_len>240</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>240</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>9</Hit_num>
  <Hit_id>gi|41079384|gb|AY515665.1|</Hit_id>
  <Hit_def>Bos taurus isolate WN-W8 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>AY515665</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>10</Hit_num>
  <Hit_id>gi|70987496|gb|DQ124373.1|</Hit_id>
  <Hit_def>Bos taurus isolate KC3 mitochondrion, complete genome</Hit_def>
  <Hit_accession>DQ124373</Hit_accession>
  <Hit_len>16340</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>16025</Hsp_hit-from>
      <Hsp_hit-to>16264</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>11</Hit_num>
  <Hit_id>gi|27451349|gb|AF517828.1|</Hit_id>
  <Hit_def>Bos taurus isolate PP10 mitochondrial cytochrome b gene, partial cds; tRNA-Thr and tRNA-Pro genes, complete sequence; and control region, partial sequence</Hit_def>
  <Hit_accession>AF517828</Hit_accession>
  <Hit_len>811</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>419</Hsp_hit-from>
      <Hsp_hit-to>658</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>12</Hit_num>
  <Hit_id>gi|27451347|gb|AF517827.1|</Hit_id>
  <Hit_def>Bos taurus isolate PP09 mitochondrial cytochrome b gene, partial cds; tRNA-Thr and tRNA-Pro genes, complete sequence; and control region, partial sequence</Hit_def>
  <Hit_accession>AF517827</Hit_accession>
  <Hit_len>811</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>419</Hsp_hit-from>
      <Hsp_hit-to>658</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>13</Hit_num>
  <Hit_id>gi|27451345|gb|AF517826.1|</Hit_id>
  <Hit_def>Bos taurus isolate PP08 mitochondrial cytochrome b gene, partial cds; tRNA-Thr and tRNA-Pro genes, complete sequence; and control region, partial sequence</Hit_def>
  <Hit_accession>AF517826</Hit_accession>
  <Hit_len>811</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>419</Hsp_hit-from>
      <Hsp_hit-to>658</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>14</Hit_num>
  <Hit_id>gi|27451317|gb|AF517812.1|</Hit_id>
  <Hit_def>Bos taurus isolate CU06 mitochondrial cytochrome b gene, partial cds; tRNA-Thr and tRNA-Pro genes, complete sequence; and control region, partial sequence</Hit_def>
  <Hit_accession>AF517812</Hit_accession>
  <Hit_len>811</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>419</Hsp_hit-from>
      <Hsp_hit-to>658</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>15</Hit_num>
  <Hit_id>gi|27451283|gb|AF517795.1|</Hit_id>
  <Hit_def>Bos taurus isolate AC09 mitochondrial cytochrome b gene, partial cds; tRNA-Thr and tRNA-Pro genes, complete sequence; and control region, partial sequence</Hit_def>
  <Hit_accession>AF517795</Hit_accession>
  <Hit_len>811</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>434.095</Hsp_bit-score>
      <Hsp_score>480</Hsp_score>
      <Hsp_evalue>1.36091e-118</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>419</Hsp_hit-from>
      <Hsp_hit-to>658</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>240</Hsp_identity>
      <Hsp_positive>240</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>16</Hit_num>
  <Hit_id>gi|297615950|gb|HM106469.1|</Hit_id>
  <Hit_def>Bos taurus isolate Wuchuan Black-10 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>HM106469</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>17</Hit_num>
  <Hit_id>gi|297615941|gb|HM106460.1|</Hit_id>
  <Hit_def>Bos taurus isolate Wuchuan Black-1 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>HM106460</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>18</Hit_num>
  <Hit_id>gi|264685146|gb|FJ800951.1|</Hit_id>
  <Hit_def>Bos indicus isolate 75b001-b0 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800951</Hit_accession>
  <Hit_len>820</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>19</Hit_num>
  <Hit_id>gi|264685137|gb|FJ800942.1|</Hit_id>
  <Hit_def>Bos indicus isolate 61b108-b0 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800942</Hit_accession>
  <Hit_len>820</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>20</Hit_num>
  <Hit_id>gi|264685134|gb|FJ800939.1|</Hit_id>
  <Hit_def>Bos indicus isolate 61b016-b0 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800939</Hit_accession>
  <Hit_len>819</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>21</Hit_num>
  <Hit_id>gi|264685131|gb|FJ800936.1|</Hit_id>
  <Hit_def>Bos indicus isolate 56b103-a0 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800936</Hit_accession>
  <Hit_len>819</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>22</Hit_num>
  <Hit_id>gi|264685130|gb|FJ800935.1|</Hit_id>
  <Hit_def>Bos indicus isolate 4b119-b00 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800935</Hit_accession>
  <Hit_len>820</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>23</Hit_num>
  <Hit_id>gi|264685113|gb|FJ800918.1|</Hit_id>
  <Hit_def>Bos indicus isolate 48b125-b0 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800918</Hit_accession>
  <Hit_len>818</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>24</Hit_num>
  <Hit_id>gi|264685107|gb|FJ800912.1|</Hit_id>
  <Hit_def>Bos indicus isolate 48b114-b0 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800912</Hit_accession>
  <Hit_len>819</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>25</Hit_num>
  <Hit_id>gi|264685097|gb|FJ800902.1|</Hit_id>
  <Hit_def>Bos indicus isolate 48b004-b0 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800902</Hit_accession>
  <Hit_len>818</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACCGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>26</Hit_num>
  <Hit_id>gi|264685080|gb|FJ800885.1|</Hit_id>
  <Hit_def>Bos indicus isolate 25b002-a0 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800885</Hit_accession>
  <Hit_len>819</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>27</Hit_num>
  <Hit_id>gi|264685076|gb|FJ800881.1|</Hit_id>
  <Hit_def>Bos indicus isolate 1b016-b00 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800881</Hit_accession>
  <Hit_len>820</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>28</Hit_num>
  <Hit_id>gi|264685074|gb|FJ800879.1|</Hit_id>
  <Hit_def>Bos indicus isolate 19b116-b0 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800879</Hit_accession>
  <Hit_len>818</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>29</Hit_num>
  <Hit_id>gi|264685044|gb|FJ800849.1|</Hit_id>
  <Hit_def>Bos indicus isolate 103b118-a D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800849</Hit_accession>
  <Hit_len>819</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>30</Hit_num>
  <Hit_id>gi|264685043|gb|FJ800848.1|</Hit_id>
  <Hit_def>Bos indicus isolate 103b117-a D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ800848</Hit_accession>
  <Hit_len>819</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>31</Hit_num>
  <Hit_id>gi|256041744|gb|FJ816000.1|</Hit_id>
  <Hit_def>Bos taurus isolate 122JE05197 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ816000</Hit_accession>
  <Hit_len>908</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>32</Hit_num>
  <Hit_id>gi|256041733|gb|FJ815989.1|</Hit_id>
  <Hit_def>Bos taurus isolate 011JE00771 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ815989</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>33</Hit_num>
  <Hit_id>gi|256041717|gb|FJ815973.1|</Hit_id>
  <Hit_def>Bos taurus isolate AHE26 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ815973</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>34</Hit_num>
  <Hit_id>gi|256041701|gb|FJ815957.1|</Hit_id>
  <Hit_def>Bos taurus isolate HEAHA000025 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ815957</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>35</Hit_num>
  <Hit_id>gi|256041627|gb|FJ815883.1|</Hit_id>
  <Hit_def>Bos taurus isolate LM7027 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ815883</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>36</Hit_num>
  <Hit_id>gi|256041406|gb|FJ815662.1|</Hit_id>
  <Hit_def>Bos taurus isolate MO41 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ815662</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>37</Hit_num>
  <Hit_id>gi|256041400|gb|FJ815656.1|</Hit_id>
  <Hit_def>Bos taurus isolate MO13 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ815656</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>231</Hsp_hit-from>
      <Hsp_hit-to>470</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>38</Hit_num>
  <Hit_id>gi|238580183|gb|FJ958194.1|</Hit_id>
  <Hit_def>Bos taurus control region, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ958194</Hit_accession>
  <Hit_len>417</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>14</Hsp_hit-from>
      <Hsp_hit-to>253</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>39</Hit_num>
  <Hit_id>gi|199589071|gb|FJ014278.1|</Hit_id>
  <Hit_def>Bos taurus isolate PSK21 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ014278</Hit_accession>
  <Hit_len>255</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>3</Hsp_hit-from>
      <Hsp_hit-to>242</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>40</Hit_num>
  <Hit_id>gi|199589063|gb|FJ014270.1|</Hit_id>
  <Hit_def>Bos taurus isolate JA38 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ014270</Hit_accession>
  <Hit_len>255</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>3</Hsp_hit-from>
      <Hsp_hit-to>242</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>41</Hit_num>
  <Hit_id>gi|199589059|gb|FJ014266.1|</Hit_id>
  <Hit_def>Bos taurus isolate JA19 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>FJ014266</Hit_accession>
  <Hit_len>255</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>3</Hsp_hit-from>
      <Hsp_hit-to>242</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>42</Hit_num>
  <Hit_id>gi|198042600|gb|EU982244.1|</Hit_id>
  <Hit_def>Bos taurus isolate HunGrey34 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU982244</Hit_accession>
  <Hit_len>394</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>120</Hsp_hit-from>
      <Hsp_hit-to>359</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>43</Hit_num>
  <Hit_id>gi|194595726|gb|EU856758.1|</Hit_id>
  <Hit_def>Bos taurus isolate A23 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EU856758</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>44</Hit_num>
  <Hit_id>gi|156491116|gb|EF524159.1|</Hit_id>
  <Hit_def>Bos taurus isolate RB2 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF524159</Hit_accession>
  <Hit_len>911</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>45</Hit_num>
  <Hit_id>gi|156491114|gb|EF524157.1|</Hit_id>
  <Hit_def>Bos taurus isolate TC8 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF524157</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>46</Hit_num>
  <Hit_id>gi|156491110|gb|EF524153.1|</Hit_id>
  <Hit_def>Bos taurus isolate TC4 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF524153</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>47</Hit_num>
  <Hit_id>gi|156491106|gb|EF524149.1|</Hit_id>
  <Hit_def>Bos taurus isolate CM9 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF524149</Hit_accession>
  <Hit_len>911</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>48</Hit_num>
  <Hit_id>gi|156491093|gb|EF524136.1|</Hit_id>
  <Hit_def>Bos taurus isolate YL2 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF524136</Hit_accession>
  <Hit_len>911</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>49</Hit_num>
  <Hit_id>gi|156491079|gb|EF524122.1|</Hit_id>
  <Hit_def>Bos taurus isolate PL3 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF524122</Hit_accession>
  <Hit_len>911</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>50</Hit_num>
  <Hit_id>gi|166153871|gb|EU373504.1|</Hit_id>
  <Hit_def>Bos taurus haplotype 4 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU373504</Hit_accession>
  <Hit_len>521</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>5</Hsp_hit-from>
      <Hsp_hit-to>244</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>51</Hit_num>
  <Hit_id>gi|164454356|dbj|AB177794.1|</Hit_id>
  <Hit_def>Bos taurus gene for D-loop, clone:J7</Hit_def>
  <Hit_accession>AB177794</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>52</Hit_num>
  <Hit_id>gi|164454347|dbj|AB177785.1|</Hit_id>
  <Hit_def>Bos taurus gene for D-loop, clone:C21</Hit_def>
  <Hit_accession>AB177785</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>53</Hit_num>
  <Hit_id>gi|159034132|gb|EU233386.1|</Hit_id>
  <Hit_def>Bos taurus isolate Z2 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233386</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>54</Hit_num>
  <Hit_id>gi|159034129|gb|EU233383.1|</Hit_id>
  <Hit_def>Bos taurus isolate Z7 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233383</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>55</Hit_num>
  <Hit_id>gi|159034127|gb|EU233381.1|</Hit_id>
  <Hit_def>Bos taurus isolate W28 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233381</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>56</Hit_num>
  <Hit_id>gi|159034126|gb|EU233380.1|</Hit_id>
  <Hit_def>Bos taurus isolate W26 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233380</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>57</Hit_num>
  <Hit_id>gi|159034125|gb|EU233379.1|</Hit_id>
  <Hit_def>Bos taurus isolate W23 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233379</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>58</Hit_num>
  <Hit_id>gi|159034124|gb|EU233378.1|</Hit_id>
  <Hit_def>Bos taurus isolate W21 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233378</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>59</Hit_num>
  <Hit_id>gi|159034122|gb|EU233376.1|</Hit_id>
  <Hit_def>Bos taurus isolate W15 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233376</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>60</Hit_num>
  <Hit_id>gi|159034121|gb|EU233375.1|</Hit_id>
  <Hit_def>Bos taurus isolate W14 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233375</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>61</Hit_num>
  <Hit_id>gi|159034120|gb|EU233374.1|</Hit_id>
  <Hit_def>Bos taurus isolate W13 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233374</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>62</Hit_num>
  <Hit_id>gi|159034119|gb|EU233373.1|</Hit_id>
  <Hit_def>Bos taurus isolate W9 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233373</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>63</Hit_num>
  <Hit_id>gi|159034118|gb|EU233372.1|</Hit_id>
  <Hit_def>Bos taurus isolate W8 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233372</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>64</Hit_num>
  <Hit_id>gi|159034113|gb|EU233367.1|</Hit_id>
  <Hit_def>Bos taurus isolate N3 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233367</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>65</Hit_num>
  <Hit_id>gi|159034112|gb|EU233366.1|</Hit_id>
  <Hit_def>Bos taurus isolate N2 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233366</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>66</Hit_num>
  <Hit_id>gi|159034111|gb|EU233365.1|</Hit_id>
  <Hit_def>Bos taurus isolate N1 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233365</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>67</Hit_num>
  <Hit_id>gi|159034109|gb|EU233363.1|</Hit_id>
  <Hit_def>Bos taurus isolate D84 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233363</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>68</Hit_num>
  <Hit_id>gi|159034108|gb|EU233362.1|</Hit_id>
  <Hit_def>Bos taurus isolate D74 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233362</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>69</Hit_num>
  <Hit_id>gi|159034107|gb|EU233361.1|</Hit_id>
  <Hit_def>Bos taurus isolate D32 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233361</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>70</Hit_num>
  <Hit_id>gi|159034106|gb|EU233360.1|</Hit_id>
  <Hit_def>Bos taurus isolate D2 D-loop, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>EU233360</Hit_accession>
  <Hit_len>455</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>70</Hsp_hit-from>
      <Hsp_hit-to>309</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>71</Hit_num>
  <Hit_id>gi|126013610|gb|EF417967.1|</Hit_id>
  <Hit_def>Bos taurus isolate RM7 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF417967</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>72</Hit_num>
  <Hit_id>gi|126013603|gb|EF417960.1|</Hit_id>
  <Hit_def>Bos taurus isolate RM14 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF417960</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>73</Hit_num>
  <Hit_id>gi|126013600|gb|EF417957.1|</Hit_id>
  <Hit_def>Bos taurus isolate RF8 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF417957</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>74</Hit_num>
  <Hit_id>gi|126013585|gb|EF417942.1|</Hit_id>
  <Hit_def>Bos taurus isolate BM2 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF417942</Hit_accession>
  <Hit_len>908</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>75</Hit_num>
  <Hit_id>gi|126013584|gb|EF417941.1|</Hit_id>
  <Hit_def>Bos taurus isolate BM17 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF417941</Hit_accession>
  <Hit_len>909</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>76</Hit_num>
  <Hit_id>gi|126013578|gb|EF417935.1|</Hit_id>
  <Hit_def>Bos taurus isolate BF4 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF417935</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>77</Hit_num>
  <Hit_id>gi|119514371|gb|EF126320.1|</Hit_id>
  <Hit_def>Bos taurus isolate Anatolian Black 1 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>EF126320</Hit_accession>
  <Hit_len>911</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>78</Hit_num>
  <Hit_id>gi|85376006|gb|DQ344969.1|</Hit_id>
  <Hit_def>Bos taurus isolate XZ-A4 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>DQ344969</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>79</Hit_num>
  <Hit_id>gi|85375998|gb|DQ344961.1|</Hit_id>
  <Hit_def>Bos taurus isolate QC-A6 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>DQ344961</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>80</Hit_num>
  <Hit_id>gi|94958748|gb|DQ515561.1|</Hit_id>
  <Hit_def>Bos taurus clone SPmur10 control region, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>DQ515561</Hit_accession>
  <Hit_len>240</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>240</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>81</Hit_num>
  <Hit_id>gi|94958730|gb|DQ515543.1|</Hit_id>
  <Hit_def>Bos taurus clone PTmer18 control region, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>DQ515543</Hit_accession>
  <Hit_len>240</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>240</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>82</Hit_num>
  <Hit_id>gi|94958729|gb|DQ515542.1|</Hit_id>
  <Hit_def>Bos taurus clone PTmer17 control region, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>DQ515542</Hit_accession>
  <Hit_len>240</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>240</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>83</Hit_num>
  <Hit_id>gi|94958728|gb|DQ515541.1|</Hit_id>
  <Hit_def>Bos taurus clone PTmer16 control region, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>DQ515541</Hit_accession>
  <Hit_len>240</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>240</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>84</Hit_num>
  <Hit_id>gi|94958607|gb|DQ515420.1|</Hit_id>
  <Hit_def>Bos taurus clone tkab12 control region, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>DQ515420</Hit_accession>
  <Hit_len>240</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>240</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>85</Hit_num>
  <Hit_id>gi|94958512|gb|DQ515325.1|</Hit_id>
  <Hit_def>Bos taurus clone serbus30 control region, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>DQ515325</Hit_accession>
  <Hit_len>240</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>240</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>86</Hit_num>
  <Hit_id>gi|94958474|gb|DQ515287.1|</Hit_id>
  <Hit_def>Bos taurus clone bulrod01 control region, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>DQ515287</Hit_accession>
  <Hit_len>240</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>240</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>87</Hit_num>
  <Hit_id>gi|37791044|gb|AY337544.1|</Hit_id>
  <Hit_def>Bos taurus strain Korean Jeju yellow7 tRNA-Pro gene, partial sequence; D-loop and tRNA-Phe gene, complete sequence; and 12S ribosomal RNA gene, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>AY337544</Hit_accession>
  <Hit_len>1606</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>290</Hsp_hit-from>
      <Hsp_hit-to>529</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>88</Hit_num>
  <Hit_id>gi|37791025|gb|AY337525.1|</Hit_id>
  <Hit_def>Bos taurus strain Korean Youngju yellow4 tRNA-Pro gene, partial sequence; D-loop and tRNA-Phe gene, complete sequence; and 12S ribosomal RNA gene, partial sequence; mitochondrial</Hit_def>
  <Hit_accession>AY337525</Hit_accession>
  <Hit_len>1608</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>290</Hsp_hit-from>
      <Hsp_hit-to>529</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>89</Hit_num>
  <Hit_id>gi|70987580|gb|DQ124379.1|</Hit_id>
  <Hit_def>Bos taurus isolate KC9 mitochondrion, complete genome</Hit_def>
  <Hit_accession>DQ124379</Hit_accession>
  <Hit_len>16340</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>16025</Hsp_hit-from>
      <Hsp_hit-to>16264</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>90</Hit_num>
  <Hit_id>gi|50199376|dbj|AB117070.1|</Hit_id>
  <Hit_def>Bos taurus mitochondrial DNA, D-loop region, isolate: M11</Hit_def>
  <Hit_accession>AB117070</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>91</Hit_num>
  <Hit_id>gi|50199374|dbj|AB117069.1|</Hit_id>
  <Hit_def>Bos taurus mitochondrial DNA, D-loop region, isolate: M10</Hit_def>
  <Hit_accession>AB117069</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>92</Hit_num>
  <Hit_id>gi|58802544|gb|AY902397.1|</Hit_id>
  <Hit_def>Bos taurus isolate Sanjiang160 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>AY902397</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>93</Hit_num>
  <Hit_id>gi|58802536|gb|AY902389.1|</Hit_id>
  <Hit_def>Bos taurus isolate Ebina197 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>AY902389</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>94</Hit_num>
  <Hit_id>gi|58802535|gb|AY902388.1|</Hit_id>
  <Hit_def>Bos taurus isolate Ebian191 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>AY902388</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>95</Hit_num>
  <Hit_id>gi|46404157|gb|AY521135.1|</Hit_id>
  <Hit_def>Bos taurus isolate Zaobei50 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>AY521135</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>96</Hit_num>
  <Hit_id>gi|46404154|gb|AY521132.1|</Hit_id>
  <Hit_def>Bos taurus isolate Zaobei42 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>AY521132</Hit_accession>
  <Hit_len>911</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>97</Hit_num>
  <Hit_id>gi|46404136|gb|AY521114.1|</Hit_id>
  <Hit_def>Bos taurus isolate Sanjiang147 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>AY521114</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>98</Hit_num>
  <Hit_id>gi|46404135|gb|AY521113.1|</Hit_id>
  <Hit_def>Bos taurus isolate Sanjiang146 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>AY521113</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>99</Hit_num>
  <Hit_id>gi|46404111|gb|AY521089.1|</Hit_id>
  <Hit_def>Bos taurus isolate Ebian190 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>AY521089</Hit_accession>
  <Hit_len>910</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>100</Hit_num>
  <Hit_id>gi|46404108|gb|AY521086.1|</Hit_id>
  <Hit_def>Bos taurus isolate Bashan563 D-loop, complete sequence; mitochondrial</Hit_def>
  <Hit_accession>AY521086</Hit_accession>
  <Hit_len>911</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>428.685</Hsp_bit-score>
      <Hsp_score>474</Hsp_score>
      <Hsp_evalue>5.78674e-117</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>240</Hsp_query-to>
      <Hsp_hit-from>232</Hsp_hit-from>
      <Hsp_hit-to>471</Hsp_hit-to>
      <Hsp_query-frame>1</Hsp_query-frame>
      <Hsp_hit-frame>1</Hsp_hit-frame>
      <Hsp_identity>239</Hsp_identity>
      <Hsp_positive>239</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>240</Hsp_align-len>
      <Hsp_qseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_qseq>
      <Hsp_hseq>CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA</Hsp_hseq>
      <Hsp_midline>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
</Iteration_hits>
  <Iteration_stat>
    <Statistics>
      <Statistics_db-num>11929371</Statistics_db-num>
      <Statistics_db-len>1639314834</Statistics_db-len>
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

{ #category : #'results-waiting' }
BioWebBlastSamples >> blastcgiHtm [
	"WARNING: This is code generated automatically.
 On: 31 December 2010 - 3:25:45 am"

	^ '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NCBI Blast:Seqref_dloop</title>
<link rel="stylesheet" type="text/css" href="Blast.cgi_files/main.css" media="screen">
<link rel="stylesheet" type="text/css" href="Blast.cgi_files/blastRes.css" media="screen">
<link rel="stylesheet" type="text/css" href="Blast.cgi_files/print.css" media="print">
<!--[if lte IE 6]>
<link rel="stylesheet" type="text/css" href="css/ie6_or_less.css" />
<![endif]-->
<script type="text/javascript" src="Blast.cgi_files/utils.js"></script>
<script type="text/javascript" src="Blast.cgi_files/results.js"></script><link rel="stylesheet" type="text/css" href="Blast.cgi_files/firefox-descriptions.css" media="screen">
</head><body id="type-a" class="noToggleCheck">
<div id="wrap">
			<div id="header">	    
		<div id="site-name"><a id="logolink" href="http://www.ncbi.nlm.nih.gov/" title="NCBI Home Page"><img src="Blast.cgi_files/helix.gif" alt="NCBI Logo" title="Link to NCBI Home Page"></a>BLAST<h1 class="desc">Basic Local Alignment Search Tool</h1>
		</div>
		<div id="search">
		
<div>
<script language="JavaScript" type="text/javascript"><!--

var myncbi_x = MyNCBI_find();
var myncbi_cu = unescape(''http%3A//blast.ncbi.nlm.nih.gov/Blast.cgi%3FALIGNMENTS%3D500%26ALIGNMENT%5FVIEW%3DPairwise%26BLAST%5FPROGRAMS%3Dblastn%26CLIENT%3Dweb%26CMD%3DGet%26DATABASE%3Dnr%26DBTYPE%3Dgc%26DEFAULT%5FPROG%3DmegaBlast%26DESCRIPTIONS%3D1000%26ENTREZ%5FQUERY%3Dtxid9913%2B%255BORGN%255D%26EQ%5FMENU%3DBos%2Btaurus%2B%28taxid%253A9913%29%26EQ%5FOP%3DAND%26EXPECT%3D10%26FILTER%3DL%26FILTER%3Dm%26FORMAT%5FNUM%5FORG%3D1%26FORMAT%5FOBJECT%3DAlignment%26FORMAT%5FTYPE%3DHTML%26FULL%5FDBNAME%3Dnr%26GAPCOSTS%3D5%2B2%26GET%5FSEQUENCE%3Don%26HSP%5FRANGE%5FMAX%3D0%26JOB%5FTITLE%3DSeqref%5Fdloop%26LAYOUT%3DOneWindow%26MASK%5FCHAR%3D2%26MASK%5FCOLOR%3D1%26MATCH%5FSCORES%3D2%2C%2D3%26MAX%5FNUM%5FSEQ%3D1000%26MYNCBI%5FUSER%3D5906181863%26NEW%5FVIEW%3Don%26NUCL%5FPENALTY%3D%2D3%26NUCL%5FREWARD%3D2%26NUM%5FDIFFS%3D2%26NUM%5FOPTS%5FDIFFS%3D1%26NUM%5FORG%3D1%26NUM%5FOVERVIEW%3D100%26OLD%5FBLAST%3Dfalse%26PAGE%3DNucleotides%26PAGE%5FTYPE%3DBlastSearch%26PROGRAM%3Dblastn%26QUERY%5FINDEX%3D0%26QUERY%5FINFO%3D%2BSeqref%5Fdloop%2B%28240%2Bletters%29%26QUERY%5FLENGTH%3D240%26REPEATS%3Drepeat%5F9606%26RID%3DHUW9425J011%26RTOE%3D10%26SELECTED%5FPROG%5FTYPE%3Dblastn%26SERVICE%3Dplain%26SHORT%5FQUERY%5FADJUST%3Don%26SHOW%5FLINKOUT%3Don%26SHOW%5FOVERVIEW%3Don%26USER%5FDEFAULT%5FMATCH%5FSCORES%3D0%26USER%5FDEFAULT%5FPROG%5FTYPE%3DmegaBlast%26USER%5FTYPE%3D2%26WORD%5FSIZE%3D11%26db%3Dnucleotide%26stype%3Dnucleotide'');
function MyNCBI_find()
{
var cs = document.cookie.split(''; '');
for(var i = 0; i < cs.length; i++) {
// a name/value pair (a crumb) is separated by an equal sign
var c = cs[i].split(''='');
if(c[0] == ''WebCubbyUser'') { return c[1]; }
}
return '''';
}
function MyNCBI_auto_submit(url)
{
var qm = url.indexOf(''?'');
if( qm < 0 || qm >= (url.length - 1) ) {
window.location.replace(url);
} else {
var w = (self != top && self.name) ? top.frames[self.name] : self;
var f = ''<form name="myncbiautosubmitform" method="POST" action="'' + url.substr(0, qm) + ''" target="'' + w.name + ''">'';
var q = url.substr(qm + 1).replace(/&amp;/g,''&'');
var args = q.split(''&'');
for(j = 0; j < args.length; j++) {
var p = args[j].split(''='');
if(p[0].length < 1) { continue; }
f += ''<input type="hidden" name="'' + unescape(p[0]);
if( p.length > 1 ) {
p.shift();
f += ''" value="'' + unescape(p.join(''='')).replace(/"/g,''&quot;'');
}
f += ''"/>'';
}
f += ''</form>'';
w.document.body.innerHTML += f;
w.document.myncbiautosubmitform.submit();
}
}
function MyNCBI_r()
{
var x = MyNCBI_find();
if( x != myncbi_x ) {
myncbi_x = x;
MyNCBI_auto_submit(myncbi_cu);
} else {
window.setTimeout(MyNCBI_r, 500);
}
}
window.setTimeout(MyNCBI_r, 500);
// --></script><table class="medium1" style="border: 2px solid rgb(51, 102, 153);" id="myncbi_off" cellpadding="2" cellspacing="0"><tbody><tr><td align="left" bgcolor="#336699"><a href="http://www.ncbi.nlm.nih.gov/sites/myncbi/?"><font color="#ffffff"><b>My NCBI</b></font></a></td><td align="right" bgcolor="#336699"><a href="http://blast.ncbi.nlm.nih.gov/books/bv.fcgi?rid=helpmyncbi.chapter.MyNCBI" title="My NCBI help"><img src="Blast.cgi_files/myncbihelpicon.gif" alt="My NCBI help" border="0"></a></td></tr><tr><td colspan="2" nowrap="nowrap"><a href="http://www.ncbi.nlm.nih.gov/sites/myncbi/?back_url=http%3A//blast.ncbi.nlm.nih.gov/Blast.cgi%3FALIGNMENTS%3D500%26ALIGNMENT%5FVIEW%3DPairwise%26BLAST%5FPROGRAMS%3Dblastn%26CLIENT%3Dweb%26CMD%3DGet%26DATABASE%3Dnr%26DBTYPE%3Dgc%26DEFAULT%5FPROG%3DmegaBlast%26DESCRIPTIONS%3D1000%26ENTREZ%5FQUERY%3Dtxid9913%2B%255BORGN%255D%26EQ%5FMENU%3DBos%2Btaurus%2B%28taxid%253A9913%29%26EQ%5FOP%3DAND%26EXPECT%3D10%26FILTER%3DL%26FILTER%3Dm%26FORMAT%5FNUM%5FORG%3D1%26FORMAT%5FOBJECT%3DAlignment%26FORMAT%5FTYPE%3DHTML%26FULL%5FDBNAME%3Dnr%26GAPCOSTS%3D5%2B2%26GET%5FSEQUENCE%3Don%26HSP%5FRANGE%5FMAX%3D0%26JOB%5FTITLE%3DSeqref%5Fdloop%26LAYOUT%3DOneWindow%26MASK%5FCHAR%3D2%26MASK%5FCOLOR%3D1%26MATCH%5FSCORES%3D2%2C%2D3%26MAX%5FNUM%5FSEQ%3D1000%26MYNCBI%5FUSER%3D5906181863%26NEW%5FVIEW%3Don%26NUCL%5FPENALTY%3D%2D3%26NUCL%5FREWARD%3D2%26NUM%5FDIFFS%3D2%26NUM%5FOPTS%5FDIFFS%3D1%26NUM%5FORG%3D1%26NUM%5FOVERVIEW%3D100%26OLD%5FBLAST%3Dfalse%26PAGE%3DNucleotides%26PAGE%5FTYPE%3DBlastSearch%26PROGRAM%3Dblastn%26QUERY%5FINDEX%3D0%26QUERY%5FINFO%3D%2BSeqref%5Fdloop%2B%28240%2Bletters%29%26QUERY%5FLENGTH%3D240%26REPEATS%3Drepeat%5F9606%26RID%3DHUW9425J011%26RTOE%3D10%26SELECTED%5FPROG%5FTYPE%3Dblastn%26SERVICE%3Dplain%26SHORT%5FQUERY%5FADJUST%3Don%26SHOW%5FLINKOUT%3Don%26SHOW%5FOVERVIEW%3Don%26USER%5FDEFAULT%5FMATCH%5FSCORES%3D0%26USER%5FDEFAULT%5FPROG%5FTYPE%3DmegaBlast%26USER%5FTYPE%3D2%26WORD%5FSIZE%3D11%26db%3Dnucleotide%26stype%3Dnucleotide" title="Click to sign in" onclick="MyNCBI_auto_submit(''http://www.ncbi.nlm.nih.gov/sites/myncbi/?back_url=http%3A//blast.ncbi.nlm.nih.gov/Blast.cgi%3FALIGNMENTS%3D500%26ALIGNMENT%5FVIEW%3DPairwise%26BLAST%5FPROGRAMS%3Dblastn%26CLIENT%3Dweb%26CMD%3DGet%26DATABASE%3Dnr%26DBTYPE%3Dgc%26DEFAULT%5FPROG%3DmegaBlast%26DESCRIPTIONS%3D1000%26ENTREZ%5FQUERY%3Dtxid9913%2B%255BORGN%255D%26EQ%5FMENU%3DBos%2Btaurus%2B%28taxid%253A9913%29%26EQ%5FOP%3DAND%26EXPECT%3D10%26FILTER%3DL%26FILTER%3Dm%26FORMAT%5FNUM%5FORG%3D1%26FORMAT%5FOBJECT%3DAlignment%26FORMAT%5FTYPE%3DHTML%26FULL%5FDBNAME%3Dnr%26GAPCOSTS%3D5%2B2%26GET%5FSEQUENCE%3Don%26HSP%5FRANGE%5FMAX%3D0%26JOB%5FTITLE%3DSeqref%5Fdloop%26LAYOUT%3DOneWindow%26MASK%5FCHAR%3D2%26MASK%5FCOLOR%3D1%26MATCH%5FSCORES%3D2%2C%2D3%26MAX%5FNUM%5FSEQ%3D1000%26MYNCBI%5FUSER%3D5906181863%26NEW%5FVIEW%3Don%26NUCL%5FPENALTY%3D%2D3%26NUCL%5FREWARD%3D2%26NUM%5FDIFFS%3D2%26NUM%5FOPTS%5FDIFFS%3D1%26NUM%5FORG%3D1%26NUM%5FOVERVIEW%3D100%26OLD%5FBLAST%3Dfalse%26PAGE%3DNucleotides%26PAGE%5FTYPE%3DBlastSearch%26PROGRAM%3Dblastn%26QUERY%5FINDEX%3D0%26QUERY%5FINFO%3D%2BSeqref%5Fdloop%2B%28240%2Bletters%29%26QUERY%5FLENGTH%3D240%26REPEATS%3Drepeat%5F9606%26RID%3DHUW9425J011%26RTOE%3D10%26SELECTED%5FPROG%5FTYPE%3Dblastn%26SERVICE%3Dplain%26SHORT%5FQUERY%5FADJUST%3Don%26SHOW%5FLINKOUT%3Don%26SHOW%5FOVERVIEW%3Don%26USER%5FDEFAULT%5FMATCH%5FSCORES%3D0%26USER%5FDEFAULT%5FPROG%5FTYPE%3DmegaBlast%26USER%5FTYPE%3D2%26WORD%5FSIZE%3D11%26db%3Dnucleotide%26stype%3Dnucleotide'');return false;">[Sign In]</a> <a href="http://www.ncbi.nlm.nih.gov/sites/myncbi/register/?back_url=http%3A//blast.ncbi.nlm.nih.gov/Blast.cgi%3FALIGNMENTS%3D500%26ALIGNMENT%5FVIEW%3DPairwise%26BLAST%5FPROGRAMS%3Dblastn%26CLIENT%3Dweb%26CMD%3DGet%26DATABASE%3Dnr%26DBTYPE%3Dgc%26DEFAULT%5FPROG%3DmegaBlast%26DESCRIPTIONS%3D1000%26ENTREZ%5FQUERY%3Dtxid9913%2B%255BORGN%255D%26EQ%5FMENU%3DBos%2Btaurus%2B%28taxid%253A9913%29%26EQ%5FOP%3DAND%26EXPECT%3D10%26FILTER%3DL%26FILTER%3Dm%26FORMAT%5FNUM%5FORG%3D1%26FORMAT%5FOBJECT%3DAlignment%26FORMAT%5FTYPE%3DHTML%26FULL%5FDBNAME%3Dnr%26GAPCOSTS%3D5%2B2%26GET%5FSEQUENCE%3Don%26HSP%5FRANGE%5FMAX%3D0%26JOB%5FTITLE%3DSeqref%5Fdloop%26LAYOUT%3DOneWindow%26MASK%5FCHAR%3D2%26MASK%5FCOLOR%3D1%26MATCH%5FSCORES%3D2%2C%2D3%26MAX%5FNUM%5FSEQ%3D1000%26MYNCBI%5FUSER%3D5906181863%26NEW%5FVIEW%3Don%26NUCL%5FPENALTY%3D%2D3%26NUCL%5FREWARD%3D2%26NUM%5FDIFFS%3D2%26NUM%5FOPTS%5FDIFFS%3D1%26NUM%5FORG%3D1%26NUM%5FOVERVIEW%3D100%26OLD%5FBLAST%3Dfalse%26PAGE%3DNucleotides%26PAGE%5FTYPE%3DBlastSearch%26PROGRAM%3Dblastn%26QUERY%5FINDEX%3D0%26QUERY%5FINFO%3D%2BSeqref%5Fdloop%2B%28240%2Bletters%29%26QUERY%5FLENGTH%3D240%26REPEATS%3Drepeat%5F9606%26RID%3DHUW9425J011%26RTOE%3D10%26SELECTED%5FPROG%5FTYPE%3Dblastn%26SERVICE%3Dplain%26SHORT%5FQUERY%5FADJUST%3Don%26SHOW%5FLINKOUT%3Don%26SHOW%5FOVERVIEW%3Don%26USER%5FDEFAULT%5FMATCH%5FSCORES%3D0%26USER%5FDEFAULT%5FPROG%5FTYPE%3DmegaBlast%26USER%5FTYPE%3D2%26WORD%5FSIZE%3D11%26db%3Dnucleotide%26stype%3Dnucleotide" title="Click to register for an account" onclick="MyNCBI_auto_submit(''http://www.ncbi.nlm.nih.gov/sites/myncbi/register/?back_url=http%3A//blast.ncbi.nlm.nih.gov/Blast.cgi%3FALIGNMENTS%3D500%26ALIGNMENT%5FVIEW%3DPairwise%26BLAST%5FPROGRAMS%3Dblastn%26CLIENT%3Dweb%26CMD%3DGet%26DATABASE%3Dnr%26DBTYPE%3Dgc%26DEFAULT%5FPROG%3DmegaBlast%26DESCRIPTIONS%3D1000%26ENTREZ%5FQUERY%3Dtxid9913%2B%255BORGN%255D%26EQ%5FMENU%3DBos%2Btaurus%2B%28taxid%253A9913%29%26EQ%5FOP%3DAND%26EXPECT%3D10%26FILTER%3DL%26FILTER%3Dm%26FORMAT%5FNUM%5FORG%3D1%26FORMAT%5FOBJECT%3DAlignment%26FORMAT%5FTYPE%3DHTML%26FULL%5FDBNAME%3Dnr%26GAPCOSTS%3D5%2B2%26GET%5FSEQUENCE%3Don%26HSP%5FRANGE%5FMAX%3D0%26JOB%5FTITLE%3DSeqref%5Fdloop%26LAYOUT%3DOneWindow%26MASK%5FCHAR%3D2%26MASK%5FCOLOR%3D1%26MATCH%5FSCORES%3D2%2C%2D3%26MAX%5FNUM%5FSEQ%3D1000%26MYNCBI%5FUSER%3D5906181863%26NEW%5FVIEW%3Don%26NUCL%5FPENALTY%3D%2D3%26NUCL%5FREWARD%3D2%26NUM%5FDIFFS%3D2%26NUM%5FOPTS%5FDIFFS%3D1%26NUM%5FORG%3D1%26NUM%5FOVERVIEW%3D100%26OLD%5FBLAST%3Dfalse%26PAGE%3DNucleotides%26PAGE%5FTYPE%3DBlastSearch%26PROGRAM%3Dblastn%26QUERY%5FINDEX%3D0%26QUERY%5FINFO%3D%2BSeqref%5Fdloop%2B%28240%2Bletters%29%26QUERY%5FLENGTH%3D240%26REPEATS%3Drepeat%5F9606%26RID%3DHUW9425J011%26RTOE%3D10%26SELECTED%5FPROG%5FTYPE%3Dblastn%26SERVICE%3Dplain%26SHORT%5FQUERY%5FADJUST%3Don%26SHOW%5FLINKOUT%3Don%26SHOW%5FOVERVIEW%3Don%26USER%5FDEFAULT%5FMATCH%5FSCORES%3D0%26USER%5FDEFAULT%5FPROG%5FTYPE%3DmegaBlast%26USER%5FTYPE%3D2%26WORD%5FSIZE%3D11%26db%3Dnucleotide%26stype%3Dnucleotide'');return false;">[Register]</a></td></tr></tbody></table></div>
		</div>
		<a class="skp" href="#content-wrap">Jump to Page Content</a>		
		<ul id="nav">
                <li class="first "><a href="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&amp;PAGE_TYPE=BlastHome" title="BLAST Home">Home</a></li>
                <li class="recent "><a href="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=GetSaved&amp;RECENT_RESULTS=on" title="Unexpired BLAST jobs">Recent Results</a></li>                
                <li class="saved "><a href="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=GetSaved" title="Saved sets of BLAST search parameters">Saved Strategies</a></li>
                <li class="last documentation "> <a href="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&amp;PAGE_TYPE=BlastDocs" title="BLAST documentation">Help</a></li>                
                </ul>
    </div>

        <div id="content-wrap">

                <div id="breadcrumb" class="inlineDiv">
                   <a href="http://www.ncbi.nlm.nih.gov/">NCBI</a>/
                   <a href="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&amp;PAGE_TYPE=BlastHome">BLAST</a>/
                   <a href="http://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE=Nucleotides&amp;PROGRAM=blastn&amp;BLAST_PROGRAMS=megaBlast&amp;PAGE_TYPE=BlastSearch&amp;SHOW_DEFAULTS=on&amp;BLAST_SPEC=">blastn suite</a>/
                   <strong>Formatting Results - HUW9425J011</strong>             
                </div>
                <div class="inlineDiv resHeader">				   
				   <a id="frmPage" class="WAITING" href="#" submitform="reformat">[Formatting options] </a>                   
                </div>
                <h3 id="jtitle">Job Title: Seqref_dloop</h3>
								
                <div id="content">                
                <!--<ul id="msg" class="msg"><li class=""><p class=""></p><p class=""></p><p class=""></p></ul> -->
                <ul id="msg" class="msg"><li class=""></li></ul>
                <p><!--
                QBlastInfoBegin
	                Status=WAITING
                QBlastInfoEnd
                --></p> 
                               
                <script language="JavaScript"><!--
                    var tm = "7000";
                    if (tm != "") {                    
                        setTimeout(''document.forms[0].submit();'',tm);
                    }
                //--></script>                                
                <table id="statInfo" class="WAITING">
                <tbody><tr><td>Request ID</td><td> <b>HUW9425J011</b></td></tr>
                <tr class="odd"><td>Status</td><td>Searching</td></tr>
                <tr><td>Submitted at</td><td>Fri Dec 31 00:59:00 2010</td></tr>
                <tr class="odd"><td>Current time</td><td>Fri Dec 31 00:59:04 2010</td></tr>
                <tr><td>Time since submission</td><td>00:00:03</td></tr>
                </tbody></table>
                <p class="WAITING">This page will be automatically updated in <b>7</b> seconds</p>       
                <form action="Blast.cgi" enctype="application/x-www-form-urlencoded" method="POST" id="results">
                <input name="ALIGNMENTS" value="500" type="hidden"><input name="ALIGNMENT_VIEW" value="Pairwise" type="hidden"><input name="BLAST_PROGRAMS" value="blastn" type="hidden"><input name="CLIENT" value="web" type="hidden"><input name="DATABASE" value="nr" type="hidden"><input name="DBTYPE" value="gc" type="hidden"><input name="DEFAULT_PROG" value="megaBlast" type="hidden"><input name="DESCRIPTIONS" value="1000" type="hidden"><input name="ENTREZ_QUERY" value="txid9913 [ORGN]" type="hidden"><input name="EQ_MENU" value="Bos taurus (taxid:9913)" type="hidden"><input name="EQ_OP" value="AND" type="hidden"><input name="EXPECT" value="10" type="hidden"><input name="FILTER" value="L" type="hidden"><input name="FILTER" value="m" type="hidden"><input name="FORMAT_NUM_ORG" value="1" type="hidden"><input name="FORMAT_OBJECT" value="Alignment" type="hidden"><input name="FORMAT_TYPE" value="HTML" type="hidden"><input name="FULL_DBNAME" value="nr" type="hidden"><input name="GAPCOSTS" value="5 2" type="hidden"><input name="GET_SEQUENCE" value="on" type="hidden"><input name="HSP_RANGE_MAX" value="0" type="hidden"><input name="JOB_TITLE" value="Seqref_dloop" type="hidden"><input name="LAYOUT" value="OneWindow" type="hidden"><input name="MASK_CHAR" value="2" type="hidden"><input name="MASK_COLOR" value="1" type="hidden"><input name="MATCH_SCORES" value="2,-3" type="hidden"><input name="MAX_NUM_SEQ" value="1000" type="hidden"><input name="NEW_VIEW" value="on" type="hidden"><input name="NUCL_PENALTY" value="-3" type="hidden"><input name="NUCL_REWARD" value="2" type="hidden"><input name="NUM_DIFFS" value="2" type="hidden"><input name="NUM_OPTS_DIFFS" value="1" type="hidden"><input name="NUM_ORG" value="1" type="hidden"><input name="NUM_OVERVIEW" value="100" type="hidden"><input name="OLD_BLAST" value="false" type="hidden"><input name="PAGE" value="Nucleotides" type="hidden"><input name="PAGE_TYPE" value="BlastSearch" type="hidden"><input name="PROGRAM" value="blastn" type="hidden"><input name="QUERY_INFO" value=" Seqref_dloop (240 letters)" type="hidden"><input name="QUERY_LENGTH" value="240" type="hidden"><input name="REPEATS" value="repeat_9606" type="hidden"><input name="RID" value="HUW9425J011" type="hidden"><input name="RTOE" value="10" type="hidden"><input name="SEARCH_DB_STATUS" value="31" type="hidden"><input name="SELECTED_PROG_TYPE" value="blastn" type="hidden"><input name="SERVICE" value="plain" type="hidden"><input name="SHORT_QUERY_ADJUST" value="on" type="hidden"><input name="SHOW_LINKOUT" value="on" type="hidden"><input name="SHOW_OVERVIEW" value="on" type="hidden"><input name="USER_DEFAULT_MATCH_SCORES" value="0" type="hidden"><input name="USER_DEFAULT_PROG_TYPE" value="megaBlast" type="hidden"><input name="USER_TYPE" value="2" type="hidden"><input name="WORD_SIZE" value="11" type="hidden"><input name="_PGR" value="0" type="hidden"><input name="db" value="nucleotide" type="hidden"><input name="stype" value="nucleotide" type="hidden">                
                <input name="_PGR" value="0" type="hidden">
                <input name="CMD" value="Get" type="hidden">
               
                </form>
                                
				</div><!-- /#content -->
				<form action="Blast.cgi" enctype="application/x-www-form-urlencoded" method="post" name="reformat" id="reformat">				
				   <input name="QUERY_INFO" value="Seqref_dloop (240 letters)" type="hidden">    				
				   <input name="ENTREZ_QUERY" value="txid9913 [ORGN]" type="hidden">
                   <input name="CDD_RID" value="" type="hidden">
                   <input name="CDD_SEARCH_STATE" value="" type="hidden">
                   <input name="RID" value="HUW9425J011" type="hidden">
				   <input name="STEP_NUMBER" value="" type="hidden">
				   <input name="CMD" value="Web" type="hidden">				
				   <input name="PAGE_TYPE" value="BlastFormatting" type="hidden">
				
				   <!-- TO DO: test all of those changes -->				   	
				   <!-- Psi blast params  PSI_BLAST_PARAMS - commented- using forms[0] from fromatter> -->
				   <!-- Current Formatting options FORMATTING_OPTIONS- commented- using forms[0] from fromatter> -->
				   <!-- Current Search options CURR_SAVED_OPTIONS - commented- using forms[0] from fromatter> -->
                 </form>				
        </div><!-- /#content-wrap -->

		    	
<div id="footer">
   <p id="orgns">
      <a href="http://www.ncbi.nlm.nih.gov/" title="National Center for Biotechnology Information">NCBI</a> |
      <a href="http://www.nlm.nih.gov/" title="National Library of Medicine">NLM</a> |
      <a href="http://www.nih.gov/" title="National Institutes of Health">NIH</a> |
      <a href="http://www.hhs.gov/" title="US Department of Health and Human Services">DHHS</a>
   </p>
   
   <p>
      <a href="http://www.ncbi.nlm.nih.gov/About/disclaimer.html" title="NCBI intellectual property statement">Copyright</a> | 
      <a href="http://www.ncbi.nlm.nih.gov/About/disclaimer.html#disclaimer" title="About liability, endorsements, external links, pop-up advertisements">Disclaimer</a> | 
      <a href="http://www.nlm.nih.gov/privacy.html" title="NLM privacy policy">Privacy</a> | 
      <a href="http://www.ncbi.nlm.nih.gov/About/accessibility.html" title="About using NCBI resources with assistive technology">Accessibility</a> |
      <a href="http://www.ncbi.nlm.nih.gov/About/glance/contact_info.html" title="How to get help, submit data, or provide feedback">Contact</a> |
      <a href="mailto:blast-help@ncbi.nlm.nih.gov" title="How to get help, submit data, or provide feedback">Send feedback</a>      
   </p>
</div>	
   </div><!--/#wrap-->
</body></html>'
]

{ #category : #'results-ready' }
BioWebBlastSamples >> bt061Txt [
	"WARNING: This is code generated automatically.
 On: 27 December 2010 - 5:37:13 pm"

	^ '<p><!--
QBlastInfoBegin
	Status=READY
QBlastInfoEnd
--><p>
<HTML>
<HEAD>
<TITLE>BLAST Search Results </TITLE>
</HEAD>
<BODY BGCOLOR="#FFFFFF" LINK="#0000FF" VLINK="#660099" ALINK="#660099">
<A HREF="http://www.ncbi.nlm.nih.gov/BLAST/blast_form.map"> <IMG SRC="http://www.ncbi.nlm.nih.gov/BLAST/blast_results.gif" BORDER=0 ISMAP></A>
<BR><BR><PRE>
<b>BLASTP 2.0.14 [Jun-29-2000]</b>


<b><a href="http://www.ncbi.nlm.nih.gov/htbin-
post/Entrez/query?uid=9254694&form=6&db=m&Dopt=r">Reference</a>:</b>
Altschul, Stephen F., Thomas L. Madden, Alejandro A. Sch&auml;ffer, 
Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), 
"Gapped BLAST and PSI-BLAST: a new generation of protein database search
programs",  Nucleic Acids Res. 25:3389-3402.
<p>
RID: 965271318-22025-17045<p>
<b>Query=</b> gi|121837|sp|P06564|GUN_BACS1 ENDOGLUCANASE PRECURSOR
(ENDO-1,4-BETA-GLUCANASE) (ALKALINE CELLULASE)
         (800 letters)

<p>
<b>Database:</b> Non-redundant SwissProt sequences
           88,237 sequences; 31,799,033 total letters

<p> <p>If you have any problems or questions with the results of this search <br>please refer to the <b><a href=http://www.ncbi.nlm.nih.gov/BLAST/blast_FAQs.html>BLAST FAQs</a></b><br><p>
<FORM NAME="BLASTFORM" METHOD="POST">
<a href="blast.cgi?RID=965271318-22025-17045&ALIGNMENT_VIEW=17" TARGET="Taxonomy BLAST Results for 965271318-22025-17045">Taxonomy reports</a>
<BR>
<PRE>

                                                                   Score     E
Sequences producing significant alignments:                        (bits)  Value

<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121837&dopt=GenPept">sp|P06564|GUN_BACS1</a>  ENDOGLUCANASE PRECURSOR (ENDO-1,4-BETA-...  <a href = #121837>2407</a>  0.0
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121838&dopt=GenPept">sp|P19424|GUN_BACS6</a>  ENDOGLUCANASE PRECURSOR (ENDO-1,4-BETA-...  <a href = #121838>1469</a>  0.0
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121795&dopt=GenPept">sp|P19570|GUN3_BACS4</a>  ENDOGLUCANASE C PRECURSOR (ENDO-1,4-BE...  <a href = #121795>1287</a>  0.0
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=06016179&dopt=GenPept">sp|O85465|GUN5_BACAG</a>  ENDOGLUCANASE 5A (ENDO-1,4-BETA-GLUCAN...   <a href = #6016179>274</a>  5e-73
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121781&dopt=GenPept">sp|P06566|GUN1_BACS4</a>  ENDOGLUCANASE A (ENDO-1,4-BETA-GLUCANA...   <a href = #121781>270</a>  1e-71
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121789&dopt=GenPept">sp|P06565|GUN2_BACS4</a>  ENDOGLUCANASE B (ENDO-1,4-BETA-GLUCANA...   <a href = #121789>262</a>  2e-69
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121841&dopt=GenPept">sp|P15704|GUN_CLOAB</a>  ENDOGLUCANASE PRECURSOR (ENDO-1,4-BETA-...   <a href = #121841>245</a>  3e-64
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02494326&dopt=GenPept">sp|Q47096|GUNV_ERWCA</a>  ENDOGLUCANASE V PRECURSOR (ENDO-1,4-BE...   <a href = #2494326>242</a>  3e-63
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02494325&dopt=GenPept">sp|Q59394|GUNN_ERWCA</a>  ENDOGLUCANASE N PRECURSOR (ENDO-1,4-BE...   <a href = #2494325>237</a>  6e-62
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02494327&dopt=GenPept">sp|Q59395|GUNW_ERWCA</a>  ENDOGLUCANASE V1 PRECURSOR (ENDO-1,4-B...   <a href = #2494327>224</a>  7e-58
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121782&dopt=GenPept">sp|P07983|GUN1_BACSU</a>  ENDOGLUCANASE PRECURSOR (ENDO-1,4-BETA...   <a href = #121782>214</a>  6e-55
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121790&dopt=GenPept">sp|P10475|GUN2_BACSU</a>  ENDOGLUCANASE PRECURSOR (ENDO-1,4-BETA...   <a href = #121790>207</a>  7e-53
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121796&dopt=GenPept">sp|P23549|GUN3_BACSU</a>  ENDOGLUCANASE PRECURSOR (ENDO-1,4-BETA...   <a href = #121796>188</a>  4e-47
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00544462&dopt=GenPept">sp|P07103|GUNZ_ERWCH</a>  ENDOGLUCANASE Z PRECURSOR (ENDO-1,4-BE...   <a href = #544462>183</a>  2e-45
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=06016180&dopt=GenPept">sp|Q01786|GUN5_THEFU</a>  ENDOGLUCANASE E-5 PRECURSOR (ENDO-1,4-...   <a href = #6016180>178</a>  5e-44
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121800&dopt=GenPept">sp|P22541|GUNA_BUTFI</a>  ENDOGLUCANASE A PRECURSOR (ENDO-1,4-BE...   <a href = #121800>159</a>  3e-38
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121809&dopt=GenPept">sp|P27035|GUNA_STRLI</a>  ENDOGLUCANASE CELA PRECURSOR (ENDO-1,4...   <a href = #121809>155</a>  3e-37
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00729644&dopt=GenPept">sp|Q07940|GUN4_RUMAL</a>  ENDOGLUCANASE IV (ENDO-1,4-BETA-GLUCAN...   <a href = #729644>129</a>  3e-29
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=01176529&dopt=GenPept">sp|P46578|YLB3_CAEEL</a>  HYPOTHETICAL 100.9 KD PROTEIN C34E10.3...   <a href = #1176529> 35</a>  0.71
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=01723203&dopt=GenPept">sp|P55178|YAG5_STALU</a>  HYPOTHETICAL PROTEIN IN AGR OPERON (OR...   <a href = #1723203> 34</a>  1.3
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00544177&dopt=GenPept">sp|Q05646|DNAJ_ERYRH</a>  DNAJ PROTEIN                                <a href = #544177> 33</a>  2.3
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=03023420&dopt=GenPept">sp|O08893|CALR_CAVPO</a>  CALCITONIN RECEPTOR PRECURSOR (CT-R)        <a href = #3023420> 33</a>  3.1
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00549834&dopt=GenPept">sp|Q01611|ZFY1_XENLA</a>  ZINC FINGER Y-CHROMOSOMAL PROTEIN 1         <a href = #549834> 33</a>  3.1
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00400222&dopt=GenPept">sp|P22533|MANB_CALSA</a>  BETA-MANNANASE/ENDOGLUCANASE A PRECURS...   <a href = #400222> 32</a>  4.2
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02500204&dopt=GenPept">sp|Q59263|RIBF_CORAM</a>  RIBOFLAVIN BIOSYNTHESIS PROTEIN RIBF [...   <a href = #2500204> 32</a>  5.6
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00113377&dopt=GenPept">sp|P04707|ADH2_MAIZE</a>  ALCOHOL DEHYDROGENASE 2                     <a href = #113377> 32</a>  5.6
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00118498&dopt=GenPept">sp|P08157|DHAL_EMENI</a>  ALDEHYDE DEHYDROGENASE (ALDDH)              <a href = #118498> 32</a>  7.5
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=01706251&dopt=GenPept">sp|P52014|CYP6_CAEEL</a>  PEPTIDYL-PROLYL CIS-TRANS ISOMERASE 6 ...   <a href = #1706251> 32</a>  7.5
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02498024&dopt=GenPept">sp|Q04439|YMZ9_YEAST</a>   HYPOTHETICAL MYOSIN-LIKE PROTEIN IN I...   <a href = #2498024> 32</a>  7.5
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02494401&dopt=GenPept">sp|P94550|ETFB_BACSU</a>  ELECTRON TRANSFER FLAVOPROTEIN BETA-SU...   <a href = #2494401> 32</a>  7.5

<CENTER><b><FONT color="green">Alignments</FONT></b></CENTER>
<PRE>
><a name = 121837></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121837&dopt=GenPept">sp|P06564|GUN_BACS1</a> ENDOGLUCANASE PRECURSOR (ENDO-1,4-BETA-GLUCANASE) (ALKALINE
           CELLULASE)
          Length = 800

 Score = 2407 bits (5649), Expect = 0.0
 Identities = 744/772 (96%), Positives = 744/772 (96%), Gaps = 28/772 (3%)

Query: 1   MMLRKKTKQXXXXXXXXXXXXXX--------------FPTALAAEGNTREDNFKHLLGND 46
           MMLRKKTKQ                            FPTALAAEGNTREDNFKHLLGND
Sbjct: 1   MMLRKKTKQ--------------LISSILILVLLLSLFPTALAAEGNTREDNFKHLLGND 46

Query: 47  NVKRPSEAGALQLQEVDGQMTLVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKALANDWE 106
           NVKRPSEAGALQLQEVDGQMTLVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKALANDWE
Sbjct: 47  NVKRPSEAGALQLQEVDGQMTLVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKALANDWE 106

Query: 107 SNMIRLAMYVGENGYASNPELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDPRDPVYAGA 166
           SNMIRLAMYVGENGYASNPELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDPRDPVYAGA
Sbjct: 107 SNMIRLAMYVGENGYASNPELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDPRDPVYAGA 166

Query: 167 EDFFRDIAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWNAVKEYADPIVEMLRDSG 226
           EDFFRDIAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWNAVKEYADPIVEMLRDSG
Sbjct: 167 EDFFRDIAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWNAVKEYADPIVEMLRDSG 226

Query: 227 NADDNIIIVGSPNWSQRPDLAADNPIDDHHTMYTVHFYTGSHAASTESYPPETPNSERGN 286
           NADDNIIIVGSPNWSQRPDLAADNPIDDHHTMYTVHFYTGSHAASTESYPPETPNSERGN
Sbjct: 227 NADDNIIIVGSPNWSQRPDLAADNPIDDHHTMYTVHFYTGSHAASTESYPPETPNSERGN 286

Query: 287 VMSNTRYALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLNENNISWANWSLTNKNE 346
           VMSNTRYALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLNENNISWANWSLTNKNE
Sbjct: 287 VMSNTRYALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLNENNISWANWSLTNKNE 346

Query: 347 VSGAFTPFELGKSNATSLDPGPDQVWVPEELSLSGEYVRARIKGVNYEPIDRTKYTKVLW 406
           VSGAFTPFELGKSNATSLDPGPDQVWVPEELSLSGEYVRARIKGVNYEPIDRTKYTKVLW
Sbjct: 347 VSGAFTPFELGKSNATSLDPGPDQVWVPEELSLSGEYVRARIKGVNYEPIDRTKYTKVLW 406

Query: 407 DFNDGTKQGFGVNGDSPVEDVVIENEAGALKLSGLDASNDVSEGNYWANARLSADGWGKS 466
           DFNDGTKQGFGVNGDSPVEDVVIENEAGALKLSGLDASNDVSEGNYWANARLSADGWGKS
Sbjct: 407 DFNDGTKQGFGVNGDSPVEDVVIENEAGALKLSGLDASNDVSEGNYWANARLSADGWGKS 466

Query: 467 VDILGAEKLTMDVIVDEPTTVSIAAIPQGPSANWVNPNRAIKVEPTNFVPLEDKFKAELT 526
           VDILGAEKLTMDVIVDEPTTVSIAAIPQGPSANWVNPNRAIKVEPTNFVPLEDKFKAELT
Sbjct: 467 VDILGAEKLTMDVIVDEPTTVSIAAIPQGPSANWVNPNRAIKVEPTNFVPLEDKFKAELT 526

Query: 527 ITSADSPSLEAIAMHAENNNINNIILFVGTEGADVIYLDNIKVIGTEVEIPVVHDPKGEA 586
           ITSADSPSLEAIAMHAENNNINNIILFVGTEGADVIYLDNIKVIGTEVEIPVVHDPKGEA
Sbjct: 527 ITSADSPSLEAIAMHAENNNINNIILFVGTEGADVIYLDNIKVIGTEVEIPVVHDPKGEA 586

Query: 587 VLPSVFEDGTRQGWDWAGESGVKTALTIEEANGSNALSWEFGYPEVKPSDNWATAPRLDF 646
           VLPSVFEDGTRQGWDWAGESGVKTALTIEEANGSNALSWEFGYPEVKPSDNWATAPRLDF
Sbjct: 587 VLPSVFEDGTRQGWDWAGESGVKTALTIEEANGSNALSWEFGYPEVKPSDNWATAPRLDF 646

Query: 647 WKSDLVRGENDYVTFDFYLDPVRATEGAMNINLVFQPPTNGYWVQAPKTYTINFDELEEP 706
           WKSDLVRGENDYVTFDFYLDPVRATEGAMNINLVFQPPTNGYWVQAPKTYTINFDELEEP
Sbjct: 647 WKSDLVRGENDYVTFDFYLDPVRATEGAMNINLVFQPPTNGYWVQAPKTYTINFDELEEP 706

Query: 707 NQVNGLYHYEVKINVRDITNIQDDTLLRNMMIIFADVESDFAGRVFVDNVRF 758
           NQVNGLYHYEVKINVRDITNIQDDTLLRNMMIIFADVESDFAGRVFVDNVRF
Sbjct: 707 NQVNGLYHYEVKINVRDITNIQDDTLLRNMMIIFADVESDFAGRVFVDNVRF 758
</PRE>


<PRE>
><a name = 121838></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121838&dopt=GenPept">sp|P19424|GUN_BACS6</a> ENDOGLUCANASE PRECURSOR (ENDO-1,4-BETA-GLUCANASE) (ALKALINE
           CELLULASE)
          Length = 941

 Score = 1469 bits (3445), Expect = 0.0
 Identities = 514/729 (70%), Positives = 595/729 (81%), Gaps = 35/729 (4%)

Query: 48  VKRPSEAGALQLQEVDGQMTLVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKALANDWES 107
           VK PSEAGALQL E++GQ+TL  + G  +QLRGMSTHGLQWF EI+N+NA+ AL+NDW S
Sbjct: 229 VKSPSEAGALQLVELNGQLTLAGEDGTPVQLRGMSTHGLQWFGEIVNENAFVALSNDWGS 288

Query: 108 NMIRLAMYVGENGYASNPELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDPRDPVYAGAE 167
           NMIRLAMY+GENGYA+NPE +K  V +GI+LA E+DMYVIVDWHVHAPGDPR  VY+GA 
Sbjct: 289 NMIRLAMYIGENGYATNPE-VKDLVYEGIELAFEHDMYVIVDWHVHAPGDPRADVYSGAY 347

Query: 168 DFFRDIAALY---PNNPHIIYELANEPSSNNNGGAGIPNNEEGWNAVKEYADPIVEMLRD 224
           DFF +IA  Y   P N +II+ELANEPS NNNGG G+ N+E+GW AVKEYA+PIVEMLR+
Sbjct: 348 DFFEEIADHYKDHPKNHYIIWELANEPSPNNNGGPGLTNDEKGWEAVKEYAEPIVEMLRE 407

Query: 225 SGNADDNIIIVGSPNWSQRPDLAADNPIDDHHTMYTVHFYTGSHAASTESYPPETPNSER 284
            G   DN+I+VG+PNWSQRPDL+ADNPID  + MY+VHFYTGSH AS   YP  TP+SER
Sbjct: 408 KG---DNMILVGNPNWSQRPDLSADNPIDAENIMYSVHFYTGSHGASHIGYPEGTPSSER 464

Query: 285 GNVMSNTRYALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLNENNISWANWSLTNK 344
            NVM+N RYAL+NGVAVFATEWGTSQANGDGGPYFDEADVW+ FLN++NISWANWSLTNK
Sbjct: 465 SNVMANVRYALDNGVAVFATEWGTSQANGDGGPYFDEADVWLNFLNKHNISWANWSLTNK 524

Query: 345 NEVSGAFTPFELGKSNATSLDPGPDQVWVPEELSLSGEYVRARIKGVNYEPIDRTKYTKV 404
           NE+SGAFTPFELG+++AT LDPG +QVW PEELSLSGEYVRARIKG+ Y PIDRTK+TK+
Sbjct: 525 NEISGAFTPFELGRTDATDLDPGANQVWAPEELSLSGEYVRARIKGIEYTPIDRTKFTKL 584

Query: 405 LWDFNDGTKQGFGVNGDSPV-EDVVIENEAGALKLSGLDASNDVSEGNYWANARLSADGW 463
           +WDFNDGT QGF VNGDSP  E + + N   AL++ GL+ SND+SEGNYW N RLSADGW
Sbjct: 585 VWDFNDGTTQGFQVNGDSPNKESITLSNNNDALQIEGLNVSNDISEGNYWDNVRLSADGW 644

Query: 464 GKSVDILGAEKLTMDVIVDEPTTVSIAAIPQGPSANWVNPNRAIKVEPTNFVPLEDKF-- 521
            ++VDILGA +LT+DVIV+EPTTVSIAAIPQGP+A W NP RAIKV  T     ED F  
Sbjct: 645 SENVDILGATELTIDVIVEEPTTVSIAAIPQGPAAGWANPTRAIKV--T-----EDDFES 697

Query: 522 -----KAELTITSADSPSLEAIAMHAENNNINNIILFVGTEGADVIYLDNIKVIGTEVEI 576
                KA +TITS DSPSLE IA   E+N ++NIILFVGTE ADVI LDNI V GTE+EI
Sbjct: 698 FGDGYKALVTITSEDSPSLETIATSPEDNTMSNIILFVGTEDADVISLDNITVSGTEIEI 757

Query: 577 PVVHDPKGEAVLPSVFEDGTRQGWDWAGESGVKTALTIEEANGSNALSWEFGYPEVKPSD 636
            V+HD KG A LPS FEDGTRQGWDW  ESGVKTALTIEEANGSNALSWE+ YPEVKPSD
Sbjct: 758 EVIHDEKGTATLPSTFEDGTRQGWDWHTESGVKTALTIEEANGSNALSWEYAYPEVKPSD 817

Query: 637 NWATAPRLDFWKSDLVRGENDYVTFDFYLDPVRATEGAMNINLVFQPPTNGYWVQAPKTY 696
            WATAPRLDFWK +LVRG +DY++FDFY+D VRA+EGA++IN VFQPP NGYW + P T+
Sbjct: 818 GWATAPRLDFWKDELVRGTSDYISFDFYIDAVRASEGAISINAVFQPPANGYWQEVPTTF 877

Query: 697 TINFDEL-------EEPNQVNGLYHYEVKINVRDITNIQDDTLLRNMMIIFADVESDFAG 749
            I+  EL       +E      LYHYEVKIN+RDI  I DDT LRN+++IFAD +SDFAG
Sbjct: 878 EIDLTELDSATVTSDE------LYHYEVKINIRDIEAITDDTELRNLLLIFADEDSDFAG 931

Query: 750 RVFVDNVRF 758
           RVFVDNVRF
Sbjct: 932 RVFVDNVRF 940
</PRE>


<PRE>
><a name = 121795></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121795&dopt=GenPept">sp|P19570|GUN3_BACS4</a> ENDOGLUCANASE C PRECURSOR (ENDO-1,4-BETA-GLUCANASE) (CELLULASE)
          Length = 825

 Score = 1287 bits (3019), Expect = 0.0
 Identities = 480/743 (64%), Positives = 576/743 (76%), Gaps = 52/743 (6%)

Query: 50  RPSEAGALQLQEVDGQMTLVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKALANDWESNM 109
           RPSEAGALQL EVDGQ+TL DQ G  IQLRGMSTHGLQWF EI+N+NA+ ALANDW SN+
Sbjct: 69  RPSEAGALQLVEVDGQVTLADQDGVPIQLRGMSTHGLQWFGEIVNENAFAALANDWGSNV 128

Query: 110 IRLAMYVGENGYASNPELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDPRDPVYAG---- 165
           IRLA+Y+GEN Y  NP+LI+ +V  GI+LA ENDMYVI+DWHVHAPGDP   +Y G    
Sbjct: 129 IRLALYIGENAYRYNPDLIE-KVYAGIELAKENDMYVIIDWHVHAPGDPNADIYQGGVNE 187

Query: 166 -------AEDFFRDIAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWNAVKEYADPI 218
                  A+DFF  IA  YPN+PH+IYELANEPSSN++GG GI N+E+GW AV+EYA PI
Sbjct: 188 DGEEYLGAKDFFLHIAEKYPNDPHLIYELANEPSSNSSGGPGITNDEDGWEAVREYAQPI 247

Query: 219 VEMLRDSGNADDNIIIVGSPNWSQRPDLAA-DNPIDDHHTMYTVHFYTGSHAASTESYPP 277
           V+ LRDSGNA+DNIIIVGSPNWSQR DLAA DNPIDDHHTMYT+HFYTG+H  + ESYP 
Sbjct: 248 VDALRDSGNAEDNIIIVGSPNWSQRMDLAAADNPIDDHHTMYTLHFYTGTHEGTNESYP- 306

Query: 278 ETPNSE-RGNVMSNTRYALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLNENNISW 336
           E  +SE R NVM+N +YAL+ G A+FATEWG S+A+G+ GPY +EADVW+ FLNENNISW
Sbjct: 307 EGISSEDRSNVMANAKYALDKGKAIFATEWGVSEADGNNGPYLNEADVWLNFLNENNISW 366

Query: 337 ANWSLTNKNEVSGAFTPFELGKSNATSLDPGPDQVWVPEELSLSGEYVRARIKGVNYEPI 396
            NWSLTNKNE SGAFTPF L +S+AT LDPG DQVW  EELS+SGEYVR+RI G  Y+PI
Sbjct: 367 TNWSLTNKNETSGAFTPFILNESDATDLDPGEDQVWSMEELSVSGEYVRSRILGEEYQPI 426

Query: 397 DRT---KYTKVLWDFNDGTKQGFGVNGDSPVEDVVIENEAGALKLSGLDASNDVS--EGN 451
           DRT   ++++V+WDFNDGT QGF  N DSP+ DV IEN   AL+++GLD SN ++  E +
Sbjct: 427 DRTPREEFSEVIWDFNDGTTQGFVQNSDSPL-DVTIENVNDALQITGLDESNAIAGEEED 485

Query: 452 YWANARLSADGWGKSVDILGAEKLTMDVIVDEPTTVSIAAIPQGPSAN-WVNPNRAIKVE 510
           YW+N R+SAD W ++ DILGAE+L+MDV+VD+PTTV+IAAIPQ  SA+ W N        
Sbjct: 486 YWSNVRISADEWEETFDILGAEELSMDVVVDDPTTVAIAAIPQ-SSAHEWAN-------- 536

Query: 511 PTNFVPL--EDKF--------KAELTITSADSPSLEAIAMHAENNNINNIILFVGTEGAD 560
            +N V L  ED F        KA LTIT  D+P+L  IA   E + +NNIILFVGTE AD
Sbjct: 537 ASNSV-LITEDDFEEQEDGTYKALLTITGEDAPNLTNIAEDPEGSELNNIILFVGTENAD 595

Query: 561 VIYLDNIKVIGT-E-VEIPVVHDPKGEAVLPSVFEDGTRQGWDWAGESGVKTALTIEEAN 618
           VI LDNI V G  E V  PV HD KG++ LPS FEDGTRQGW+W  ES V+TALTIEEAN
Sbjct: 596 VISLDNITVTGDRESVPEPVEHDTKGDSALPSDFEDGTRQGWEWDSESAVRTALTIEEAN 655

Query: 619 GSNALSWEFGYPEVKPSDNWATAPRLDFWKSDLVRGENDYVTFDFYLDPV--RATEGAMN 676
           GSNALSWE+ YPEVKPSD+WATAPRL  +K DLVRG+ ++V FDFY+DP+  RATEGA++
Sbjct: 656 GSNALSWEYAYPEVKPSDDWATAPRLTLYKDDLVRGDYEFVAFDFYIDPIEDRATEGAID 715

Query: 677 INLVFQPPTNGYWVQAPKTYTINFDELEEPNQV--NGLYHYEVKINVRDITNIQDDTLLR 734
           INL+FQPP  GYW QA +T+ I+ +EL+    V  +GLYHYEV+IN   I +I++D  LR
Sbjct: 716 INLIFQPPAAGYWAQASETFEIDLEELDSAT-VTDDGLYHYEVEIN---IEDIENDIELR 771

Query: 735 NMMIIFADVESDFAGRVFVDNVR 757
           N+M+IFAD ESDFAGRVF+DNVR
Sbjct: 772 NLMLIFADDESDFAGRVFLDNVR 794
</PRE>


<PRE>
><a name = 6016179></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=06016179&dopt=GenPept">sp|O85465|GUN5_BACAG</a> ENDOGLUCANASE 5A (ENDO-1,4-BETA-GLUCANASE) (ALKALINE CELLULASE)
          Length = 400

 Score =  274 bits (638), Expect = 5e-73
 Identities = 144/345 (41%), Positives = 203/345 (58%), Gaps = 74/345 (21%)

Query: 64  GQMT-----LVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKA---LANDWESNMIRLAMY 115
           GQ++     LV++ GE++QL+GMS+HGLQW+ + +N   Y++   L +DW  N+ R AMY
Sbjct: 36  GQLSISNGELVNERGEQVQLKGMSSHGLQWYGQFVN---YESMKWLRDDWGINVFRAAMY 92

Query: 116 VGENGYASNPELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDPRDPVY-AGAEDFFRDIA 174
               GY  +P  +K +V + ++ AI+ D+YVI+DWH+ +  DP   +Y   A+DFF +++
Sbjct: 93  TSSGGYIDDPS-VKEKVKEAVEAAIDLDIYVIIDWHILSDNDP--NIYKEEAKDFFDEMS 149

Query: 175 ALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGW-NAVKEYAD---PIVEMLRDSGNAD- 229
            LY + P++IYE+ANEP    NG      ++  W N +K YA+   PI+   R   N D 
Sbjct: 150 ELYGDYPNVIYEIANEP----NG------SDVTWGNQIKPYAEEVIPII---R---NNDP 193

Query: 230 DNIIIVGSPNWSQRPDL--AADNPIDDHHTMYTVHFYTGSHAASTESYPPETPNSERGNV 287
           +NIIIVG+  WSQ  D+  AADN + D + MY  HFY G+H                   
Sbjct: 194 NNIIIVGTGTWSQ--DVHHAADNQLADPNVMYAFHFYAGTHGQ----------------- 234

Query: 288 MSNTR----YALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLNENNISWANWSLTN 343
             N R    YAL+ G A+F +EWGTS A GDGG + DEA VWI+F++E N+SWANWSLT+
Sbjct: 235 --NLRDQVDYALDQGAAIFVSEWGTSAATGDGGVFLDEAQVWIDFMDERNLSWANWSLTH 292

Query: 344 KNEVSGAFTPFELGKSNATSLDPGPDQVWVPEELSLSGEYVRARI 388
           K+E S A  P   G +N T    G    W   ELS SG +VR +I
Sbjct: 293 KDESSAALMP---G-ANPTG---G----WTEAELSPSGTFVREKI 326
</PRE>


<PRE>
><a name = 121781></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121781&dopt=GenPept">sp|P06566|GUN1_BACS4</a> ENDOGLUCANASE A (ENDO-1,4-BETA-GLUCANASE) (CELLULASE)
          Length = 488

 Score =  270 bits (628), Expect = 1e-71
 Identities = 144/347 (41%), Positives = 204/347 (58%), Gaps = 73/347 (21%)

Query: 58  QL--QEVDGQMTLVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKA---LANDWESNMIRL 112
           QL  Q  +GQ  LV++HG+ +QL+GMS+HGLQW+ + +N   Y +   L +DW   + R 
Sbjct: 35  QLSIQ--NGQ--LVNEHGDPVQLKGMSSHGLQWYGQFVN---YDSIKWLRDDWGITVFRA 87

Query: 113 AMYVGENGYASNP---ELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDPRDPVY-AGAED 168
           AMY    GY  +P   E +K  V   IDL I    YVI+DWH+ +  DP   +Y   A++
Sbjct: 88  AMYTSSGGYIEDPSVKEKVKEAVEAAIDLGI----YVIIDWHILSDNDP--NIYKEEAKE 141

Query: 169 FFRDIAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWNA-VKEYADPIVEMLRDSGN 227
           FF +++ALY + P++IYE+ANEP+ +N     +      W++ +K YA+ ++ ++R    
Sbjct: 142 FFDEMSALYGDYPNVIYEIANEPNGHN-----VR-----WDSHIKPYAEEVIPVIR---- 187

Query: 228 ADD--NIIIVGSPNWSQRPDL--AADNPIDDHHTMYTVHFYTGSHAASTESYPPETPNSE 283
           A+D  NI+IVG+  WSQ  D+  AADN +DD + MY  HFY G+H              +
Sbjct: 188 ANDPNNIVIVGTATWSQ--DVHEAADNQLDDPNVMYAFHFYAGTH-------------GQ 232

Query: 284 --RGNVMSNTRYALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLNENNISWANWSL 341
             R  V  +  YAL  G A+F +EWGTS A GDGG + DEA VWI+F++E N+SWANWSL
Sbjct: 233 QLRNQV--D--YALSRGAAIFVSEWGTSAATGDGGVFLDEAQVWIDFMDERNLSWANWSL 288

Query: 342 TNKNEVSGAFTPFELGKSNATSLDPGPDQVWVPEELSLSGEYVRARI 388
           T+K+E S A  P   G +N T    G    W   ELS SG +VR +I
Sbjct: 289 THKDESSAALMP---G-ANPTG---G----WTAAELSPSGAFVREKI 324
</PRE>


<PRE>
><a name = 121789></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121789&dopt=GenPept">sp|P06565|GUN2_BACS4</a> ENDOGLUCANASE B (ENDO-1,4-BETA-GLUCANASE) (CELLULASE)
          Length = 409

 Score =  262 bits (610), Expect = 2e-69
 Identities = 142/347 (40%), Positives = 199/347 (56%), Gaps = 78/347 (22%)

Query: 64  GQMT-----LVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKA---LANDWESNMIRLAMY 115
           GQ++     LV+  GE +QL+GMS+HGLQW+ + +N   Y++   L +DW   + R AMY
Sbjct: 36  GQLSISNGELVNDRGEPVQLKGMSSHGLQWYGQFVN---YESMKWLRDDWGITVFRAAMY 92

Query: 116 VGENGYASNPELIKSRVIK-----GIDLAIENDMYVIVDWHVHAPGDPRDPVY-AGAEDF 169
               GY  +P  +K +V K      IDL I    YVI+DWH+ +  DP   +Y   A+DF
Sbjct: 93  TSSGGYIEDPS-VKEKV-KEAVEAAIDLGI----YVIIDWHILSDNDPN--IYKEEAKDF 144

Query: 170 FRDIAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGW-NAVKEYADPIVEMLRDSGNA 228
           F +++ LY + P++IYE+ANEP    NG      ++  W N +K YA+ ++ ++R   N 
Sbjct: 145 FDEMSELYGDYPNVIYEIANEP----NG------SDVTWDNQIKPYAEEVIPVIR---NN 191

Query: 229 D-DNIIIVGSPNWSQRPDL--AADNPIDDHHTMYTVHFYTGSHAASTESYPPETPNSERG 285
           D +NIIIVG+  WSQ  D+  AADN + D + MY  HFY G+H                 
Sbjct: 192 DPNNIIIVGTGTWSQ--DVHHAADNQLTDPNVMYAFHFYAGTHGQ--------------- 234

Query: 286 NVMSNTR----YALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLNENNISWANWSL 341
               N R    YAL+ G A+F +EWGTS+A GDGG + DEA VWI+F++E N+SWANWSL
Sbjct: 235 ----NLRDQVDYALDQGAAIFVSEWGTSEATGDGGVFLDEAQVWIDFMDERNLSWANWSL 290

Query: 342 TNKNEVSGAFTPFELGKSNATSLDPGPDQVWVPEELSLSGEYVRARI 388
           T+K+E S A  P   G ++ T    G    W   ELS SG +VR +I
Sbjct: 291 THKDESSAALMP---G-ASPTG---G----WTEAELSPSGTFVREKI 326
</PRE>


<PRE>
><a name = 121841></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121841&dopt=GenPept">sp|P15704|GUN_CLOAB</a> ENDOGLUCANASE PRECURSOR (ENDO-1,4-BETA-GLUCANASE) (CELLULASE)
          Length = 448

 Score =  245 bits (570), Expect = 3e-64
 Identities = 133/311 (42%), Positives = 178/311 (56%), Gaps = 66/311 (21%)

Query: 58  QLQEVDGQMTLVDQHGEKIQLRGMSTHGLQWFPEILNDNAY---KALANDWESNMIRLAM 114
           QL+ V  Q  L D +G+ IQL+GMS+HGLQW+   +N   Y   K L + W  N+IR AM
Sbjct: 46  QLKVVGSQ--LCDSNGKPIQLKGMSSHGLQWYVNFVN---YDSMKFLRDKWGVNVIRAAM 100

Query: 115 YVGENGYASNP----ELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDP---RDPVYAGAE 167
           Y  E GY SNP    E IK  V   IDL    +MYVI+DWH+ +  +P   ++     A+
Sbjct: 101 YTNEGGYISNPSSQKEKIKKIVQDAIDL----NMYVIIDWHILSDNNPNTYKEQ----AK 152

Query: 168 DFFRDIAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGW-NAVKEYADPIVEMLR--D 224
            FF+++A  Y    ++IYE+ NEP    NGG     N   W N +K YA+ I+  +R  D
Sbjct: 153 SFFQEMAEEYGKYSNVIYEICNEP----NGGT----N---WANDIKPYANYIIPAIRAID 201

Query: 225 SGNADDNIIIVGSPNWSQRPDLAADNP-----IDDHHTMYTVHFYTGSHAASTESYPPET 279
                +NIIIVG+  WSQ  D+AADNP     I     MYT HFY G+H   T+S     
Sbjct: 202 P----NNIIIVGTSTWSQDVDIAADNPLRYSNI-----MYTCHFYAGTH---TQSL---- 245

Query: 280 PNSERGNVMSNTRYALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLNENNISWANW 339
               R  +  N  YA+  G+A+F TEWGTS A+G+GGPY DE+  W++F+   NISW NW
Sbjct: 246 ----RDKI--N--YAMSKGIAIFVTEWGTSDASGNGGPYLDESQKWVDFMASKNISWTNW 297

Query: 340 SLTNKNEVSGA 350
           +L +K+E S A
Sbjct: 298 ALCDKSEASAA 308
</PRE>


<PRE>
><a name = 2494326></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02494326&dopt=GenPept">sp|Q47096|GUNV_ERWCA</a> ENDOGLUCANASE V PRECURSOR (ENDO-1,4-BETA-GLUCANASE V) (CELLULASE V)
          Length = 505

 Score =  242 bits (562), Expect = 3e-63
 Identities = 140/366 (38%), Positives = 197/366 (53%), Gaps = 102/366 (27%)

Query: 61  EVDGQMT-----LVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKALANDWESNMIRLAMY 115
           E  GQ++     LVD+ G+++QLRG+S+HGLQWF + +N ++ K L +DW  N+ R+AMY
Sbjct: 36  ETHGQLSIENGRLVDEQGKRVQLRGISSHGLQWFGDYVNKDSMKWLRDDWGINVFRVAMY 95

Query: 116 VGENGYASNPEL---IK-------SRVIKGIDLAIENDMYVIVDWHVHAPGDPRDPVY-A 164
              +GY SNP L   +K       S       L +    Y+I+DWH+ +  DP   +Y A
Sbjct: 96  TAADGYISNPSLANKVKEAVAAAQS-------LGV----YIIIDWHILSDNDP--NIYKA 142

Query: 165 GAEDFFRDIAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWNA-VKEYA-------- 215
            A+ FF ++A LY ++P++IYE+ANEP    NGG         WN  ++ YA        
Sbjct: 143 QAKTFFAEMAGLYGSSPNVIYEIANEP----NGGV-------TWNGQIRPYALEVTDTIR 191

Query: 216 --DPIVEMLRDSGNADDNIIIVGSPNWSQRPDL--AADNPIDDHHTMYTVHFYTGSHAAS 271
             DP            DN+IIVG+  WSQ  D+  AADN + D +TMY +HFY G+H   
Sbjct: 192 SKDP------------DNLIIVGTGTWSQ--DIHDAADNQLPDPNTMYALHFYAGTH--- 234

Query: 272 TESYPPETPNSERGNVMSNTR--YALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFL 329
                        G  + + R  YA   G A+F +EWGTS A+G+GGP+  E+  WI+FL
Sbjct: 235 -------------GQFLRD-RIDYAQSRGAAIFVSEWGTSDASGNGGPFLPESQTWIDFL 280

Query: 330 NENNISWANWSLTNKNEVSGAFTPFELG--KSNATSLDPGPDQVWVPEELSLSGEYVRAR 387
           N   +SW NWSLT+K+E S A  P   G  KS            W  + LS SG++VR +
Sbjct: 281 NNRGVSWVNWSLTDKSEASAALAP---GASKSGG----------WTEQNLSTSGKFVREQ 327

Query: 388 IK-GVN 392
           I+ G N
Sbjct: 328 IRAGAN 333
</PRE>


<PRE>
><a name = 2494325></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02494325&dopt=GenPept">sp|Q59394|GUNN_ERWCA</a> ENDOGLUCANASE N PRECURSOR (ENDO-1,4-BETA-GLUCANASE N) (CELLULASE N)
          Length = 444

 Score =  237 bits (552), Expect = 6e-62
 Identities = 139/366 (37%), Positives = 197/366 (52%), Gaps = 102/366 (27%)

Query: 61  EVDGQMT-----LVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKALANDWESNMIRLAMY 115
           E  GQ++     LVD+ G+++QLRG+S+HGLQWF + +N ++ K L +DW  N+ R+AMY
Sbjct: 36  ETHGQLSIENGRLVDEQGKRVQLRGVSSHGLQWFGDYVNKDSMKWLRDDWGINVFRVAMY 95

Query: 116 VGENGYASNPEL---IK-------SRVIKGIDLAIENDMYVIVDWHVHAPGDPRDPVY-A 164
              +GY SNP L   +K       S       L +    Y+I+DWH+ +  DP   +Y A
Sbjct: 96  TAADGYISNPSLANKVKEAVAAAQS-------LGV----YIIIDWHILSDNDP--NIYKA 142

Query: 165 GAEDFFRDIAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWNA-VKEYA-------- 215
            A+ FF ++A LY ++P++IYE+ANEP    NGG         WN  ++ YA        
Sbjct: 143 QAKTFFAEMAGLYGSSPNVIYEIANEP----NGGV-------TWNGQIRPYALEVTDTIR 191

Query: 216 --DPIVEMLRDSGNADDNIIIVGSPNWSQRPDL--AADNPIDDHHTMYTVHFYTGSHAAS 271
             DP            DN+IIVG+  WSQ  D+  AADN + D +T+Y +HFY G+H   
Sbjct: 192 SKDP------------DNLIIVGTGTWSQ--DIHDAADNQLPDPNTLYALHFYAGTH--- 234

Query: 272 TESYPPETPNSERGNVMSNTR--YALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFL 329
                        G  + + R  YA   G A+F +EWGTS A+G+GGP+  E+  WI+FL
Sbjct: 235 -------------GQFLRD-RIDYAQSRGAAIFVSEWGTSDASGNGGPFLPESQTWIDFL 280

Query: 330 NENNISWANWSLTNKNEVSGAFTPFELG--KSNATSLDPGPDQVWVPEELSLSGEYVRAR 387
           N   +SW NWSLT+K+E S A  P   G  KS            W  + LS SG++VR +
Sbjct: 281 NNRGVSWVNWSLTDKSEASAALAP---GASKSGG----------WTEQNLSTSGKFVREQ 327

Query: 388 IK-GVN 392
           I+ G N
Sbjct: 328 IRAGAN 333
</PRE>


<PRE>
><a name = 2494327></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02494327&dopt=GenPept">sp|Q59395|GUNW_ERWCA</a> ENDOGLUCANASE V1 PRECURSOR (ENDO-1,4-BETA-GLUCANASE V1) (CELLULASE
           V1)
          Length = 504

 Score =  224 bits (520), Expect = 7e-58
 Identities = 137/363 (37%), Positives = 190/363 (51%), Gaps = 105/363 (28%)

Query: 61  EVDGQMT-----LVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKA----LANDWESNMIR 111
           E  GQ++     LVD+ G+++QLRG+S++GLQW    + D   K     L +DW  N+ R
Sbjct: 36  ETHGQLSIENGRLVDEQGKRVQLRGISSNGLQW----VGDYVNKDSMKWLRDDWGINVFR 91

Query: 112 LAMYVGENGYASNPEL---IKSRVI--KGIDLAIENDMYVIVDWHVHAPGDPRDPVY-AG 165
           +AMY  ENGY +NP L   +K  V   +G  L +    Y+I+DWH  +  DP    Y A 
Sbjct: 92  VAMYTAENGYIANPSLANKVKEAVAAAQG--LGV----YIIIDWHTLSDNDPN--TYKAQ 143

Query: 166 AEDFFRDIAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWNA-VKEYA--------- 215
           A+ FF ++A LY N+P++IYE+ANEP    NG          WN  ++ YA         
Sbjct: 144 AKIFFAEMAGLYGNSPNVIYEIANEP----NGSV-------TWNGQIRPYALEVTDTIRS 192

Query: 216 -DPIVEMLRDSGNADDNIIIVGSPNWSQRPDL--AADNPIDDHHTMYTVHFYTGSHAAST 272
            DP            DN+IIVGS  WSQ  D+  AADN + D +T+Y +HFY G+H    
Sbjct: 193 KDP------------DNLIIVGSGTWSQ--DIHDAADNQLPDPNTLYALHFYAGTH---- 234

Query: 273 ESYPPETPNSERGNVMSNTR--YALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLN 330
                       G  + + R  YA   G A+F +EWGTS A+G+GGP+  E+  WI+FLN
Sbjct: 235 ------------GQFLRD-RIDYAQSRGAAIFVSEWGTSDASGNGGPFLPESQTWIDFLN 281

Query: 331 ENNISWANWSLTNKNE-----VSGAFTPFELGKSNATSLDPGPDQVWVPEELSLSGEYVR 385
              ISW NWSL++K+E     V+GA       KS            W  + LS SG++VR
Sbjct: 282 NRGISWVNWSLSDKSETSAALVAGA------SKSGG----------WTEQNLSTSGKFVR 325

Query: 386 ARI 388
            +I
Sbjct: 326 EQI 328
</PRE>


<PRE>
><a name = 121782></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121782&dopt=GenPept">sp|P07983|GUN1_BACSU</a> ENDOGLUCANASE PRECURSOR (ENDO-1,4-BETA-GLUCANASE) (CELLULASE)
          Length = 499

 Score =  214 bits (497), Expect = 6e-55
 Identities = 114/304 (37%), Positives = 182/304 (59%), Gaps = 50/304 (16%)

Query: 63  DGQMT-----LVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKALANDWESNMIRLAMYVG 117
           +GQ++     LV++ G+ +QL+G+S+HGLQW+ + +N ++ K L +DW   + R AMY  
Sbjct: 39  NGQLSIKGTQLVNRDGKAVQLKGISSHGLQWYGDFVNKDSLKWLRDDWGITVFRAAMYTA 98

Query: 118 ENGYASNPELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDP-----RDPVYAGAEDFFRD 172
           + GY  NP  +K++V + ++ A E  +YVI+DWH+   G+P     +      A++FF++
Sbjct: 99  DGGYIDNPS-VKNKVKEAVEAAKELGIYVIIDWHILNDGNPNQNKEK------AKEFFKE 151

Query: 173 IAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWN-AVKEYADPIVEMLRDSGNADDN 231
           +++LY N P++IYE+ANEP+ + N           W   +K YA+ ++ ++R   N  DN
Sbjct: 152 MSSLYGNTPNVIYEIANEPNGDVN-----------WKRDIKPYAEEVISVIRK--NDPDN 198

Query: 232 IIIVGSPNWSQRPDL--AADNPIDDHHTMYTVHFYTGSHAASTESYPPETPNSERGNVMS 289
           IIIVG+  WSQ  D+  AAD+ + D + MY +HFY G+H  S           ++ N   
Sbjct: 199 IIIVGTGTWSQ--DVNDAADDQLKDANVMYALHFYAGTHGQS---------LRDKAN--- 244

Query: 290 NTRYALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLNENNISWANWSLTNKNEVSG 349
              YAL  G  +F TEWGTS A+G+GG + D++  W+ +L+  NISW NW+L++K E S 
Sbjct: 245 ---YALSKGAPIFVTEWGTSDASGNGGVFLDQSREWLNYLDSKNISWVNWNLSDKQESSS 301

Query: 350 AFTP 353
           A  P
Sbjct: 302 ALKP 305
</PRE>


<PRE>
><a name = 121790></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121790&dopt=GenPept">sp|P10475|GUN2_BACSU</a> ENDOGLUCANASE PRECURSOR (ENDO-1,4-BETA-GLUCANASE)
           (CARBOXYMETHYL-CELLULASE) (CMCASE) (CELLULASE)
          Length = 499

 Score =  207 bits (481), Expect = 7e-53
 Identities = 113/310 (36%), Positives = 180/310 (57%), Gaps = 62/310 (20%)

Query: 63  DGQMT-----LVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKALANDWESNMIRLAMYVG 117
           +GQ++     LV++ G+ +QL+G+S+HGLQW+ E +N ++ K L +DW   + R AMY  
Sbjct: 39  NGQLSIKGTQLVNRDGKAVQLKGISSHGLQWYGEYVNKDSLKWLRDDWGITVFRAAMYTA 98

Query: 118 ENGYASNPELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDP-----RDPVYAGAEDFFRD 172
           + GY  NP  +K++V + ++ A E  +YVI+DWH+   G+P     +      A++FF++
Sbjct: 99  DGGYIDNPS-VKNKVKEAVEAAKELGIYVIIDWHILNDGNPNQNKEK------AKEFFKE 151

Query: 173 IAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWN-AVKEYADPIVEMLRDSGNADDN 231
           +++LY N P++IYE+ANEP+ + N           W   +K YA+ ++ ++R   N  DN
Sbjct: 152 MSSLYGNTPNVIYEIANEPNGDVN-----------WKRDIKPYAEEVISVIRK--NDPDN 198

Query: 232 IIIVGSPNWSQRPDL--AADNPIDDHHTMYTVHFYTGSHA------ASTESYPPETPNSE 283
           IIIVG+  WSQ  D+  AAD+ + D + MY +HFY G+H       A+            
Sbjct: 199 IIIVGTGTWSQ--DVNDAADDQLKDANVMYALHFYAGTHGQFLRDKAN------------ 244

Query: 284 RGNVMSNTRYALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLNENNISWANWSLTN 343
                    YAL  G  +F TEWGTS A+G+GG + D++  W+++L+   ISW NW+L++
Sbjct: 245 ---------YALSKGAPIFVTEWGTSDASGNGGVFLDQSREWLKYLDSKTISWVNWNLSD 295

Query: 344 KNEVSGAFTP 353
           K E S A  P
Sbjct: 296 KQESSSALKP 305
</PRE>


<PRE>
><a name = 121796></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121796&dopt=GenPept">sp|P23549|GUN3_BACSU</a> ENDOGLUCANASE PRECURSOR (ENDO-1,4-BETA-GLUCANASE)
           (CARBOXYMETHYL-CELLULASE) (CMCASE) (CELLULASE)
          Length = 499

 Score =  188 bits (436), Expect = 4e-47
 Identities = 110/310 (35%), Positives = 178/310 (56%), Gaps = 62/310 (20%)

Query: 63  DGQMT-----LVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKALANDWESNMIRLAMYVG 117
           +GQ++     LV++ G+ +QL+G+S+HGLQW+ E +N ++ K L +DW   + R AMY  
Sbjct: 39  NGQLSIKGTQLVNRDGKAVQLKGISSHGLQWYGEYVNKDSLKWLRDDWGITVFRAAMYTA 98

Query: 118 ENGYASNPELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDP-----RDPVYAGAEDFFRD 172
           + G   NP  +K+++ + ++ A E  +YVI+DWH+   G+P     +      A++FF++
Sbjct: 99  DGGIIDNPS-VKNKMKEAVEAAKELGIYVIIDWHILNDGNPNQNKEK------AKEFFKE 151

Query: 173 IAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWN-AVKEYADPIVEMLRDSGNADDN 231
           +++LY N P++IYE+ANEP+ + N           W   +K YA+ ++ ++R   N  DN
Sbjct: 152 MSSLYGNTPNVIYEIANEPNGDVN-----------WKRDIKPYAEEVISVIRK--NDPDN 198

Query: 232 IIIVGSPNWSQRPDL--AADNPIDDHHTMYTVHFYTGSHA------ASTESYPPETPNSE 283
           IIIVG+  WSQ  D+  AAD+ + D + M  +HFY G+H       A+            
Sbjct: 199 IIIVGTGTWSQ--DVNDAADDQLKDANVMDALHFYAGTHGQFLRDKAN------------ 244

Query: 284 RGNVMSNTRYALENGVAVFATEWGTSQANGDGGPYFDEADVWIEFLNENNISWANWSLTN 343
                    YAL  G  +F TEWGTS A+G+GG + D++  W+++L+   ISW NW+L++
Sbjct: 245 ---------YALSKGAPIFVTEWGTSDASGNGGVFLDQSREWLKYLDSKTISWVNWNLSD 295

Query: 344 KNEVSGAFTP 353
           K E S A  P
Sbjct: 296 KQESSSALKP 305
</PRE>


<PRE>
><a name = 544462></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00544462&dopt=GenPept">sp|P07103|GUNZ_ERWCH</a> ENDOGLUCANASE Z PRECURSOR (ENDO-1,4-BETA-GLUCANASE Z) (CELLULASE Z)
           (EGZ)
          Length = 426

 Score =  183 bits (423), Expect = 2e-45
 Identities = 105/270 (38%), Positives = 148/270 (53%), Gaps = 75/270 (27%)

Query: 104 DWESNMIRLAMYVGENG-Y----ASNPELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDP 158
           DW+S+++R AM V E+G Y    A N    K++V + +D AI NDMY I+ WH H+    
Sbjct: 93  DWKSSIVRAAMGVQESGGYLQDPAGN----KAKVERVVDAAIANDMYAIIGWHSHS---- 144

Query: 159 RDPVYAGAED-------FFRDIAALYPNNPHIIYELANEP---SSNNNGGAGIPNNEEGW 208
                  AE+       FF+++A  Y N P++IYE+ NEP   S               W
Sbjct: 145 -------AENNRSEAIRFFQEMARKYGNKPNVIYEIYNEPLQVS---------------W 182

Query: 209 -NAVKEYADPIVEMLR--DSGNADDNIIIVGSPNWSQRPDLAADNPIDDHHTMYTVHFYT 265
            N +K YA+ ++  +R  D     DN+IIVG+P+WSQ  D A+ +PI+  +  YT+HFY 
Sbjct: 183 SNTIKPYAEAVISAIRAIDP----DNLIIVGTPSWSQNVDEASRDPINAKNIAYTLHFYA 238

Query: 266 GSHAASTESYPPETPNSERGNVMSN-TRYALENGVAVFATEWGTSQANGDGGPYFD--EA 322
           G+H    ES             + N  R AL NG+A+F TEWGT  A+G+GG   +  E 
Sbjct: 239 GTHG---ES-------------LRNKARQALNNGIALFVTEWGTVNADGNGGV--NQTET 280

Query: 323 DVWIEFLNENNISWANWSLTNKNEVSGAFT 352
           D W+ F+ +NNIS ANW+L +KNE  GA T
Sbjct: 281 DAWVTFMRDNNISNANWALNDKNE--GAST 308
</PRE>


<PRE>
><a name = 6016180></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=06016180&dopt=GenPept">sp|Q01786|GUN5_THEFU</a> ENDOGLUCANASE E-5 PRECURSOR (ENDO-1,4-BETA-GLUCANASE E-4)
           (CELLULASE E-5) (CELLULASE E5)
          Length = 466

 Score =  178 bits (412), Expect = 5e-44
 Identities = 111/304 (36%), Positives = 154/304 (50%), Gaps = 88/304 (28%)

Query: 68  LVDQHGEKIQLRGMSTHGLQWFPEILNDNAYKALANDWESNMIRLAMYVGENGYASNP-- 125
           L D+HG  +QLRGMSTHG+QWF   L D++  ALA DW++++IRL+MY+ E+GY +NP  
Sbjct: 178 LCDEHGNPVQLRGMSTHGIQWFDHCLTDSSLDALAYDWKADIIRLSMYIQEDGYETNPRG 237

Query: 126 ------ELIKSRVIKGIDLAIENDMYVIVDWHVHAPGDP-----RDPVYAGAEDFFRDIA 174
                 +L        ID+A    +YVIVDWH+  PGDP     R      A+ FF +IA
Sbjct: 238 FTDRMHQL--------IDMATARGLYVIVDWHILTPGDPHYNLDR------AKTFFAEIA 283

Query: 175 ALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWNAVKEYAD---PIVEMLRDSGNADDN 231
             + +  +++YE+ANEP    NG +        W ++K YA+   P++   RD     D+
Sbjct: 284 QRHASKTNVLYEIANEP----NGVS--------WASIKSYAEEVIPVI-RQRDP----DS 326

Query: 232 IIIVGSPNWSQ--------RPDLAADNPIDDHHTMYTVHFYTGSHAASTESYPPETPNSE 283
           +IIVG+  WS           ++AA NP++  + MY  HFY  SH               
Sbjct: 327 VIIVGTRGWSSLGVSEGSGPAEIAA-NPVNASNIMYAFHFYAASH--------------- 370

Query: 284 RGNVMSNTRY--AL-ENGVA-----VFATEWGTSQANGDGGPYFDEADVWIEFLNENNIS 335
           R N      Y  AL E   A     VF TE+GT    GDG   F  AD +I+ + E  I 
Sbjct: 371 RDN------YLNALRE---ASELFPVFVTEFGTETYTGDGANDFQMADRYIDLMAERKIG 421

Query: 336 WANW 339
           W  W
Sbjct: 422 WTKW 425
</PRE>


<PRE>
><a name = 121800></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121800&dopt=GenPept">sp|P22541|GUNA_BUTFI</a> ENDOGLUCANASE A PRECURSOR (ENDO-1,4-BETA-GLUCANASE) (CELLULASE)
           (EGA)
          Length = 429

 Score =  159 bits (367), Expect = 3e-38
 Identities = 115/309 (37%), Positives = 162/309 (52%), Gaps = 81/309 (26%)

Query: 68  LVDQHGEKIQLRGMSTHGLQWFPEILNDNAY------KALANDWESNMIRLAMYVGE-NG 120
           LVD  G ++ L G+STHG+ W+PE      Y      K+L + W  N+IRLAMY  + NG
Sbjct: 123 LVDADGHEVLLMGVSTHGINWYPE------YASAETIKSLRDTWGINVIRLAMYTSDYNG 176

Query: 121 Y--AS--NPELIKSRVIKGIDLAIE----NDMYVIVDWHVHAPGDPRDPVY-AGAEDFF- 170
           Y  A   N E +K   I  ID A+E    NDMYVI+DWH     DP +  Y A A  FF 
Sbjct: 177 YCVAGKENQEKLKD--I--IDDAVEAATDNDMYVIIDWHTLNDADPNE--YKADAIQFFG 230

Query: 171 ---RDIAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGWNAVKEYADPIVEMLRDSGN 227
              R     Y +N ++IYE+ NEP+ +             WN V+ YA+ ++ ++R   N
Sbjct: 231 EMVRK----YKDNENVIYEICNEPNGDTT-----------WNDVRRYANEVIPVIR---N 272

Query: 228 ADDNIIIVGSPNWSQRPDLAA--DNPID-DHHTMYTVHFYTGSHAASTESYPPETPNSER 284
            D  II+VG+P W+   DL +  D P+D D + MYT HFY G+H             +ER
Sbjct: 273 VDA-IILVGTPKWA--TDLDSVLDKPLDFD-NIMYTYHFYAGTH-----------HKAER 317

Query: 285 GNVMSNTRYALENGVAVFATEWGTSQANGDGGPYFD----EADVWIEFL-NENNISWANW 339
            N + +   AL+ G+ VF +E+G   A+GDG    +    EAD W + +  E  +S   W
Sbjct: 318 -NALRD---ALDEGLPVFISEYGLVDADGDG----NLNEKEADYWYDMIRKEYGVSSCMW 369

Query: 340 SLTNKNEVS 348
           +L+NK+E S
Sbjct: 370 NLSNKDEGS 378
</PRE>


<PRE>
><a name = 121809></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00121809&dopt=GenPept">sp|P27035|GUNA_STRLI</a> ENDOGLUCANASE CELA PRECURSOR (ENDO-1,4-BETA-GLUCANASE) (CELLULASE)
          Length = 459

 Score =  155 bits (359), Expect = 3e-37
 Identities = 111/310 (35%), Positives = 156/310 (49%), Gaps = 90/310 (29%)

Query: 76  IQLRGMSTHGLQWF-PEILNDNAY-KA----LANDWESNMIRLAMYVGENGYASNPELIK 129
           IQLRGMSTHG+QWF P       Y  A    LA DW+S+++R+AMYV E+GY ++P    
Sbjct: 174 IQLRGMSTHGIQWFGP------CYGDASLDRLAQDWKSDLLRVAMYVQEDGYETDPAGFT 227

Query: 130 SRVIKG-IDLAIENDMYVIVDWHVHAPGDP-----RDPVYAGAEDFFRDIAALYPNN-PH 182
           SRV  G +D+A +  MY ++D+H   PGDP     R      A  FF  +AA   N+  +
Sbjct: 228 SRV-NGLVDMAEDRGMYAVIDFHTLTPGDPNYNLDR------ARTFFSSVAA--RNDKKN 278

Query: 183 IIYELANEPSSNNNGGAGIPNNEEGWNAVKEYADPIVEMLRDSGNAD-DNIIIVGSPNWS 241
           +IYE+ANEP    NG +        W AVK YA+ ++ ++R    AD D ++IVG+  WS
Sbjct: 279 VIYEIANEP----NGVS--------WTAVKSYAEQVIPVIRA---ADPDAVVIVGTRGWS 323

Query: 242 QRPDL----------AADNPIDDHHTMYTVHFYTGSHAASTESYPPETPNSERGNVM-SN 290
               L            +NP++  + MY  HFY  SH    + Y        R  V  + 
Sbjct: 324 ---SLGVSDGANESEVVNNPVNATNIMYAFHFYAASH---KDDY--------RAAVRPAA 369

Query: 291 TRYAL---ENGVAVFATEW----GTSQANGDGGPYFDEADVWIEFLNENNISWANWSLTN 343
           TR  L   E G  V AT W     +S A             W++ L++  IS+ANW+ ++
Sbjct: 370 TRLPLFVSEFG-TVSATAWSVDRSSSVA-------------WLDLLDQLKISYANWTYSD 415

Query: 344 KNEVSGAFTP 353
            +E S AF P
Sbjct: 416 ADEGSAAFRP 425
</PRE>


<PRE>
><a name = 729644></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00729644&dopt=GenPept">sp|Q07940|GUN4_RUMAL</a> ENDOGLUCANASE IV (ENDO-1,4-BETA-GLUCANASE) (CELLULASE) (EG-IV)
          Length = 312

 Score =  129 bits (297), Expect = 3e-29
 Identities = 109/309 (35%), Positives = 160/309 (51%), Gaps = 83/309 (26%)

Query: 73  GEK-IQLRGMSTHGLQWFPEILNDNAYKALANDWESNMIRLAMYVGE-NGY--ASNP--- 125
           GEK ++L G+STHG+ W+PE + + ++ AL  DW +N IR+AMY  E  GY    N    
Sbjct: 15  GEKPVRLFGLSTHGIAWYPEYICEESFNALKKDWRTNCIRIAMYTDEFRGYCKDGNKQHL 74

Query: 126 -ELIKSRVIKGIDLAIEN-DMYVIVDWHV---HAPGDPRDPV-Y-AGAEDFFRDIAALYP 178
            ELI+    KG+ +A E  DMYVIVDWHV          DP+ Y   AE+FF D++  + 
Sbjct: 75  KELIE----KGVVIA-EKLDMYVIVDWHVLCDQ------DPMKYIDEAEEFFSDMSKRFA 123

Query: 179 NNPHIIYELANEPSSNNNGGAGIPNNEEGWNAVKEYADPIVEMLRDSGNADDNIIIVGSP 238
           N  ++IYE+ NEP+ +   G         W+ + EYAD I+ ++R   N+ D +I+ G+ 
Sbjct: 124 NKTNVIYEICNEPNCS---GT--------WDKITEYADRIIPIIR--SNSPDALIVTGTS 170

Query: 239 NWSQRPDL--AADNPI--DDHHTMYTVHFYTGSHAASTESYPPETPNSERGNVMSNTRYA 294
            WSQ  D+  A + P+  D+   MY++HFY  +H               +G + S  R  
Sbjct: 171 TWSQ--DIHCALEKPLKWDN--VMYSLHFYAATH---------------KGTLRS--R-- 207

Query: 295 L----ENGVAVFATEWGTSQANG----DGGPYFDEADVW---IEFLNENNISWANWSLTN 343
           L    E G+ VF  E+   +A+G    D     DEA+ W   I+ L  + IS   W L+N
Sbjct: 208 LERCIEAGLPVFINEFNLCEASGKGDID----IDEANAWYEVIDRLGLSCIS---WCLSN 260

Query: 344 KNEVSGAFT 352
             +  G FT
Sbjct: 261 SGDTCGVFT 269
</PRE>


<PRE>
><a name = 1176529></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=01176529&dopt=GenPept">sp|P46578|YLB3_CAEEL</a> HYPOTHETICAL 100.9 KD PROTEIN C34E10.3 IN CHROMOSOME III
          Length = 892

 Score = 35.0 bits (75), Expect = 0.71
 Identities = 15/29 (51%), Positives = 18/29 (61%), Gaps = 9/29 (31%)

Query: 717 VKINVRDIT-NI---QDDTLLRNMMIIFA 741
           V+I VR+I  NI   QDD+     MIIFA
Sbjct: 182 VRIAVRNILLNIVRVQDDS-----MIIFA 205
</PRE>


<PRE>
><a name = 1723203></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=01723203&dopt=GenPept">sp|P55178|YAG5_STALU</a> HYPOTHETICAL PROTEIN IN AGR OPERON (ORF 5)
          Length = 234

 Score = 34.1 bits (73), Expect = 1.3
 Identities = 11/21 (52%), Positives = 14/21 (66%), Gaps = 7/21 (33%)

Query: 127 LIKSRVIKGIDLAIENDMYVI 147
           L+K+R       AIEN+MYVI
Sbjct: 156 LLKAR-------AIENNMYVI 169
</PRE>


<PRE>
><a name = 544177></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00544177&dopt=GenPept">sp|Q05646|DNAJ_ERYRH</a> DNAJ PROTEIN
          Length = 370

 Score = 33.3 bits (71), Expect = 2.3
 Identities = 20/46 (43%), Positives = 23/46 (49%), Gaps = 20/46 (43%)

Query: 552 LF----VGT------EGADV-IYLDNI--KVI----GTEVEIPVVH 580
           LF    VGT      EG D+ I   NI   VI    GTE+E+P VH
Sbjct: 251 LFIEIVVGTHKHFRREGNDIHI---NIPLSVIDATLGTEIEVPTVH 293
</PRE>


<PRE>
><a name = 3023420></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=03023420&dopt=GenPept">sp|O08893|CALR_CAVPO</a> CALCITONIN RECEPTOR PRECURSOR (CT-R)
          Length = 478

 Score = 32.9 bits (70), Expect = 3.1
 Identities = 16/35 (45%), Positives = 22/35 (62%), Gaps = 9/35 (25%)

Query: 320 DEADVWIEFLN-ENNISWANWSLTNKNEVSGAFTP 353
           DE+ VW  F + ENN +W+N++L N      AFTP
Sbjct: 113 DESGVW--FKHPENNRTWSNYTLCN------AFTP 139
</PRE>


<PRE>
><a name = 549834></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00549834&dopt=GenPept">sp|Q01611|ZFY1_XENLA</a> ZINC FINGER Y-CHROMOSOMAL PROTEIN 1
          Length = 794

 Score = 32.9 bits (70), Expect = 3.1
 Identities = 14/24 (58%), Positives = 16/24 (66%), Gaps = 6/24 (25%)

Query: 414 QGFGVN-GDSPV-----EDVVIEN 431
           QGFG + GDS V     EDVVIE+
Sbjct: 53  QGFGPDEGDSVVIQDVIEDVVIED 76
</PRE>


<PRE>
><a name = 400222></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00400222&dopt=GenPept">sp|P22533|MANB_CALSA</a> BETA-MANNANASE/ENDOGLUCANASE A PRECURSOR [INCLUDES: MANNAN
           ENDO-1,4-BETA-MANNOSIDASE A (BETA-MANNANASE)
           (ENDO-1,4-MANNANASE); ENDO-1,4-BETA-GLUCANASE
           (CELLULASE)]
          Length = 1331

 Score = 32.4 bits (69), Expect = 4.2
 Identities = 25/85 (29%), Positives = 33/85 (38%), Gaps = 40/85 (47%)

Query: 165 GAEDFFRDIAALYPNNPHIIYELANEPSSNNNGGAGIPNNEEGW-----NAVKEYADPIV 219
           G EDF             +I  + NEP  NNN         + W     NA+K       
Sbjct: 150 GNEDF-------------VIINIGNEPYGNNN--------YQNWVNDTKNAIKA------ 182

Query: 220 EMLRDSG--NADDNIIIVGSPNWSQ 242
             LRD+G  +     I+V +PNW Q
Sbjct: 183 --LRDAGFKHT----IMVDAPNWGQ 201
</PRE>


<PRE>
><a name = 2500204></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02500204&dopt=GenPept">sp|Q59263|RIBF_CORAM</a> RIBOFLAVIN BIOSYNTHESIS PROTEIN RIBF [INCLUDES: RIBOFLAVIN KINASE
           (FLAVOKINASE); FMN ADENYLYLTRANSFERASE (FAD
           PYROPHOSPHORYLASE) (FAD SYNTHETASE)]
          Length = 338

 Score = 32.0 bits (68), Expect = 5.6
 Identities = 11/28 (39%), Positives = 17/28 (60%), Gaps = 6/28 (21%)

Query: 320 DEADVWI------EFLNENNISWANWSL 341
           D+  V I      EFL+E +++ ANW+L
Sbjct: 156 DDEGVRISSTTVREFLSEGDVARANWAL 183
</PRE>


<PRE>
><a name = 113377></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00113377&dopt=GenPept">sp|P04707|ADH2_MAIZE</a> ALCOHOL DEHYDROGENASE 2
          Length = 379

 Score = 32.0 bits (68), Expect = 5.6
 Identities = 37/100 (37%), Positives = 45/100 (45%), Gaps = 42/100 (42%)

Query: 387 RIKGVNYEPIDRTKY--TKVLWDFNDGTKQGFG----VNG---DSPVEDVVIENEAGALK 437
           RI GV+   I+  KY   K         K  FG    VN    D PV++V+IE     L 
Sbjct: 221 RIIGVD---INPAKYEQAK---------K--FGCTEFVNPKDHDKPVQEVLIE-----LT 261

Query: 438 LSGLDASNDVSE--GNYWANARLSA-----DGWGKSVDIL 470
             G+D S  V E  GN   NA +SA     DGWG  V +L
Sbjct: 262 NGGVDRS--V-ECTGN--VNAMISAFECVHDGWG--VAVL 294
</PRE>


<PRE>
><a name = 118498></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00118498&dopt=GenPept">sp|P08157|DHAL_EMENI</a> ALDEHYDE DEHYDROGENASE (ALDDH)
          Length = 497

 Score = 31.6 bits (67), Expect = 7.5
 Identities = 10/20 (50%), Positives = 13/20 (65%), Gaps = 6/20 (30%)

Query: 319 FDEADVWIEFLNENNISWAN 338
           FD+AD+      +N ISWAN
Sbjct: 274 FDDADI------DNAISWAN 287
</PRE>


<PRE>
><a name = 1706251></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=01706251&dopt=GenPept">sp|P52014|CYP6_CAEEL</a> PEPTIDYL-PROLYL CIS-TRANS ISOMERASE 6 PRECURSOR (PPIASE) (ROTAMASE)
           (CYCLOPHILIN-6)
          Length = 201

 Score = 31.6 bits (67), Expect = 7.5
 Identities = 11/15 (73%), Positives = 12/15 (79%), Gaps = 1/15 (6%)

Query: 420 GDSPVEDVVIENEAG 434
           GD P+EDVVI N AG
Sbjct: 172 GDRPIEDVVIAN-AG 185
</PRE>


<PRE>
><a name = 2498024></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02498024&dopt=GenPept">sp|Q04439|YMZ9_YEAST</a>  HYPOTHETICAL MYOSIN-LIKE PROTEIN IN ILV2-ADE17 INTERGENIC REGION
          Length = 1219

 Score = 31.6 bits (67), Expect = 7.5
 Identities = 15/46 (32%), Positives = 20/46 (42%), Gaps = 22/46 (47%)

Query: 690 VQAPKTYTINFDELEEPNQVNGLYHYEVKINVRDI-----TNIQDD 730
           VQ   TYT ++                 KI+VR+I     TN+QDD
Sbjct: 850 VQNAMTYTQDY-----------------KIDVRNIQAVSLTNLQDD 878
</PRE>


<PRE>
><a name = 2494401></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02494401&dopt=GenPept">sp|P94550|ETFB_BACSU</a> ELECTRON TRANSFER FLAVOPROTEIN BETA-SUBUNIT (BETA-ETF) (ELECTRON
           TRANSFER FLAVOPROTEIN SMALL SUBUNIT) (ETFSS)
          Length = 257

 Score = 31.6 bits (67), Expect = 7.5
 Identities = 12/24 (50%), Positives = 15/24 (62%), Gaps = 8/24 (33%)

Query: 698 INF-DELEEPN-----QVNGLYHY 715
           IN  D+L+EP+     QV  LYHY
Sbjct: 83  INIEDDLDEPDQYSISQV--LYHY 104
</PRE>



<PRE>
  Database: Non-redundant SwissProt sequences
    Posted date:  Aug 1, 2000 10:38 PM
  Number of letters in database: 31,799,033
  Number of sequences in database:  88,237
  
Lambda     K      H
   0.335    0.279     1.72 

Gapped
Lambda     K      H
   0.295    0.120    0.850 


Matrix: PAM30
Gap Penalties: Existence: 9, Extension: 1
Number of Hits to DB: 88935675
Number of Sequences: 88237
Number of extensions: 7045419
Number of successful extensions: 7386
Number of sequences better than 10.0: 30
Number of HSP''s better than 10.0 without gapping: 19
Number of HSP''s successfully gapped in prelim test: 11
Number of HSP''s that attempted gapping in prelim test: 7243
Number of HSP''s gapped (non-prelim): 47
length of query: 800
length of database: 31,799,033
effective HSP length: 13
effective length of query: 787
effective length of database: 30,651,952
effective search space: 24123086224
effective search space used: 24123086224
T: 11
A: 40
X1: 15 ( 7.3 bits)
X2: 35 (14.9 bits)
X3: 58 (24.7 bits)
S1: 41 (21.7 bits)
S2: 67 (31.6 bits)

</PRE>

</BODY>
</HTML>
</FORM>
</BODY>
</HTML>
'
]

{ #category : #'results-ready' }
BioWebBlastSamples >> bt064Txt [
	"WARNING: This is code generated automatically.
 On: 27 December 2010 - 5:37:14 pm"

	^ '

<p><!--
QBlastInfoBegin
	Status=READY
QBlastInfoEnd
--><p><TITLE>Results for RID 984887321-25017-7612 </TITLE>
<HTML>
<HEAD>
<TITLE>BLAST Search Results </TITLE>
</HEAD>
<BODY BGCOLOR="#FFFFFF" LINK="#0000FF" VLINK="#660099" ALINK="#660099">
<A HREF="http://www.ncbi.nlm.nih.gov/BLAST/blast_form.map"> <IMG SRC="http://www.ncbi.nlm.nih.gov/BLAST/blast_results.gif" BORDER=0 ISMAP></A>
<BR><BR><PRE>
<b>BLASTN 2.1.2 [Nov-13-2000]</b>


<b><a href="http://www.ncbi.nlm.nih.gov/htbin-
post/Entrez/query?uid=9254694&form=6&db=m&Dopt=r">Reference</a>:</b>
Altschul, Stephen F., Thomas L. Madden, Alejandro A. Sch&auml;ffer, 
Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), 
"Gapped BLAST and PSI-BLAST: a new generation of protein database search
programs",  Nucleic Acids Res. 25:3389-3402.
<p>
RID: 984887321-25017-7612
<p>
<p>
<b>Database:</b> nt
           816,659 sequences; 2,928,690,202 total letters

<p> <p>If you have any problems or questions with the results of this search <br>please refer to the <b><a href=http://www.ncbi.nlm.nih.gov/blast/blast_FAQs.html>BLAST FAQs</a></b><br><p>
<FORM NAME="BLASTFORM" METHOD="POST">
<INPUT TYPE="hidden" NAME="PAGE" VALUE ="NUCLEOTIDES"><INPUT TYPE="hidden" NAME="EXPECT" VALUE ="10"><INPUT TYPE="hidden" NAME="DESCRIPTIONS" VALUE ="100"><INPUT TYPE="hidden" NAME="ALIGNMENTS" VALUE ="50"><INPUT TYPE="hidden" NAME="AUTO_FORMAT" VALUE ="yes"><a href="blast.cgi?RID=984887321-25017-7612&ALIGNMENT_VIEW=17" TARGET="Taxonomy BLAST Results for 984887321-25017-7612">Taxonomy reports</a>
<BR>
<b>Query=</b> gi|8332116|gb|BE037100.1|BE037100 MP14H09 MP
Mesembryanthemum crystallinum cDNA 5'' similar to cold acclimation
protein, mRNA sequence
         (1111 letters)

<PRE>


                                                                   Score     E
Sequences producing significant alignments:                        (bits)  Value

<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=10121840&dopt=GenBank">gb|AF283004.1|AF283004</a>  Arabidopsis thaliana cold acclimatio...   <a href = #10121840> 46</a>  0.042
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=06598567&dopt=GenBank">gb|AC006438.3|AC006438</a>  Arabidopsis thaliana chromosome II s...   <a href = #6598567> 46</a>  0.042
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=11127594&dopt=GenBank">dbj|AB044404.1|AB044404</a>  Arabidopsis thaliana FL3-5A3 mRNA f...   <a href = #11127594> 46</a>  0.042
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=04376087&dopt=GenBank">emb|Z99707.1|ATAP21</a>  Arabidopsis thaliana DNA chromosome 4, ...   <a href = #4376087> 44</a>  0.17
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=07270703&dopt=GenBank">emb|AL161591.2|ATCHRIV87</a>  Arabidopsis thaliana DNA chromosom...   <a href = #7270703> 44</a>  0.17
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=10121844&dopt=GenBank">gb|AF283006.1|AF283006</a>  Oryza sativa cold acclimation protei...   <a href = #10121844> 42</a>  0.66
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=11190569&dopt=GenBank">emb|AL359511.16|AL359511</a>  Human DNA sequence from clone RP1-...   <a href = #11190569> 42</a>  0.66
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12545282&dopt=GenBank">gb|AC008529.4|AC008529</a>  Homo sapiens chromosome 5 clone CTC-...   <a href = #12545282> 40</a>  2.6
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=10727724&dopt=GenBank">gb|AE003837.2|AE003837</a>  Drosophila melanogaster genomic scaf...   <a href = #10727724> 40</a>  2.6
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=10121842&dopt=GenBank">gb|AF283005.1|AF283005</a>  Arabidopsis thaliana cold acclimatio...   <a href = #10121842> 40</a>  2.6
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=04165334&dopt=GenBank">gb|AC006421.1|AC006421</a>  Drosophila melanogaster, chromosome ...   <a href = #4165334> 40</a>  2.6
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=04140591&dopt=GenBank">gb|AF087457.1|AF087457</a>  Mesocricetus auratus N-acetylglucosa...   <a href = #4140591> 40</a>  2.6
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=04140589&dopt=GenBank">gb|AF087456.1|AF087456</a>  Mesocricetus auratus N-acetylglucosa...   <a href = #4140589> 40</a>  2.6
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=01531640&dopt=GenBank">gb|U65792.1|CGU65792</a>  Cricetulus griseus mutant N-acetylgluc...   <a href = #1531640> 40</a>  2.6
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=01531638&dopt=GenBank">gb|U65791.1|CGU65791</a>  Cricetulus griseus N-acetylglucoaminyl...   <a href = #1531638> 40</a>  2.6
</PRE>
<CENTER><b><FONT color="green">Alignments</FONT></b></CENTER>
<PRE>
><a name = 10121840></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=10121840&dopt=GenBank">gb|AF283004.1|AF283004</a> Arabidopsis thaliana cold acclimation protein WCOR413-like protein
           alpha form mRNA, complete cds
          Length = 783

 Score = 46.1 bits (23), Expect = 0.042
 Identities = 68/83 (81%)
 Strand = Plus / Plus

                                                                       
Query: 249 tacttgttgatattggatcgaacaaactggagaaccaacatgctcacgtcacttttagtc 308
           ||||||||| | ||||||||||| || ||||  || || |||||||| |||||| |  | 
Sbjct: 237 tacttgttggtgttggatcgaaccaattggaagacgaatatgctcacatcacttctcatt 296

                                  
Query: 309 ccttacatattcctcagtcttcc 331
           |||||||| ||| ||||||||||
Sbjct: 297 ccttacatcttcttcagtcttcc 319
</PRE>


<PRE>
><a name = 6598567></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=06598567&dopt=GenBank">gb|AC006438.3|AC006438</a> Arabidopsis thaliana chromosome II section 92 of 255 of the complete
             sequence. Sequence from clones F19G14, F7H1
          Length = 87803

 Score = 46.1 bits (23), Expect = 0.042
 Identities = 68/83 (81%)
 Strand = Plus / Plus

                                                                         
Query: 249   tacttgttgatattggatcgaacaaactggagaaccaacatgctcacgtcacttttagtc 308
             ||||||||| | ||||||||||| || ||||  || || |||||||| |||||| |  | 
Sbjct: 85104 tacttgttggtgttggatcgaaccaattggaagacgaatatgctcacatcacttctcatt 85163

                                    
Query: 309   ccttacatattcctcagtcttcc 331
             |||||||| ||| ||||||||||
Sbjct: 85164 ccttacatcttcttcagtcttcc 85186
</PRE>


<PRE>
><a name = 11127594></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=11127594&dopt=GenBank">dbj|AB044404.1|AB044404</a> Arabidopsis thaliana FL3-5A3 mRNA for cold acclimation protein
           homolog, complete cds
          Length = 820

 Score = 46.1 bits (23), Expect = 0.042
 Identities = 68/83 (81%)
 Strand = Plus / Plus

                                                                       
Query: 249 tacttgttgatattggatcgaacaaactggagaaccaacatgctcacgtcacttttagtc 308
           ||||||||| | ||||||||||| || ||||  || || |||||||| |||||| |  | 
Sbjct: 244 tacttgttggtgttggatcgaaccaattggaagacgaatatgctcacatcacttctcatt 303

                                  
Query: 309 ccttacatattcctcagtcttcc 331
           |||||||| ||| ||||||||||
Sbjct: 304 ccttacatcttcttcagtcttcc 326
</PRE>


<PRE>
><a name = 4376087></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=04376087&dopt=GenBank">emb|Z99707.1|ATAP21</a> Arabidopsis thaliana DNA chromosome 4, ESSA I AP2 contig fragment No. 1
          Length = 206420

 Score = 44.1 bits (22), Expect = 0.17
 Identities = 31/34 (91%)
 Strand = Plus / Minus

                                               
Query: 253   tgttgatattggatcgaacaaactggagaaccaa 286
             |||||||||||||||| || ||||||| ||||||
Sbjct: 52308 tgttgatattggatcgtaccaactggaaaaccaa 52275
</PRE>


<PRE>
><a name = 7270703></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=07270703&dopt=GenBank">emb|AL161591.2|ATCHRIV87</a> Arabidopsis thaliana DNA chromosome 4, contig fragment No. 87
          Length = 196339

 Score = 44.1 bits (22), Expect = 0.17
 Identities = 31/34 (91%)
 Strand = Plus / Plus

                                              
Query: 253  tgttgatattggatcgaacaaactggagaaccaa 286
            |||||||||||||||| || ||||||| ||||||
Sbjct: 9146 tgttgatattggatcgtaccaactggaaaaccaa 9179
</PRE>


<PRE>
><a name = 10121844></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=10121844&dopt=GenBank">gb|AF283006.1|AF283006</a> Oryza sativa cold acclimation protein WCOR413-like protein mRNA,
           complete cds
          Length = 1057

 Score = 42.1 bits (21), Expect = 0.66
 Identities = 33/37 (89%)
 Strand = Plus / Plus

                                                
Query: 256 tgatattggatcgaacaaactggagaaccaacatgct 292
           ||||||||||| | ||||||||||  |||||||||||
Sbjct: 316 tgatattggataggacaaactggaagaccaacatgct 352
</PRE>


<PRE>
><a name = 11190569></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=11190569&dopt=GenBank">emb|AL359511.16|AL359511</a> Human DNA sequence from clone RP1-298M8 on chromosome 20, complete
            sequence [Homo sapiens]
          Length = 63264

 Score = 42.1 bits (21), Expect = 0.66
 Identities = 21/21 (100%)
 Strand = Plus / Minus

                                 
Query: 61   agaaaatggggagagaaatga 81
            |||||||||||||||||||||
Sbjct: 9450 agaaaatggggagagaaatga 9430
</PRE>


<PRE>
><a name = 12545282></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12545282&dopt=GenBank">gb|AC008529.4|AC008529</a> Homo sapiens chromosome 5 clone CTC-475P15, complete sequence
          Length = 169557

 Score = 40.1 bits (20), Expect = 2.6
 Identities = 20/20 (100%)
 Strand = Plus / Plus

                                 
Query: 207   ggcactcatttcctcaaatg 226
             ||||||||||||||||||||
Sbjct: 33167 ggcactcatttcctcaaatg 33186
</PRE>


<PRE>
><a name = 10727724></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=10727724&dopt=GenBank">gb|AE003837.2|AE003837</a> Drosophila melanogaster genomic scaffold 142000013386047 section 6 of
             52, complete sequence
          Length = 234905

 Score = 40.1 bits (20), Expect = 2.6
 Identities = 20/20 (100%)
 Strand = Plus / Plus

                                 
Query: 156   gcaacaatgaggctcatcaa 175
             ||||||||||||||||||||
Sbjct: 20459 gcaacaatgaggctcatcaa 20478
</PRE>


<PRE>
><a name = 10121842></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=10121842&dopt=GenBank">gb|AF283005.1|AF283005</a> Arabidopsis thaliana cold acclimation protein WCOR413-like protein
           beta form mRNA, complete cds
          Length = 884

 Score = 40.1 bits (20), Expect = 2.6
 Identities = 47/56 (83%)
 Strand = Plus / Plus

                                                                   
Query: 246 atttacttgttgatattggatcgaacaaactggagaaccaacatgctcacgtcact 301
           ||||||||||| || |||||||| || || |||| |||||| ||||| || |||||
Sbjct: 212 atttacttgttaattttggatcgtaccaattggaaaaccaagatgcttacatcact 267
</PRE>


<PRE>
><a name = 4165334></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=04165334&dopt=GenBank">gb|AC006421.1|AC006421</a> Drosophila melanogaster, chromosome 2R, region 44C1-44C5, P1 clones
            DS08614 and DS00667, complete sequence
          Length = 100575

 Score = 40.1 bits (20), Expect = 2.6
 Identities = 20/20 (100%)
 Strand = Plus / Plus

                                
Query: 156  gcaacaatgaggctcatcaa 175
            ||||||||||||||||||||
Sbjct: 8902 gcaacaatgaggctcatcaa 8921
</PRE>


<PRE>
><a name = 4140591></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=04140591&dopt=GenBank">gb|AF087457.1|AF087457</a> Mesocricetus auratus N-acetylglucosaminyltransferase I mutant mRNA,
           complete cds
          Length = 1344

 Score = 40.1 bits (20), Expect = 2.6
 Identities = 23/24 (95%)
 Strand = Plus / Plus

                                   
Query: 462 ctggtggtggcaccagacttcttt 485
           |||| |||||||||||||||||||
Sbjct: 640 ctggaggtggcaccagacttcttt 663
</PRE>


<PRE>
><a name = 4140589></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=04140589&dopt=GenBank">gb|AF087456.1|AF087456</a> Mesocricetus auratus N-acetylglucosaminyltransferase I mRNA,
           complete cds
          Length = 1344

 Score = 40.1 bits (20), Expect = 2.6
 Identities = 23/24 (95%)
 Strand = Plus / Plus

                                   
Query: 462 ctggtggtggcaccagacttcttt 485
           |||| |||||||||||||||||||
Sbjct: 640 ctggaggtggcaccagacttcttt 663
</PRE>


<PRE>
><a name = 1531640></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=01531640&dopt=GenBank">gb|U65792.1|CGU65792</a> Cricetulus griseus mutant N-acetylglucosaminyltransferase I mRNA,
           complete cds
          Length = 1344

 Score = 40.1 bits (20), Expect = 2.6
 Identities = 23/24 (95%)
 Strand = Plus / Plus

                                   
Query: 462 ctggtggtggcaccagacttcttt 485
           |||| |||||||||||||||||||
Sbjct: 640 ctggaggtggcaccagacttcttt 663
</PRE>


<PRE>
><a name = 1531638></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=01531638&dopt=GenBank">gb|U65791.1|CGU65791</a> Cricetulus griseus N-acetylglucoaminyltransferase I mRNA, complete
           cds
          Length = 1344

 Score = 40.1 bits (20), Expect = 2.6
 Identities = 23/24 (95%)
 Strand = Plus / Plus

                                   
Query: 462 ctggtggtggcaccagacttcttt 485
           |||| |||||||||||||||||||
Sbjct: 640 ctggaggtggcaccagacttcttt 663
</PRE>



<PRE>
  Database: nt
    Posted date:  Mar 17, 2001  1:49 AM
  Number of letters in database: 2,928,690,202
  Number of sequences in database:  816,659
  
Lambda     K      H
    1.37    0.711     1.31 

Gapped
Lambda     K      H
    1.37    0.711     1.31 


Matrix: blastn matrix:1 -3
Gap Penalties: Existence: 5, Extension: 2
Number of Hits to DB: 1106713
Number of Sequences: 816659
Number of extensions: 1106713
Number of successful extensions: 5784
Number of sequences better than 10.0: 15
length of query: 1111
length of database: 2,928,690,202
effective HSP length: 21
effective length of query: 1090
effective length of database: 2,911,540,363
effective search space: 3173578995670
effective search space used: 3173578995670
T: 0
A: 30
X1: 6 (11.9 bits)
X2: 15 (29.7 bits)
S1: 12 (24.3 bits)
S2: 20 (40.1 bits)

</PRE>

</BODY>
</HTML>
</FORM>


'
]

{ #category : #'results-ready' }
BioWebBlastSamples >> bt066Txt [
	"WARNING: This is code generated automatically.
 On: 27 December 2010 - 5:37:14 pm"

	^ '<form action="Blast.cgi" enctype="application/x-www-form-urlencoded" method="POST"><input name="ALIGNMENTS" type="hidden" value="50"><input name="AUTO_FORMAT" type="hidden" value="on"><input name="CLIENT" type="hidden" value="web"><input name="DESCRIPTIONS" type="hidden" value="100"><input name="EXPECT" type="hidden" value="10"><input name="HITLIST_SIZE" type="hidden" value="500"><input name="I_THRESH" type="hidden" value="0.001"><input name="LAYOUT" type="hidden" value="OneWindow"><input name="NCBI_GI" type="hidden" value="checked"><input name="PAGE" type="hidden" value="Proteins"><input name="RID" type="hidden" value="991617086-13184-28031"><input name="RTOE" type="hidden" value="25"><input name="SHOW_OVERVIEW" type="hidden" value="checked"><input name="STEP_NUMBER" type="hidden" value="1"><input name="CMD" type="hidden" value="Get"></form>
<form action="Blast.cgi" enctype="application/x-www-form-urlencoded" method="POST" TARGET=""><input name="ALIGNMENTS" type="hidden" value="50"><input name="AUTO_FORMAT" type="hidden" value="on"><input name="CLIENT" type="hidden" value="web"><input name="DESCRIPTIONS" type="hidden" value="100"><input name="EXPECT" type="hidden" value="10"><input name="HITLIST_SIZE" type="hidden" value="500"><input name="I_THRESH" type="hidden" value="0.001"><input name="LAYOUT" type="hidden" value="OneWindow"><input name="NCBI_GI" type="hidden" value="checked"><input name="PAGE" type="hidden" value="Proteins"><input name="RID" type="hidden" value="991617086-13184-28031"><input name="RTOE" type="hidden" value="25"><input name="SHOW_OVERVIEW" type="hidden" value="checked"><input name="STEP_NUMBER" type="hidden" value="1"><input name="CMD" type="hidden" value="Put">

<p><!--
QBlastInfoBegin
	Status=READY
QBlastInfoEnd
--><p><b>BLASTP 2.1.3 [Apr-11-2001]</b>

<pre>
<b><a href="http://www.ncbi.nlm.nih.gov/htbin-
post/Entrez/query?uid=9254694&form=6&db=m&Dopt=r">Reference</a>:</b>
Altschul, Stephen F., Thomas L. Madden, Alejandro A. Sch&auml;ffer, 
Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), 
"Gapped BLAST and PSI-BLAST: a new generation of protein database search
programs",  Nucleic Acids Res. 25:3389-3402.
<p>
RID: 991617086-13184-28031
<p>
<b>Query=</b> gi|1174726|sp|P12921|TMRB_BACSU TUNICAMYCIN RESISTANCE
PROTEIN
         (197 letters)

<p>
<b>Database:</b> nr
           693,878 sequences; 218,617,282 total letters

<p> <p>If you have any problems or questions with the results of this search <br>please refer to the <b><a href=http://www.ncbi.nlm.nih.gov/blast/blast_FAQs.html>BLAST FAQs</a></b><br><p>
<a href="Blast.cgi?CMD=Get&RID=991617086-13184-28031&FORMAT_OBJECT=TaxBlast" TARGET="Taxonomy BLAST Results for 991617086-13184-28031">Taxonomy reports</a>
<BR>
<PRE>


                                                                   Score     E
Sequences producing significant alignments:                        (bits)  Value

<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00216351&dopt=GenPept" >dbj|BAA02945.1|</a>  (D13793) ORF [Bacillus subtilis]                 <a href = #216351>397</a>  e-110
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00216350&dopt=GenPept" >dbj|BAA02944.1|</a>  (D13793) ORF [Bacillus subtilis] >gi|226067...   <a href = #216350>397</a>  e-110
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00216352&dopt=GenPept" >dbj|BAA02946.1|</a>  (D13793) ORF [Bacillus subtilis]                 <a href = #216352>397</a>  e-110
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07531279&dopt=GenPept" >sp|P12921|TMRB_BACSU</a>  TUNICAMYCIN RESISTANCE PROTEIN >gi|742...   <a href = #7531279>396</a>  e-109
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07481802&dopt=GenPept" >pir||T36076</a>  tmrB-like protein - Streptomyces coelicolor >gi...   <a href = #7481802>144</a>  1e-33
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07471142&dopt=GenPept" >pir||F75399</a>  antibiotic resistance protein - Deinococcus rad...   <a href = #7471142>114</a>  1e-24
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00045945&dopt=GenPept" >emb|CAA31896.1|</a>  (X13543) unidentified peptide (AA 1-92) (13...   <a href = #45945> 90</a>  3e-17
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=08744968&dopt=GenPept" >emb|CAB95294.1|</a>  (AL359779) putative bifunctional protein (A...   <a href = #8744968> 87</a>  2e-16
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00423877&dopt=GenPept" >pir||S06033</a>  hypothetical protein - Enterobacteriaceae plasm...   <a href = #423877> 86</a>  5e-16
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07479146&dopt=GenPept" >pir||T36817</a>  ATP/GTP-binding protein - Streptomyces coelicol...   <a href = #7479146> 86</a>  5e-16
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00423876&dopt=GenPept" >pir||S06031</a>  hypothetical protein - Enterobacteriaceae plasm...   <a href = #423876> 83</a>  4e-15
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00096587&dopt=GenPept" >pir||S06034</a>  hypothetical protein - Klebsiella pneumoniae pl...   <a href = #96587> 82</a>  9e-15
</PRE>
<CENTER><b><FONT color="green">Alignments</FONT></b></CENTER>
<PRE>
><a name = 216351></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00216351&dopt=GenPept" >dbj|BAA02945.1|</a> (D13793) ORF [Bacillus subtilis]
          Length = 199

 Score =  397 bits (1021), Expect = e-110
 Identities = 197/197 (100%), Positives = 197/197 (100%)

Query: 1   MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA 60
           MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA
Sbjct: 3   MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA 62

Query: 61  FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLR 120
           FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLR
Sbjct: 63  FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLR 122

Query: 121 TRAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL 180
           TRAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL
Sbjct: 123 TRAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL 182

Query: 181 RRFADRLMVKLNHIRIK 197
           RRFADRLMVKLNHIRIK
Sbjct: 183 RRFADRLMVKLNHIRIK 199
</PRE>


<PRE>
><a name = 216350></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00216350&dopt=GenPept" >dbj|BAA02944.1|</a> (D13793) ORF [Bacillus subtilis]
 <a name = 226067></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00226067&dopt=GenPept" >prf||1410166A</a> tunicamycin resistance gene tmrB [Escherichia coli]
          Length = 206

 Score =  397 bits (1021), Expect = e-110
 Identities = 197/197 (100%), Positives = 197/197 (100%)

Query: 1   MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA 60
           MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA
Sbjct: 10  MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA 69

Query: 61  FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLR 120
           FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLR
Sbjct: 70  FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLR 129

Query: 121 TRAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL 180
           TRAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL
Sbjct: 130 TRAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL 189

Query: 181 RRFADRLMVKLNHIRIK 197
           RRFADRLMVKLNHIRIK
Sbjct: 190 RRFADRLMVKLNHIRIK 206
</PRE>


<PRE>
><a name = 216352></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00216352&dopt=GenPept" >dbj|BAA02946.1|</a> (D13793) ORF [Bacillus subtilis]
          Length = 197

 Score =  397 bits (1021), Expect = e-110
 Identities = 197/197 (100%), Positives = 197/197 (100%)

Query: 1   MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA 60
           MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA
Sbjct: 1   MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA 60

Query: 61  FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLR 120
           FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLR
Sbjct: 61  FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLR 120

Query: 121 TRAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL 180
           TRAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL
Sbjct: 121 TRAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL 180

Query: 181 RRFADRLMVKLNHIRIK 197
           RRFADRLMVKLNHIRIK
Sbjct: 181 RRFADRLMVKLNHIRIK 197
</PRE>


<PRE>
><a name = 7531279></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07531279&dopt=GenPept" >sp|P12921|TMRB_BACSU</a> TUNICAMYCIN RESISTANCE PROTEIN
 <a name = 7428961></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07428961&dopt=GenPept" >pir||YTBST</a> tunicamycin resistance protein - Bacillus subtilis
 <a name = 1805386></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=01805386&dopt=GenPept" >dbj|BAA08948.1|</a> (D50453) tunicamycin resistance protein [Bacillus subtilis]
 <a name = 2632600></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=02632600&dopt=GenPept" >emb|CAB12108.1|</a> (Z99105) ATP-binding membrane protein [Bacillus subtilis]
          Length = 197

 Score =  396 bits (1018), Expect = e-109
 Identities = 196/197 (99%), Positives = 197/197 (99%)

Query: 1   MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA 60
           MIIWINGAFGSGKTQTAFELHRRLNPSYVYDP+KMGFALRSMVPQEIAKDDFQSYPLWRA
Sbjct: 1   MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPQKMGFALRSMVPQEIAKDDFQSYPLWRA 60

Query: 61  FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLR 120
           FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLR
Sbjct: 61  FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLR 120

Query: 121 TRAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL 180
           TRAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL
Sbjct: 121 TRAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL 180

Query: 181 RRFADRLMVKLNHIRIK 197
           RRFADRLMVKLNHIRIK
Sbjct: 181 RRFADRLMVKLNHIRIK 197
</PRE>


<PRE>
><a name = 7481802></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07481802&dopt=GenPept" >pir||T36076</a> tmrB-like protein - Streptomyces coelicolor
 <a name = 4585834></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=04585834&dopt=GenPept" >emb|CAB40928.1|</a> (AL049630) TmrB-like protein [Streptomyces coelicolor A3(2)]
          Length = 213

 Score =  144 bits (363), Expect = 1e-33
 Identities = 78/197 (39%), Positives = 112/197 (56%), Gaps = 18/197 (9%)

Query: 17  AFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRAFNYSLLASLTDTYRGI 76
           A E+ RRL  S V DPE  GF LR M+P E+ ++DFQ    WR     +L      + G+
Sbjct: 17  AHEIRRRLPGSVVCDPEHAGFGLRRMLPPEL-REDFQDLVSWRQGVVEVLDLALTRHDGV 75

Query: 77  LIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLRTRAEG----------- 125
           +I PMT+  P YF E +GRLR+ G  VHHF+L+A++ET+L+RLR R  G           
Sbjct: 76  VIAPMTVTDPGYFAETVGRLRELGHDVHHFSLLAARETVLRRLRERGPGHALRYVTGKAG 135

Query: 126 ------KNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGS 179
                 + SWA +Q+D C+E L+ P F +H+ TD+ ++   A+ IA  A L L P+  G+
Sbjct: 136 QGSGPRRESWAVRQLDHCLERLAEPEFAEHLWTDHTTVPKTADRIAVLAGLTLKPNNEGA 195

Query: 180 LRRFADRLMVKLNHIRI 196
           LR    +  V + HIR+
Sbjct: 196 LRTRMRQAGVGIRHIRV 212
</PRE>


<PRE>
><a name = 7471142></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07471142&dopt=GenPept" >pir||F75399</a> antibiotic resistance protein - Deinococcus radiodurans  (strain
           R1)
 <a name = 6459170></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=06459170&dopt=GenPept" >gb|AAF10983.1|AE001986_8</a> (AE001986) antibiotic resistance protein [Deinococcus radiodurans]
          Length = 195

 Score =  114 bits (286), Expect = 1e-24
 Identities = 70/179 (39%), Positives = 95/179 (52%), Gaps = 4/179 (2%)

Query: 2   IIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRAF 61
           IIWING FG GKT TA  LH RL  S+V++PE+MG ALR + P      D Q +P+W   
Sbjct: 8   IIWINGPFGVGKTHTAHTLHERLPGSFVFEPEEMGQALRKLTPG--FSGDPQEHPMWIPL 65

Query: 62  NYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRLRT 121
               L   +    G LIVP++I        ++  L+  G  VHHFTL+A    +L+RL  
Sbjct: 66  MLDALQYASREAAGPLIVPVSISDTARHRRLMSGLKDRGLSVHHFTLIAPLNVVLERL-- 123

Query: 122 RAEGKNSWAAKQIDRCVEGLSSPIFEDHIQTDNLSIQDVAENIAARAELPLDPDTRGSL 180
           R +G+       ++  +  L    F+ HI T  L  Q VAE IAA+  L L P  +G+L
Sbjct: 124 RRDGQPQVNVGTVEDRLNELRGEQFQTHIDTAGLGTQQVAEQIAAQVGLTLAPPPQGAL 182
</PRE>


<PRE>
><a name = 45945></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00045945&dopt=GenPept" >emb|CAA31896.1|</a> (X13543) unidentified peptide (AA 1-92) (1336 is 2nd base in
          codon) [Enterobacteriaceae]
          Length = 92

 Score = 90.1 bits (222), Expect = 3e-17
 Identities = 41/93 (44%), Positives = 58/93 (62%), Gaps = 1/93 (1%)

Query: 1  MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA 60
          MIIWING FG+GKT  A  L  R + S ++DPE++GF ++  VP   A  D+Q  PLWR 
Sbjct: 1  MIIWINGPFGAGKTTLAERLRDRRSKSLIFDPEEIGFVVKETVPMP-ASGDYQDLPLWRG 59

Query: 61 FNYSLLASLTDTYRGILIVPMTIVHPEYFNEII 93
             + +  +   Y   +I+PMT+VHP+Y  EI+
Sbjct: 60 LTIAAVREIRRNYSQDIIIPMTLVHPDYLTEIL 92
</PRE>


<PRE>
><a name = 8744968></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=08744968&dopt=GenPept" >emb|CAB95294.1|</a> (AL359779) putative bifunctional protein (ATP/GTP binding
           protein/MutT-like) [Streptomyces coelicolor A3(2)]
          Length = 347

 Score = 87.4 bits (215), Expect = 2e-16
 Identities = 48/123 (39%), Positives = 70/123 (56%), Gaps = 2/123 (1%)

Query: 2   IIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKD--DFQSYPLWR 59
           ++WINGAFG+GKT TA EL   +  S ++DPE +G AL  ++P +   +  DFQ  P+WR
Sbjct: 3   VVWINGAFGAGKTTTARELIELIPNSTLFDPEVVGGALAHLLPPKRLAEVGDFQDLPIWR 62

Query: 60  AFNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRL 119
                  A+L     G L+VPMT++  EY +EI G L      V H  L  ++  L +R+
Sbjct: 63  RLVIDTAAALLADLGGTLVVPMTLLRQEYRDEIFGGLAARRIEVRHILLAPAETILRERI 122

Query: 120 RTR 122
            +R
Sbjct: 123 ASR 125
</PRE>


<PRE>
><a name = 423877></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00423877&dopt=GenPept" >pir||S06033</a> hypothetical protein - Enterobacteriaceae plasmid pWP14a
          (fragment)
 <a name = 45942></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00045942&dopt=GenPept" >emb|CAA31894.1|</a> (X13542) hypothetical protein [Plasmid pWP14a]
          Length = 92

 Score = 86.3 bits (212), Expect = 5e-16
 Identities = 40/93 (43%), Positives = 58/93 (62%), Gaps = 1/93 (1%)

Query: 1  MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA 60
          MIIWING FG+GKT  A  L  R   S ++DPE++GF ++  VP   A  D+Q  PLWR 
Sbjct: 1  MIIWINGPFGAGKTTLAERLRDRRPKSLIFDPEEIGFVVKETVPIP-ASGDYQDLPLWRG 59

Query: 61 FNYSLLASLTDTYRGILIVPMTIVHPEYFNEII 93
             + ++ +   Y   +I+PMT+V+P+Y  EI+
Sbjct: 60 LTIAAVSEIRRNYSQDIIIPMTLVYPDYLTEIL 92
</PRE>


<PRE>
><a name = 7479146></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07479146&dopt=GenPept" >pir||T36817</a> ATP/GTP-binding protein - Streptomyces coelicolor
 <a name = 3581837></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=03581837&dopt=GenPept" >emb|CAA20793.1|</a> (AL031541) ATP/GTP binding protein [Streptomyces coelicolor A3(2)]
          Length = 174

 Score = 86.3 bits (212), Expect = 5e-16
 Identities = 47/119 (39%), Positives = 64/119 (53%)

Query: 1   MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA 60
           MI+W+NG  G+GKT T   + R L  S V+D EK+G  L  + P     D+FQ +  WR 
Sbjct: 1   MIVWLNGTHGAGKTTTGALVQRLLPDSRVFDAEKVGETLMDITPGLPDTDNFQHWAPWRP 60

Query: 61  FNYSLLASLTDTYRGILIVPMTIVHPEYFNEIIGRLRQEGRIVHHFTLMASKETLLKRL 119
                   + D   G L++PMT++  EY+ EI G L   G  V HF L A +ETL  R+
Sbjct: 61  LVVETARRVLDYTGGTLVMPMTVLVEEYWREIAGGLAAHGVPVRHFVLHADQETLRGRI 119
</PRE>


<PRE>
><a name = 423876></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00423876&dopt=GenPept" >pir||S06031</a> hypothetical protein - Enterobacteriaceae plasmid pWP113a
          (fragment)
          Length = 86

 Score = 83.2 bits (204), Expect = 4e-15
 Identities = 38/87 (43%), Positives = 54/87 (61%), Gaps = 1/87 (1%)

Query: 1  MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA 60
          MIIWING FG+GKT  A  L  R + S ++DPE++GF ++  VP   A  D+Q  PLWR 
Sbjct: 1  MIIWINGPFGAGKTTLAERLRDRRSKSLIFDPEEIGFVVKETVPMP-ASGDYQDLPLWRG 59

Query: 61 FNYSLLASLTDTYRGILIVPMTIVHPE 87
             + +  +   Y   +I+PMT+VHP+
Sbjct: 60 LTIAAVREIRRNYSQDIIIPMTLVHPD 86
</PRE>


<PRE>
><a name = 96587></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00096587&dopt=GenPept" >pir||S06034</a> hypothetical protein - Klebsiella pneumoniae plasmid pWP116a
          (fragment)
 <a name = 45939></a><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00045939&dopt=GenPept" >emb|CAA31892.1|</a> (X13541) hypothetical protein [Plasmid pWP116a]
          Length = 92

 Score = 82.0 bits (201), Expect = 9e-15
 Identities = 38/88 (43%), Positives = 55/88 (62%), Gaps = 1/88 (1%)

Query: 1  MIIWINGAFGSGKTQTAFELHRRLNPSYVYDPEKMGFALRSMVPQEIAKDDFQSYPLWRA 60
          MIIWING FG+GKT  A  L  R   S ++DPE++GF ++  VP   A  D+Q  PLWR 
Sbjct: 1  MIIWINGPFGAGKTTLAERLRDRRPKSLIFDPEEIGFVVKETVPIP-ASGDYQDLPLWRG 59

Query: 61 FNYSLLASLTDTYRGILIVPMTIVHPEY 88
             + ++ +   Y   +I+PMT+V+P+Y
Sbjct: 60 LTIAAVSEIRRNYSQDIIIPMTLVYPDY 87
</PRE>



<PRE>
  Database: nr
    Posted date:  May 30, 2001  5:08 AM
  Number of letters in database: 218,617,282
  Number of sequences in database:  693,878
  
Lambda     K      H
   0.323    0.138    0.411 

Gapped
Lambda     K      H
   0.267   0.0410    0.140 


Matrix: BLOSUM62
Gap Penalties: Existence: 11, Extension: 1
Number of Hits to DB: 83284981
Number of Sequences: 693878
Number of extensions: 3200855
Number of successful extensions: 6684
Number of sequences better than 10.0: 12
Number of HSP''s better than 10.0 without gapping: 12
Number of HSP''s successfully gapped in prelim test: 0
Number of HSP''s that attempted gapping in prelim test: 6663
Number of HSP''s gapped (non-prelim): 12
length of query: 197
length of database: 218,617,282
effective HSP length: 0
effective length of query: 197
effective length of database: 218,617,282
effective search space: 43067604554
effective search space used: 43067604554
T: 11
A: 40
X1: 16 ( 7.5 bits)
X2: 38 (14.6 bits)
X3: 64 (24.7 bits)
S1: 41 (22.0 bits)
S2: 72 (32.3 bits)

</form>


'
]

{ #category : #'results-ready' }
BioWebBlastSamples >> bt072Txt [
	"WARNING: This is code generated automatically.
 On: 27 December 2010 - 5:37:14 pm"

	^ '<HTML>
<HEAD>
</HEAD>
<BODY BGCOLOR="#FFFFFF" LINK="#0000FF" VLINK="#660099" ALINK="#660099">
<IMG SRC="images/head_results.gif" ALT="Header of the page" BORDER="0"NAME="BlastHeaderGif" WIDTH="600" HEIGHT="45" ALIGN="middle">
<form action="Blast.cgi" enctype="application/x-www-form-urlencoded" method="POST"><input name="ALIGNMENTS" type="hidden" value="50"><input name="AUTO_FORMAT" type="hidden" value="on"><input name="CLIENT" type="hidden" value="web"><input name="DESCRIPTIONS" type="hidden" value="100"><input name="EXPECT" type="hidden" value="10"><input name="HITLIST_SIZE" type="hidden" value="100"><input name="LAYOUT" type="hidden" value="OneWindow"><input name="NCBI_GI" type="hidden" value="checked"><input name="PAGE" type="hidden" value="Translations"><input name="RID" type="hidden" value="1032425806-013487-3242"><input name="RTOE" type="hidden" value="47"><input name="SHOW_OVERVIEW" type="hidden" value="checked"><input name="STEP_NUMBER" type="hidden" value="1"><input name="CMD" type="hidden" value="Get"></form>
<form action="Blast.cgi" enctype="application/x-www-form-urlencoded" method="POST" TARGET=""><input name="ALIGNMENTS" type="hidden" value="50"><input name="AUTO_FORMAT" type="hidden" value="on"><input name="CLIENT" type="hidden" value="web"><input name="DESCRIPTIONS" type="hidden" value="100"><input name="EXPECT" type="hidden" value="10"><input name="HITLIST_SIZE" type="hidden" value="100"><input name="LAYOUT" type="hidden" value="OneWindow"><input name="NCBI_GI" type="hidden" value="checked"><input name="PAGE" type="hidden" value="Translations"><input name="RID" type="hidden" value="1032425806-013487-3242"><input name="RTOE" type="hidden" value="47"><input name="SHOW_OVERVIEW" type="hidden" value="checked"><input name="STEP_NUMBER" type="hidden" value="1"><input name="CMD" type="hidden" value="Get">

<p><!--
QBlastInfoBegin
	Status=READY
QBlastInfoEnd
--><p><TITLE> RID=1032425806-013487-3242,  </TITLE>
<b>BLASTX 2.2.4 [Aug-26-2002]</b>

<pre>
<b><a href="http://www.ncbi.nlm.nih.gov/htbin-
post/Entrez/query?uid=9254694&form=6&db=m&Dopt=r">Reference</a>:</b>
Altschul, Stephen F., Thomas L. Madden, Alejandro A. Sch&auml;ffer, 
Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), 
"Gapped BLAST and PSI-BLAST: a new generation of protein database search
programs",  Nucleic Acids Res. 25:3389-3402.
<p>
RID: 1032425806-013487-3242
<p>
<b>Query=</b> 
         (577 letters)

<p>
<b>Database:</b> All non-redundant GenBank CDS
translations+PDB+SwissProt+PIR+PRF 
           1,171,253 sequences; 370,891,306 total letters

<p> <p>If you have any problems or questions with the results of this search <br>please refer to the <b><a href=http://www.ncbi.nlm.nih.gov/blast/blast_FAQs.html>BLAST FAQs</a></b><br><p>
<a href="Blast.cgi?CMD=Get&RID=1032425806-013487-3242&FORMAT_OBJECT=TaxBlast" TARGET="Taxonomy BLAST Results for 1032425806-013487-3242">Taxonomy reports</a>
<BR>
<PRE>


                                                                 Score    E
Sequences producing significant alignments:                      (bits) Value

<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=22725997&dopt=GenPept" >gb|AAN04997.1|</a>  (AC105744) putative transcription initiation...   <a href = #22725997>292</a>   2e-78
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15235418&dopt=GenPept" >ref|NP_192998.1|</a>  (NM_117331) putative protein; protein id: ...   <a href = #15235418>179</a>   2e-44
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=06862918&dopt=GenPept" >gb|AAF30307.1|AC018907_7</a>  (AC018907) putative RING zinc fing...   <a href = #6862918> 38</a>   0.067
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18397483&dopt=GenPept" >ref|NP_566274.1|</a>  (NM_111489) putative RING zinc finger prot...   <a href = #18397483> 38</a>   0.067
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21928149&dopt=GenPept" >gb|AAM78102.1|</a>  (AY125510) AT5g19080/T16G12_120 [Arabidopsis...   <a href = #21928149> 38</a>   0.067
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18398633&dopt=GenPept" >ref|NP_566356.1|</a>  (NM_111812) expressed protein; protein id:...   <a href = #18398633> 38</a>   0.087
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15239642&dopt=GenPept" >ref|NP_197409.1|</a>  (NM_121913) unknown protein; protein id: A...   <a href = #15239642> 37</a>   0.11 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17551576&dopt=GenPept" >ref|NP_510817.1|</a>  (NM_078416) F10D7.5b.p [Caenorhabditis ele...   <a href = #17551576> 37</a>   0.19 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=19225030&dopt=GenPept" >gb|AAL86506.1|AC099040_10</a>  (AC099040) putative hydroxyprolin...   <a href = #19225030> 37</a>   0.19 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21913050&dopt=GenPept" >gb|AAM81093.1|U40945_8</a>  (U40945) Hypothetical protein F10D7....   <a href = #21913050> 37</a>   0.19 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17551578&dopt=GenPept" >ref|NP_510818.1|</a>  (NM_078417) D. melanogaster finger protein...   <a href = #17551578> 37</a>   0.19 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21913047&dopt=GenPept" >gb|AAM81090.1|U40945_5</a>  (U40945) Hypothetical protein F10D7....   <a href = #21913047> 37</a>   0.19 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07498826&dopt=GenPept" >pir||T16028</a>  hypothetical protein F10D7.5 - Caenorhabditis e...   <a href = #7498826> 37</a>   0.19 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15240979&dopt=GenPept" >ref|NP_195765.1|</a>  (NM_120223) putative protein; protein id: ...   <a href = #15240979> 36</a>   0.25 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07292914&dopt=GenPept" >gb|AAF48305.1|</a>  (AE003493) CG9941-PA [Drosophila melanogaster]    <a href = #7292914> 35</a>   0.43 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21618140&dopt=GenPept" >gb|AAM67190.1|</a>  (AY088884) putative RING zinc finger protein...   <a href = #21618140> 35</a>   0.43 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15242675&dopt=GenPept" >ref|NP_195940.1|</a>  (NM_120398) expressed protein; protein id:...   <a href = #15242675> 35</a>   0.43 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17545794&dopt=GenPept" >ref|NP_519196.1|</a>  (NC_003295) PROBABLE TWO-COMPONENT SYSTEM ...   <a href = #17545794> 35</a>   0.74 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21292673&dopt=GenPept" >gb|EAA04818.1|</a>  (AAAB01008810) agCP6745 [Anopheles gambiae s...   <a href = #21292673> 35</a>   0.74 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=22999586&dopt=GenPept" >gb|ZP_00043559.1|</a>  (NZ_AAAN01000154) hypothetical protein [M...   <a href = #22999586> 35</a>   0.74 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15241556&dopt=GenPept" >ref|NP_199282.1|</a>  (NM_123836) putative protein; protein id: ...   <a href = #15241556> 35</a>   0.74 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15231808&dopt=GenPept" >ref|NP_190909.1|</a>  (NM_115201) putative protein; protein id: ...   <a href = #15231808> 34</a>   0.96 
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=03043612&dopt=GenPept" >dbj|BAA25470.1|</a>  (AB011116) KIAA0544 protein [Homo sapiens]       <a href = #3043612> 34</a>   1.3  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17550346&dopt=GenPept" >ref|NP_510385.1|</a>  (NM_077984) Zinc finger, C3HC4 type (RING ...   <a href = #17550346> 34</a>   1.3  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21356667&dopt=GenPept" >ref|NP_649187.1|</a>  (NM_140930) CG7298 gene product [Drosophil...   <a href = #21356667> 33</a>   1.6  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=23093055&dopt=GenPept" >gb|AAF49059.2|</a>  (AE003514) CG7298-PA [Drosophila melanogaster]    <a href = #23093055> 33</a>   1.6  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=20891615&dopt=GenPept" >ref|XP_148077.1|</a>  (XM_148077) RIKEN cDNA 2610042J20 [Mus mus...   <a href = #20891615> 33</a>   1.6  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=23002453&dopt=GenPept" >gb|ZP_00046129.1|</a>  (NZ_AAAB01000003) hypothetical protein [L...   <a href = #23002453> 33</a>   1.6  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=12848068&dopt=GenPept" >dbj|BAB27816.1|</a>  (AK011747) Zinc finger, C3HC4 type (RING fi...   <a href = #12848068> 33</a>   1.6  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18403707&dopt=GenPept" >ref|NP_566724.1|</a>  (NM_113229) auxin-regulated protein; prote...   <a href = #18403707> 33</a>   2.1  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21593715&dopt=GenPept" >gb|AAM65682.1|</a>  (AY088137) unknown [Arabidopsis thaliana]         <a href = #21593715> 33</a>   2.1  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07939538&dopt=GenPept" >dbj|BAA95741.1|</a>  (AB025608) contains similarity to ankyrin l...   <a href = #7939538> 33</a>   2.1  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15242304&dopt=GenPept" >ref|NP_199323.1|</a>  (NM_123878) putative protein; protein id: ...   <a href = #15242304> 33</a>   2.1  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=22331278&dopt=GenPept" >ref|NP_683586.1|</a>  (NM_148744) auxin-regulated protein; prote...   <a href = #22331278> 33</a>   2.1  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18414200&dopt=GenPept" >ref|NP_567428.1|</a>  (NM_117514) Expressed protein; protein id:...   <a href = #18414200> 33</a>   2.8  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15387746&dopt=GenPept" >emb|CAC59873.1|</a>  (AL160371) probable heat shock protein hslu...   <a href = #15387746> 33</a>   2.8  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=14587218&dopt=GenPept" >dbj|BAB61152.1|</a>  (AP003199) contains ESTs AU068079(C11823),A...   <a href = #14587218> 33</a>   2.8  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15224462&dopt=GenPept" >ref|NP_181354.1|</a>  (NM_129376) unknown protein; protein id: A...   <a href = #15224462> 32</a>   3.7  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=22296435&dopt=GenPept" >dbj|BAC10202.1|</a>  (AP004395) contains ESTs AU055804(S20063),A...   <a href = #22296435> 32</a>   4.8  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=19922258&dopt=GenPept" >ref|NP_610973.1|</a>  (NM_137129) CG12863 gene product [Drosophi...   <a href = #19922258> 32</a>   4.8  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21627199&dopt=GenPept" >gb|AAF58228.2|</a>  (AE003814) CG12863-PA [Drosophila melanogaster]   <a href = #21627199> 32</a>   4.8  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15128197&dopt=GenPept" >gb|AAK84420.1|AF400063_1</a>  (AF400063) neuralized 1 [Mus muscu...   <a href = #15128197> 32</a>   6.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=10946688&dopt=GenPept" >ref|NP_067335.1|</a>  (NM_021360) neuralized homolog (Drosophila...   <a href = #10946688> 32</a>   6.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15226959&dopt=GenPept" >ref|NP_181076.1|</a>  (NM_129085) unknown protein; protein id: A...   <a href = #15226959> 32</a>   6.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17231254&dopt=GenPept" >ref|NP_487802.1|</a>  (NC_003272) oligopeptide binding protein o...   <a href = #17231254> 32</a>   6.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15320749&dopt=GenPept" >ref|NP_203261.1|</a>  (NC_003083) IAP-4 [Epiphyas postvittana nu...   <a href = #15320749> 32</a>   6.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=22531056&dopt=GenPept" >gb|AAM97032.1|</a>  (AY136366) unknown protein [Arabidopsis thal...   <a href = #22531056> 32</a>   6.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=20890044&dopt=GenPept" >ref|XP_123433.1|</a>  (XM_123433) similar to neuralized homolog ...   <a href = #20890044> 32</a>   6.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15420883&dopt=GenPept" >gb|AAK97495.1|AF401228_1</a>  (AF401228) neuralized [Mus musculus]    <a href = #15420883> 32</a>   6.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18590406&dopt=GenPept" >ref|XP_085974.1|</a>  (XM_085974) similar to zinc finger protein...   <a href = #18590406> 32</a>   6.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07489906&dopt=GenPept" >pir||S68824</a>  rngB protein, cytosolic - slime mold (Dictyoste...   <a href = #7489906> 32</a>   6.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=06635096&dopt=GenPept" >emb|CAB64571.1|</a>  (AL135898) hypothetical protein L673.04 [Le...   <a href = #6635096> 32</a>   6.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=14583262&dopt=GenPept" >ref|NP_127506.1|</a>  (NC_002532) replicase ORF1ab polyprotein [...   <a href = #14583262> 31</a>   8.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15221532&dopt=GenPept" >ref|NP_174371.1|</a>  (NM_102823) hypothetical protein; protein ...   <a href = #15221532> 31</a>   8.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=00133455&dopt=GenPept" >sp|P19811|RPOA_EAV</a>  POL polyprotein (ORF1A/1B) [Contains: RN...   <a href = #133455> 31</a>   8.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=22047436&dopt=GenPept" >ref|XP_094260.3|</a>  (XM_094260) similar to neuralized [Homo sa...   <a href = #22047436> 31</a>   8.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21617976&dopt=GenPept" >gb|AAM67026.1|</a>  (AY088707) unknown [Arabidopsis thaliana]         <a href = #21617976> 31</a>   8.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18448645&dopt=GenPept" >gb|AAL69890.1|AF419159_1</a>  (AF419159) neuralized [Xenopus lae...   <a href = #18448645> 31</a>   8.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18399792&dopt=GenPept" >ref|NP_566438.1|</a>  (NM_112128) expressed protein; protein id:...   <a href = #18399792> 31</a>   8.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=20468614&dopt=GenPept" >ref|XP_116162.1|</a>  (XM_116162) similar to evidence:NAS~hypoth...   <a href = #20468614> 31</a>   8.2  
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=05732038&dopt=GenPept" >gb|AAC32390.3|</a>  (AF082873) histidine kinase [Herbaspirillum ...   <a href = #5732038> 31</a>   8.2  
</PRE>
<CENTER><b><FONT color="green">Alignments</FONT></b></CENTER>
</form>
<script src="blastResult.js"></script><table border="0"><tr><td><FORM  method="post" action="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?SUBMIT=y" name="submitterTop"><input type=button value="Get selected sequences" onClick="finalSubmit(0, ''getSeqAlignment'', ''getSeqGi'', ''submitterTop'')"><input type="hidden" name="db" value=""><input type="hidden" name="term" value=""><input type="hidden" name="doptcmdl" value="docsum"><input type="hidden" name="cmd" value="search"></form></td><td><FORM><input type="button" value="Select all" onClick="handleCheckAll(''select'', ''getSeqAlignment'', ''getSeqGi'')"></form></td><td><FORM><input type="button" value="Deselect all" onClick="handleCheckAll(''deselect'', ''getSeqAlignment'', ''getSeqGi'')"></form></td></tr></table><form name="getSeqAlignment">
<PRE>
<input type="checkbox" name="getSeqGi" value="22725997" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 22725997></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=22725997&dopt=GenPept" >gb|AAN04997.1|</a> (AC105744) putative transcription initiation factor [Oryza sativa
           (japonica cultivar-group)]
          Length = 532

 Score =  292 bits (747), Expect = 2e-78
 Identities = 140/141 (99%), Positives = 140/141 (99%)
 Frame = +3

Query: 153 MGSADLVLKAACEGCGSPSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREY 332
           MGSADLVLKAACEGCGSPSDLYGTSCKHTTLCSSCGKSMALS ARCLVCSAPITNLIREY
Sbjct: 1   MGSADLVLKAACEGCGSPSDLYGTSCKHTTLCSSCGKSMALSGARCLVCSAPITNLIREY 60

Query: 333 NVRANATTDKSFSIGRFVTGLPPFSKKKSAENKWSLHKEGLQGRQIPENMREKYNRKPWI 512
           NVRANATTDKSFSIGRFVTGLPPFSKKKSAENKWSLHKEGLQGRQIPENMREKYNRKPWI
Sbjct: 61  NVRANATTDKSFSIGRFVTGLPPFSKKKSAENKWSLHKEGLQGRQIPENMREKYNRKPWI 120

Query: 513 LEDETGQYQYQGQMEGSQSST 575
           LEDETGQYQYQGQMEGSQSST
Sbjct: 121 LEDETGQYQYQGQMEGSQSST 141
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15235418" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15235418></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15235418&dopt=GenPept" >ref|NP_192998.1|</a> (NM_117331) putative protein; protein id: At4g12610.1 [Arabidopsis
           thaliana]
 <a name = 5823572></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=05823572&dopt=GenPept" >emb|CAB53754.1|</a> (AL049730) putative protein [Arabidopsis thaliana]
 <a name = 7267963></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07267963&dopt=GenPept" >emb|CAB78304.1|</a> (AL161534) putative protein [Arabidopsis thaliana]
          Length = 649

 Score =  179 bits (454), Expect = 2e-44
 Identities = 85/136 (62%), Positives = 102/136 (74%)
 Frame = +3

Query: 168 LVLKAACEGCGSPSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNVRAN 347
           L L  +C GCGS SDLYG+SC+H TLC  CG++MA + ++C  C   +T LIREYNVRA 
Sbjct: 5   LQLNTSCVGCGSQSDLYGSSCRHMTLCLKCGRTMAQNKSKCHECGTVVTRLIREYNVRAA 64

Query: 348 ATTDKSFSIGRFVTGLPPFSKKKSAENKWSLHKEGLQGRQIPENMREKYNRKPWILEDET 527
           A TDK++ IGRFVTGLP F  KK +ENKWSL K+  QGRQ  +  REK   KPWILEDET
Sbjct: 65  APTDKNYFIGRFVTGLPNF--KKGSENKWSLRKDIPQGRQFTDAQREKLKNKPWILEDET 122

Query: 528 GQYQYQGQMEGSQSST 575
           GQ+QYQG +EGSQS+T
Sbjct: 123 GQFQYQGHLEGSQSAT 138
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="6862918" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 6862918></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=06862918&dopt=GenPept" >gb|AAF30307.1|AC018907_7</a> (AC018907) putative RING zinc finger protein [Arabidopsis thaliana]
          Length = 546

 Score = 38.1 bits (87), Expect = 0.067
 Identities = 13/32 (40%), Positives = 19/32 (58%)
 Frame = +3

Query: 228 CKHTTLCSSCGKSMALSSARCLVCSAPITNLI 323
           C+H  +CS C K + L S +C +C  PI  L+
Sbjct: 504 CRHLCMCSDCAKELRLQSNKCPICRQPIEELL 535
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="18397483" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 18397483></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18397483&dopt=GenPept" >ref|NP_566274.1|</a> (NM_111489) putative RING zinc finger protein; protein id:
           At3g06140.1, supported by cDNA: 40787. [Arabidopsis
           thaliana]
 <a name = 21593638></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21593638&dopt=GenPept" >gb|AAM65605.1|</a> (AY088059) putative RING zinc finger protein [Arabidopsis thaliana]
          Length = 359

 Score = 38.1 bits (87), Expect = 0.067
 Identities = 13/32 (40%), Positives = 19/32 (58%)
 Frame = +3

Query: 228 CKHTTLCSSCGKSMALSSARCLVCSAPITNLI 323
           C+H  +CS C K + L S +C +C  PI  L+
Sbjct: 317 CRHLCMCSDCAKELRLQSNKCPICRQPIEELL 348
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="21928149" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 21928149></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21928149&dopt=GenPept" >gb|AAM78102.1|</a> (AY125510) AT5g19080/T16G12_120 [Arabidopsis thaliana]
          Length = 378

 Score = 38.1 bits (87), Expect = 0.067
 Identities = 13/41 (31%), Positives = 22/41 (52%)
 Frame = +3

Query: 204 PSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIR 326
           P D     C+H +LCS C + +   + +C +C  PI  L++
Sbjct: 328 PKDTAVMPCRHLSLCSDCAEELRFQTNKCPICRQPIHELVK 368
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="18398633" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 18398633></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18398633&dopt=GenPept" >ref|NP_566356.1|</a> (NM_111812) expressed protein; protein id: At3g09770.1, supported
           by cDNA: 38757., supported by cDNA: gi_18377643
           [Arabidopsis thaliana]
 <a name = 6681341></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=06681341&dopt=GenPept" >gb|AAF23258.1|AC015985_16</a> (AC015985) putative RING zinc finger protein [Arabidopsis thaliana]
 <a name = 6682260></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=06682260&dopt=GenPept" >gb|AAF23312.1|AC016661_37</a> (AC016661) unknown protein [Arabidopsis thaliana]
 <a name = 18377644></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18377644&dopt=GenPept" >gb|AAL66972.1|</a> (AY074275) putative RING zinc finger protein [Arabidopsis thaliana]
 <a name = 21593417></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21593417&dopt=GenPept" >gb|AAM65384.1|</a> (AY087831) putative RING zinc finger protein [Arabidopsis thaliana]
          Length = 388

 Score = 37.7 bits (86), Expect = 0.087
 Identities = 16/48 (33%), Positives = 23/48 (47%)
 Frame = +3

Query: 204 PSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNVRAN 347
           P D     C+H  +CS C K +   + RC +C  P+  L+ E  V  N
Sbjct: 326 PRDTTVLPCRHMCMCSGCAKVLRFQTNRCPICRQPVERLL-EIKVHGN 372
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15239642" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15239642></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15239642&dopt=GenPept" >ref|NP_197409.1|</a> (NM_121913) unknown protein; protein id: At5g19080.1 [Arabidopsis
           thaliana]
          Length = 378

 Score = 37.4 bits (85), Expect = 0.11
 Identities = 13/41 (31%), Positives = 21/41 (50%)
 Frame = +3

Query: 204 PSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIR 326
           P D     C+H  LCS C + +   + +C +C  PI  L++
Sbjct: 328 PKDTAVMPCRHLCLCSDCAEELRFQTNKCPICRQPIHELVK 368
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="17551576" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 17551576></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17551576&dopt=GenPept" >ref|NP_510817.1|</a> (NM_078416) F10D7.5b.p [Caenorhabditis elegans]
          Length = 750

 Score = 36.6 bits (83), Expect = 0.19
 Identities = 11/36 (30%), Positives = 21/36 (57%)
 Frame = +3

Query: 225 SCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREY 332
           +C H  +C  CG+ +  +   C +C AP+ ++I+ Y
Sbjct: 713 TCGHMCMCFECGRRLLTTKGTCPICRAPVQDVIKTY 748
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="19225030" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 19225030></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=19225030&dopt=GenPept" >gb|AAL86506.1|AC099040_10</a> (AC099040) putative hydroxyproline-rich glycoprotein [Oryza sativa
           (japonica cultivar-group)]
 <a name = 20279471></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=20279471&dopt=GenPept" >gb|AAM18751.1|AC099325_7</a> (AC099325) unknown protein [Oryza sativa (japonica cultivar-group)]
          Length = 425

 Score = 36.6 bits (83), Expect = 0.19
 Identities = 13/40 (32%), Positives = 20/40 (49%)
 Frame = +3

Query: 204 PSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLI 323
           P D     C+H  +CS C K +   + RC +C  P+  L+
Sbjct: 350 PRDTTVLPCRHMCMCSECAKVLRYQTNRCPICRQPVERLL 389
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="21913050" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 21913050></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21913050&dopt=GenPept" >gb|AAM81093.1|U40945_8</a> (U40945) Hypothetical protein F10D7.5d [Caenorhabditis elegans]
          Length = 465

 Score = 36.6 bits (83), Expect = 0.19
 Identities = 11/36 (30%), Positives = 21/36 (57%)
 Frame = +3

Query: 225 SCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREY 332
           +C H  +C  CG+ +  +   C +C AP+ ++I+ Y
Sbjct: 428 TCGHMCMCFECGRRLLTTKGTCPICRAPVQDVIKTY 463
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="17551578" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 17551578></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17551578&dopt=GenPept" >ref|NP_510818.1|</a> (NM_078417) D. melanogaster finger protein neuralized
           [Caenorhabditis elegans]
          Length = 795

 Score = 36.6 bits (83), Expect = 0.19
 Identities = 11/36 (30%), Positives = 21/36 (57%)
 Frame = +3

Query: 225 SCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREY 332
           +C H  +C  CG+ +  +   C +C AP+ ++I+ Y
Sbjct: 758 TCGHMCMCFECGRRLLTTKGTCPICRAPVQDVIKTY 793
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="21913047" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 21913047></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21913047&dopt=GenPept" >gb|AAM81090.1|U40945_5</a> (U40945) Hypothetical protein F10D7.5a [Caenorhabditis elegans]
          Length = 634

 Score = 36.6 bits (83), Expect = 0.19
 Identities = 11/36 (30%), Positives = 21/36 (57%)
 Frame = +3

Query: 225 SCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREY 332
           +C H  +C  CG+ +  +   C +C AP+ ++I+ Y
Sbjct: 597 TCGHMCMCFECGRRLLTTKGTCPICRAPVQDVIKTY 632
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="7498826" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 7498826></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07498826&dopt=GenPept" >pir||T16028</a> hypothetical protein F10D7.5 - Caenorhabditis elegans
          Length = 824

 Score = 36.6 bits (83), Expect = 0.19
 Identities = 11/36 (30%), Positives = 21/36 (57%)
 Frame = +3

Query: 225 SCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREY 332
           +C H  +C  CG+ +  +   C +C AP+ ++I+ Y
Sbjct: 787 TCGHMCMCFECGRRLLTTKGTCPICRAPVQDVIKTY 822
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15240979" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15240979></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15240979&dopt=GenPept" >ref|NP_195765.1|</a> (NM_120223) putative protein; protein id: At5g01450.1 [Arabidopsis
           thaliana]
 <a name = 11357966></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=11357966&dopt=GenPept" >pir||T48167</a> hypothetical protein T10O8.160 - Arabidopsis thaliana
 <a name = 7320723></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07320723&dopt=GenPept" >emb|CAB81928.1|</a> (AL161746) putative protein [Arabidopsis thaliana]
          Length = 428

 Score = 36.2 bits (82), Expect = 0.25
 Identities = 20/64 (31%), Positives = 28/64 (43%), Gaps = 1/64 (1%)
 Frame = +3

Query: 150 AMGSADLVLKAACEGC-GSPSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIR 326
           A G      +  C  C  +P D +  SC H   C  CG  +A +S  C VC   I  + +
Sbjct: 365 AHGEGHSSTRYLCAICYDAPRDCFFLSCGHCVACFQCGTRIAETSGFCPVCRKKIRKVKK 424

Query: 327 EYNV 338
            +NV
Sbjct: 425 IFNV 428
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="7292914" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 7292914></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07292914&dopt=GenPept" >gb|AAF48305.1|</a> (AE003493) CG9941-PA [Drosophila melanogaster]
          Length = 789

 Score = 35.4 bits (80), Expect = 0.43
 Identities = 14/43 (32%), Positives = 23/43 (52%)
 Frame = +3

Query: 228 CKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNVRANATT 356
           C+H  LC+SC  S+   +  C +C AP   L++   V+   +T
Sbjct: 334 CRHLCLCNSCADSLRYQANNCPICRAPFRALLQIRAVQKGIST 376
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="21618140" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 21618140></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21618140&dopt=GenPept" >gb|AAM67190.1|</a> (AY088884) putative RING zinc finger protein [Arabidopsis thaliana]
          Length = 337

 Score = 35.4 bits (80), Expect = 0.43
 Identities = 16/47 (34%), Positives = 23/47 (48%), Gaps = 1/47 (2%)
 Frame = +3

Query: 186 CEGCGS-PSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLI 323
           C  C S P D     C+H  +CS C K++   +  C VC  P+  L+
Sbjct: 285 CVVCLSEPRDTTVLPCRHMCMCSGCAKALRFQTNLCPVCRQPVEMLL 331
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15242675" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15242675></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15242675&dopt=GenPept" >ref|NP_195940.1|</a> (NM_120398) expressed protein; protein id: At5g03200.1, supported
           by cDNA: 98672. [Arabidopsis thaliana]
 <a name = 11357455></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=11357455&dopt=GenPept" >pir||T48341</a> hypothetical protein F15A17.230 - Arabidopsis thaliana
 <a name = 7413597></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07413597&dopt=GenPept" >emb|CAB86087.1|</a> (AL163002) putative protein [Arabidopsis thaliana]
 <a name = 9757771></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=09757771&dopt=GenPept" >dbj|BAB08380.1|</a> (AB005240) RING zinc finger protein-like [Arabidopsis thaliana]
          Length = 337

 Score = 35.4 bits (80), Expect = 0.43
 Identities = 16/47 (34%), Positives = 23/47 (48%), Gaps = 1/47 (2%)
 Frame = +3

Query: 186 CEGCGS-PSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLI 323
           C  C S P D     C+H  +CS C K++   +  C VC  P+  L+
Sbjct: 285 CVVCLSEPRDTTVLPCRHMCMCSGCAKALRFQTNLCPVCRQPVEMLL 331
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="17545794" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 17545794></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17545794&dopt=GenPept" >ref|NP_519196.1|</a> (NC_003295) PROBABLE TWO-COMPONENT SYSTEM SENSOR HISTIDINE KINASE
           TRANSCRIPTION REGULATOR PROTEIN [Ralstonia solanacearum]
 <a name = 17428088></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17428088&dopt=GenPept" >emb|CAD14777.1|</a> (AL646062) PROBABLE TWO-COMPONENT SYSTEM SENSOR HISTIDINE KINASE
           TRANSCRIPTION REGULATOR PROTEIN [Ralstonia solanacearum]
          Length = 784

 Score = 34.7 bits (78), Expect = 0.74
 Identities = 21/43 (48%), Positives = 25/43 (57%)
 Frame = +2

Query: 167 PGAEGGVRGLRLAVGPLRHVMQAHHALQLLRQIHGALQRPLPR 295
           P  +  VRGL LA GP  H++  H ALQL RQ   AL   +PR
Sbjct: 173 PDPDSVVRGLYLAEGPRGHLLD-HLALQLARQAGPALAGDVPR 214
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="21292673" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 21292673></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21292673&dopt=GenPept" >gb|EAA04818.1|</a> (AAAB01008810) agCP6745 [Anopheles gambiae str. PEST]
          Length = 307

 Score = 34.7 bits (78), Expect = 0.74
 Identities = 12/33 (36%), Positives = 19/33 (57%)
 Frame = +3

Query: 228 CKHTTLCSSCGKSMALSSARCLVCSAPITNLIR 326
           C+H  LC+SC  S+   +  C +C AP   L++
Sbjct: 246 CRHLCLCNSCADSLRYQANNCPICRAPFRALLQ 278
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="22999586" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 22999586></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=22999586&dopt=GenPept" >gb|ZP_00043559.1|</a> (NZ_AAAN01000154) hypothetical protein [Magnetococcus sp. MC-1]
          Length = 487

 Score = 34.7 bits (78), Expect = 0.74
 Identities = 21/62 (33%), Positives = 30/62 (47%), Gaps = 1/62 (1%)
 Frame = +3

Query: 150 AMGSADLVLKAACEGCGSPSDLYGTSCKHTTLCSSCGKSMALSSARCLVC-SAPITNLIR 326
           AM   D  ++  C  CG+  D YG SC+   +CS+  +   L  A+C VC S P+     
Sbjct: 130 AMFLPDRFIRGTCPHCGAV-DQYGDSCE---VCSATYRPTELKEAKCAVCGSQPVEKSSE 185

Query: 327 EY 332
            Y
Sbjct: 186 HY 187
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15241556" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15241556></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15241556&dopt=GenPept" >ref|NP_199282.1|</a> (NM_123836) putative protein; protein id: At5g44690.1 [Arabidopsis
           thaliana]
 <a name = 9758373></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=09758373&dopt=GenPept" >dbj|BAB08822.1|</a> (AB016874) gene_id:K23L20.2~pir||T00474~similar to unknown protein
           [Arabidopsis thaliana]
          Length = 684

 Score = 34.7 bits (78), Expect = 0.74
 Identities = 16/54 (29%), Positives = 25/54 (45%), Gaps = 1/54 (1%)
 Frame = +3

Query: 174 LKAACEGCGS-PSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREY 332
           L+  C  C   P D     C H   C  C   +  S+ +C +C API +++R +
Sbjct: 628 LERNCSICFEMPIDSLLYRCGHMCTCLKCAHELQWSNMKCPICMAPIVDVVRAF 681
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15231808" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15231808></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15231808&dopt=GenPept" >ref|NP_190909.1|</a> (NM_115201) putative protein; protein id: At3g53410.1, supported by
           cDNA: 110247. [Arabidopsis thaliana]
 <a name = 11357789></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=11357789&dopt=GenPept" >pir||T45881</a> hypothetical protein F4P12.110 - Arabidopsis thaliana
 <a name = 6729492></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=06729492&dopt=GenPept" >emb|CAB67648.1|</a> (AL132966) putative protein [Arabidopsis thaliana]
 <a name = 21536752></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21536752&dopt=GenPept" >gb|AAM61084.1|</a> (AY084516) putative RING zinc finger protein [Arabidopsis thaliana]
          Length = 299

 Score = 34.3 bits (77), Expect = 0.96
 Identities = 12/40 (30%), Positives = 19/40 (47%)
 Frame = +3

Query: 204 PSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLI 323
           P D     C+H  +CS C K +   +  C +C  P+  L+
Sbjct: 250 PRDTTVLPCRHMCMCSGCAKLLRFQTNLCPICRQPVDRLL 289
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="3043612" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 3043612></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=03043612&dopt=GenPept" >dbj|BAA25470.1|</a> (AB011116) KIAA0544 protein [Homo sapiens]
          Length = 583

 Score = 33.9 bits (76), Expect = 1.3
 Identities = 20/60 (33%), Positives = 28/60 (46%), Gaps = 5/60 (8%)
 Frame = +3

Query: 207 SDLYGT---SCKHTTLCSSCGKSMALSSARCLVCSAPITNL--IREYNVRANATTDKSFS 371
           SDL  T    C+H  LC+SC  ++   +  C +C  P   L  IR    +  A +  SFS
Sbjct: 314 SDLRDTLILPCRHLCLCTSCADTLRYQANNCPICRLPFRALLQIRAVRKKPGALSPVSFS 373
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="17550346" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 17550346></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17550346&dopt=GenPept" >ref|NP_510385.1|</a> (NM_077984) Zinc finger, C3HC4 type (RING finger) [Caenorhabditis
           elegans]
 <a name = 7495870></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07495870&dopt=GenPept" >pir||T19204</a> hypothetical protein C11H1.3 - Caenorhabditis elegans
 <a name = 3874246></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=03874246&dopt=GenPept" >emb|CAA94116.1|</a> (Z70205) predicted using Genefinder~contains similarity to Pfam
           domain: PF00097 (Zinc finger, C3HC4 type (RING finger)),
           Score=29.8, E-value=2.2e-08, N=1~cDNA EST yk67c6.5 comes
           from this gene~cDNA EST yk597f9.5 comes from this
           gene~cDNA EST yk653f11.5>
          Length = 529

 Score = 33.9 bits (76), Expect = 1.3
 Identities = 12/33 (36%), Positives = 18/33 (54%)
 Frame = +3

Query: 228 CKHTTLCSSCGKSMALSSARCLVCSAPITNLIR 326
           C+H  +CS+C  S+      C +C +P   LIR
Sbjct: 284 CRHLCVCSNCADSLRYKHNNCPICRSPFRALIR 316
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="21356667" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 21356667></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21356667&dopt=GenPept" >ref|NP_649187.1|</a> (NM_140930) CG7298 gene product [Drosophila melanogaster]
 <a name = 16769330></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=16769330&dopt=GenPept" >gb|AAL28884.1|</a> (AY061336) LD26327p [Drosophila melanogaster]
          Length = 369

 Score = 33.5 bits (75), Expect = 1.6
 Identities = 26/87 (29%), Positives = 37/87 (41%), Gaps = 2/87 (2%)
 Frame = +3

Query: 144 SPAMGSADLVLKAACEGCGSPSDLYGT--SCKHTTLCSSCGKSMALSSARCLVCSAPITN 317
           S   G+ + VL++ C+    P   +G   SC     C S    + L S +C        N
Sbjct: 144 SNTQGTNETVLESLCDVV-PPGQYFGDTESCSTWHYCESTSTGLVLQSGKCSA------N 196

Query: 318 LIREYNVRANATTDKSFSIGRFVTGLP 398
               YNV AN  T +S S+   VT +P
Sbjct: 197 NQTAYNVLANQCTYESASVCSRVTNIP 223
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="23093055" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 23093055></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=23093055&dopt=GenPept" >gb|AAF49059.2|</a> (AE003514) CG7298-PA [Drosophila melanogaster]
          Length = 356

 Score = 33.5 bits (75), Expect = 1.6
 Identities = 26/87 (29%), Positives = 37/87 (41%), Gaps = 2/87 (2%)
 Frame = +3

Query: 144 SPAMGSADLVLKAACEGCGSPSDLYGT--SCKHTTLCSSCGKSMALSSARCLVCSAPITN 317
           S   G+ + VL++ C+    P   +G   SC     C S    + L S +C        N
Sbjct: 131 SNTQGTNETVLESLCDVV-PPGQYFGDTESCSTWHYCESTSTGLVLQSGKCSA------N 183

Query: 318 LIREYNVRANATTDKSFSIGRFVTGLP 398
               YNV AN  T +S S+   VT +P
Sbjct: 184 NQTAYNVLANQCTYESASVCSRVTNIP 210
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="20891615" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 20891615></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=20891615&dopt=GenPept" >ref|XP_148077.1|</a> (XM_148077) RIKEN cDNA 2610042J20 [Mus musculus]
          Length = 578

 Score = 33.5 bits (75), Expect = 1.6
 Identities = 20/60 (33%), Positives = 28/60 (46%), Gaps = 5/60 (8%)
 Frame = +3

Query: 207 SDLYGT---SCKHTTLCSSCGKSMALSSARCLVCSAPITNL--IREYNVRANATTDKSFS 371
           SDL  T    C+H  LC+SC  ++   +  C +C  P   L  IR    +  A +  SFS
Sbjct: 283 SDLRDTLILPCRHLCLCTSCADTLRYQANNCPICRLPFRALLQIRAVRKKPGALSPISFS 342
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="23002453" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 23002453></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=23002453&dopt=GenPept" >gb|ZP_00046129.1|</a> (NZ_AAAB01000003) hypothetical protein [Lactobacillus gasseri]
          Length = 281

 Score = 33.5 bits (75), Expect = 1.6
 Identities = 24/95 (25%), Positives = 40/95 (41%)
 Frame = +3

Query: 246 CSSCGKSMALSSARCLVCSAPITNLIREYNVRANATTDKSFSIGRFVTGLPPFSKKKSAE 425
           C +CGK + L  A+C  C     N     N+ A    D    +G  +  +P   KK   E
Sbjct: 5   CPNCGKEVNLGEAKCPFCGYDFVN-----NINAKIPADLGM-MGIRLNNVPKKKKKAEPE 58

Query: 426 NKWSLHKEGLQGRQIPENMREKYNRKPWILEDETG 530
           NK  + K   Q   + +    K+ +K  +++ + G
Sbjct: 59  NK-RVEKNTTQKVAVTKAKELKHAKKNKVVKKKKG 92
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="12848068" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 12848068></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=12848068&dopt=GenPept" >dbj|BAB27816.1|</a> (AK011747) Zinc finger, C3HC4 type (RING finger) containing
           protein~data source:Pfam, source key:PF00097,
           evidence:ISS~putative [Mus musculus]
          Length = 494

 Score = 33.5 bits (75), Expect = 1.6
 Identities = 20/60 (33%), Positives = 28/60 (46%), Gaps = 5/60 (8%)
 Frame = +3

Query: 207 SDLYGT---SCKHTTLCSSCGKSMALSSARCLVCSAPITNL--IREYNVRANATTDKSFS 371
           SDL  T    C+H  LC+SC  ++   +  C +C  P   L  IR    +  A +  SFS
Sbjct: 245 SDLRDTLILPCRHLCLCTSCADTLRYQANNCPICRLPFRALLQIRAVRKKPGALSPISFS 304
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="18403707" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 18403707></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18403707&dopt=GenPept" >ref|NP_566724.1|</a> (NM_113229) auxin-regulated protein; protein id: At3g23280.1,
           supported by cDNA: 41648. [Arabidopsis thaliana]
          Length = 462

 Score = 33.1 bits (74), Expect = 2.1
 Identities = 16/46 (34%), Positives = 22/46 (47%)
 Frame = +3

Query: 201 SPSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNV 338
           +PS+     C H   C SC K +   +  C VC A I  +I+ Y V
Sbjct: 417 APSEAVCVPCGHVAGCMSCLKEIKSKNWGCPVCRAKIDQVIKLYRV 462
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="21593715" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 21593715></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21593715&dopt=GenPept" >gb|AAM65682.1|</a> (AY088137) unknown [Arabidopsis thaliana]
          Length = 462

 Score = 33.1 bits (74), Expect = 2.1
 Identities = 16/46 (34%), Positives = 22/46 (47%)
 Frame = +3

Query: 201 SPSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNV 338
           +PS+     C H   C SC K +   +  C VC A I  +I+ Y V
Sbjct: 417 APSEAVCVPCGHVAGCMSCLKEIKSKNWGCPVCRAKIDQVIKLYRV 462
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="7939538" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 7939538></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07939538&dopt=GenPept" >dbj|BAA95741.1|</a> (AB025608) contains similarity to ankyrin like
           protein~gene_id:K14B15.19 [Arabidopsis thaliana]
          Length = 454

 Score = 33.1 bits (74), Expect = 2.1
 Identities = 16/46 (34%), Positives = 22/46 (47%)
 Frame = +3

Query: 201 SPSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNV 338
           +PS+     C H   C SC K +   +  C VC A I  +I+ Y V
Sbjct: 409 APSEAVCVPCGHVAGCMSCLKEIKSKNWGCPVCRAKIDQVIKLYRV 454
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15242304" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15242304></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15242304&dopt=GenPept" >ref|NP_199323.1|</a> (NM_123878) putative protein; protein id: At5g45100.1, supported by
           cDNA: gi_16604441 [Arabidopsis thaliana]
 <a name = 9758985></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=09758985&dopt=GenPept" >dbj|BAB09495.1|</a> (AB019224) gene_id:K17O22.9~pir||T04751~strong similarity to
           unknown protein [Arabidopsis thaliana]
 <a name = 16604442></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=16604442&dopt=GenPept" >gb|AAL24227.1|</a> (AY058839) AT5g45100/K17O22_9 [Arabidopsis thaliana]
          Length = 294

 Score = 33.1 bits (74), Expect = 2.1
 Identities = 17/54 (31%), Positives = 25/54 (45%), Gaps = 1/54 (1%)
 Frame = +3

Query: 156 GSADLVLKAACEGCGS-PSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPIT 314
           G    V+   C+ CG   + +    C+H  LC+ CG S  L +  C VC   +T
Sbjct: 234 GDVTAVVNGGCKRCGELTASVLVLPCRHLCLCTVCGSSALLRT--CPVCDMVMT 285
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="22331278" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 22331278></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=22331278&dopt=GenPept" >ref|NP_683586.1|</a> (NM_148744) auxin-regulated protein; protein id: At3g23280.2,
           supported by cDNA: gi_15010671, supported by cDNA:
           gi_16974316 [Arabidopsis thaliana]
 <a name = 15010672></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15010672&dopt=GenPept" >gb|AAK73995.1|</a> (AY045637) AT3g23280/K14B15_17 [Arabidopsis thaliana]
 <a name = 16974317></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=16974317&dopt=GenPept" >gb|AAL31143.1|</a> (AY059650) AT3g23280/K14B15_17 [Arabidopsis thaliana]
          Length = 438

 Score = 33.1 bits (74), Expect = 2.1
 Identities = 16/46 (34%), Positives = 22/46 (47%)
 Frame = +3

Query: 201 SPSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNV 338
           +PS+     C H   C SC K +   +  C VC A I  +I+ Y V
Sbjct: 393 APSEAVCVPCGHVAGCMSCLKEIKSKNWGCPVCRAKIDQVIKLYRV 438
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="18414200" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 18414200></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18414200&dopt=GenPept" >ref|NP_567428.1|</a> (NM_117514) Expressed protein; protein id: At4g14365.1, supported
           by cDNA: 37809., supported by cDNA: gi_13358233,
           supported by cDNA: gi_17065423, supported by cDNA:
           gi_20148546 [Arabidopsis thaliana]
 <a name = 11762236></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=11762236&dopt=GenPept" >gb|AAG40396.1|AF325044_1</a> (AF325044) AT4g14360 [Arabidopsis thaliana]
 <a name = 17065424></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17065424&dopt=GenPept" >gb|AAL32866.1|</a> (AY062788) ankyrin homolog [Arabidopsis thaliana]
 <a name = 20148547></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=20148547&dopt=GenPept" >gb|AAM10164.1|</a> (AY081602) ankyrin homolog [Arabidopsis thaliana]
          Length = 376

 Score = 32.7 bits (73), Expect = 2.8
 Identities = 16/46 (34%), Positives = 22/46 (47%)
 Frame = +3

Query: 201 SPSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNV 338
           +PS+     C H   C SC K +      C VC A I  +I+ Y+V
Sbjct: 331 APSEAVCVPCGHVAGCISCLKEIENKKMGCPVCRANIDQVIKLYHV 376
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15387746" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15387746></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15387746&dopt=GenPept" >emb|CAC59873.1|</a> (AL160371) probable heat shock protein hslu [Leishmania major]
          Length = 288

 Score = 32.7 bits (73), Expect = 2.8
 Identities = 29/120 (24%), Positives = 48/120 (39%), Gaps = 2/120 (1%)
 Frame = +3

Query: 177 KAACEGCGSPSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNVRANATT 356
           +A    C S     G +  HT L      S A ++A     +AP+TN   +  +R     
Sbjct: 3   RALSLSCRSSVAATGAASSHTLLTGVRCCSTAAAAAAAPAPAAPLTNPGSKTLIRDMRPR 62

Query: 357 DKSFSIGRFVTGLPPFSKKKSA--ENKWSLHKEGLQGRQIPENMREKYNRKPWILEDETG 530
           +    + R++ G     K  S    N+W  H       Q+P ++RE+   K  ++   TG
Sbjct: 63  ELMKELDRYIVGQSEAKKAVSVALRNRWRRH-------QVPSDIREEIAPKNILMIGPTG 115
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="14587218" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 14587218></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=14587218&dopt=GenPept" >dbj|BAB61152.1|</a> (AP003199) contains ESTs AU068079(C11823),AU068080(C11823)~similar
           to Arabidopsis thaliana chromosome 3, F4P12.110~unknown
           protein [Oryza sativa (japonica cultivar-group)]
          Length = 313

 Score = 32.7 bits (73), Expect = 2.8
 Identities = 17/52 (32%), Positives = 24/52 (45%), Gaps = 1/52 (1%)
 Frame = +3

Query: 186 CEGCGS-PSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNV 338
           C  C S P D     C+H  LC  C + +   + +C +C  P+  L RE  V
Sbjct: 246 CVVCLSEPRDTAVLPCRHMCLCRECAQVLKYQTNKCPICRQPVEGL-REIEV 296
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15224462" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15224462></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15224462&dopt=GenPept" >ref|NP_181354.1|</a> (NM_129376) unknown protein; protein id: At2g38190.1 [Arabidopsis
           thaliana]
 <a name = 7485584></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=07485584&dopt=GenPept" >pir||T01251</a> hypothetical protein F16M14.12 - Arabidopsis thaliana
 <a name = 3335367></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=03335367&dopt=GenPept" >gb|AAC27168.1|</a> (AC003028) unknown protein [Arabidopsis thaliana]
          Length = 124

 Score = 32.3 bits (72), Expect = 3.7
 Identities = 13/45 (28%), Positives = 20/45 (43%)
 Frame = +3

Query: 204 PSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNV 338
           P D +   C H+  C  CG +M  +   C +C   +  + R Y V
Sbjct: 80  PRDCFFLPCGHSVSCYECGTTMQEADGSCPICRRKMKKVKRIYTV 124
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="22296435" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 22296435></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=22296435&dopt=GenPept" >dbj|BAC10202.1|</a> (AP004395) contains ESTs
           AU055804(S20063),AU055998(S20213),
           AU055803(S20063)~similar to ankyrin homolog [Oryza
           sativa (japonica cultivar-group)]
          Length = 489

 Score = 32.0 bits (71), Expect = 4.8
 Identities = 20/61 (32%), Positives = 25/61 (40%)
 Frame = +3

Query: 156 GSADLVLKAACEGCGSPSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYN 335
           G+  + L A  EG   P       C H   C SC K +      C +C A I  +IR Y 
Sbjct: 436 GTCVICLDAPVEGACIP-------CGHMAGCMSCLKDIESKKWGCPICRAKINQIIRLYA 488

Query: 336 V 338
           V
Sbjct: 489 V 489
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="19922258" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 19922258></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=19922258&dopt=GenPept" >ref|NP_610973.1|</a> (NM_137129) CG12863 gene product [Drosophila melanogaster]
 <a name = 17945550></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17945550&dopt=GenPept" >gb|AAL48827.1|</a> (AY071205) RE24565p [Drosophila melanogaster]
          Length = 184

 Score = 32.0 bits (71), Expect = 4.8
 Identities = 27/116 (23%), Positives = 43/116 (36%)
 Frame = +3

Query: 186 CEGCGSPSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNVRANATTDKS 365
           C  CG    + G + KH   C +C K   +  + C  C+    +    Y  + +      
Sbjct: 69  CNRCGKCPSVNGQTYKHCESCDACVKPNYVHCSDCRRCTQKEGHNCSFYQTKQHCW--MC 126

Query: 366 FSIGRFVTGLPPFSKKKSAENKWSLHKEGLQGRQIPENMREKYNRKPWILEDETGQ 533
              G   T  P F K+K+   K  L       R+   + R KY R+   + + T Q
Sbjct: 127 GQKGHIETKCPNFRKRKTNYTKGCLLCGKRNHREKRCSYRSKYFREQCFMNETTIQ 182
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="21627199" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 21627199></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=21627199&dopt=GenPept" >gb|AAF58228.2|</a> (AE003814) CG12863-PA [Drosophila melanogaster]
          Length = 425

 Score = 32.0 bits (71), Expect = 4.8
 Identities = 27/116 (23%), Positives = 43/116 (36%)
 Frame = +3

Query: 186 CEGCGSPSDLYGTSCKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYNVRANATTDKS 365
           C  CG    + G + KH   C +C K   +  + C  C+    +    Y  + +      
Sbjct: 310 CNRCGKCPSVNGQTYKHCESCDACVKPNYVHCSDCRRCTQKEGHNCSFYQTKQHCW--MC 367

Query: 366 FSIGRFVTGLPPFSKKKSAENKWSLHKEGLQGRQIPENMREKYNRKPWILEDETGQ 533
              G   T  P F K+K+   K  L       R+   + R KY R+   + + T Q
Sbjct: 368 GQKGHIETKCPNFRKRKTNYTKGCLLCGKRNHREKRCSYRSKYFREQCFMNETTIQ 423
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15128197" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15128197></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15128197&dopt=GenPept" >gb|AAK84420.1|AF400063_1</a> (AF400063) neuralized 1 [Mus musculus]
          Length = 574

 Score = 31.6 bits (70), Expect = 6.2
 Identities = 14/37 (37%), Positives = 21/37 (55%), Gaps = 1/37 (2%)
 Frame = +3

Query: 225 SCKHTTLCSSCGKSMALS-SARCLVCSAPITNLIREY 332
           +C H  LC SCG  +  +  A C +C  PI ++I+ Y
Sbjct: 535 TCGHMCLCYSCGLRLKKALHACCPICRRPIKDIIKTY 571
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="10946688" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 10946688></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=10946688&dopt=GenPept" >ref|NP_067335.1|</a> (NM_021360) neuralized homolog (Drosophila) [Mus musculus]
 <a name = 6688679></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=06688679&dopt=GenPept" >emb|CAB65238.1|</a> (Y15160) neuralized-like protein [Mus musculus]
          Length = 574

 Score = 31.6 bits (70), Expect = 6.2
 Identities = 14/37 (37%), Positives = 21/37 (55%), Gaps = 1/37 (2%)
 Frame = +3

Query: 225 SCKHTTLCSSCGKSMALS-SARCLVCSAPITNLIREY 332
           +C H  LC SCG  +  +  A C +C  PI ++I+ Y
Sbjct: 535 TCGHMCLCYSCGLRLKKALHACCPICRRPIKDIIKTY 571
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15226959" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15226959></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15226959&dopt=GenPept" >ref|NP_181076.1|</a> (NM_129085) unknown protein; protein id: At2g35330.1 [Arabidopsis
           thaliana]
 <a name = 3608154></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=03608154&dopt=GenPept" >gb|AAC36187.1|</a> (AC005314) unknown protein [Arabidopsis thaliana]
          Length = 711

 Score = 31.6 bits (70), Expect = 6.2
 Identities = 14/36 (38%), Positives = 18/36 (49%), Gaps = 1/36 (2%)
 Frame = +3

Query: 228 CKHTTLCSSCGKS-MALSSARCLVCSAPITNLIREY 332
           C H  +C+SC  S M    A C  C AP+   IR +
Sbjct: 672 CAHQVVCASCSDSFMGSGKATCPCCRAPVQQRIRVF 707
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="17231254" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 17231254></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17231254&dopt=GenPept" >ref|NP_487802.1|</a> (NC_003272) oligopeptide binding protein of ABC transporter [Nostoc
           sp. PCC 7120]
 <a name = 17132896></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=17132896&dopt=GenPept" >dbj|BAB75461.1|</a> (AP003594) oligopeptide binding protein of ABC transporter [Nostoc
           sp. PCC 7120]
          Length = 588

 Score = 31.6 bits (70), Expect = 6.2
 Identities = 18/58 (31%), Positives = 29/58 (49%), Gaps = 3/58 (5%)
 Frame = +3

Query: 333 NVRANATTDKSFSIGRFVTGLPPFSKK---KSAENKWSLHKEGLQGRQIPENMREKYN 497
           N    ATT  ++ + + V  +  ++ K   +S    WSL   GL G  IP ++ EK+N
Sbjct: 143 NPAVGATTSANYEVVKSVEAIDDYTVKVNFQSPNPAWSLPFVGLNGMIIPRHIFEKFN 200
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15320749" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15320749></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15320749&dopt=GenPept" >ref|NP_203261.1|</a> (NC_003083) IAP-4 [Epiphyas postvittana nucleopolyhedrovirus]
 <a name = 4378822></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=04378822&dopt=GenPept" >gb|AAD19699.1|</a> (AF119228) apoptosis inhibitor iap-4 [Epiphyas postvittana
           nucleopolyhedrovirus]
 <a name = 15213217></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15213217&dopt=GenPept" >gb|AAK85656.1|</a> (AY043265) IAP-4 [Epiphyas postvittana nucleopolyhedrovirus]
          Length = 141

 Score = 31.6 bits (70), Expect = 6.2
 Identities = 14/36 (38%), Positives = 21/36 (57%)
 Frame = +3

Query: 228 CKHTTLCSSCGKSMALSSARCLVCSAPITNLIREYN 335
           C H TLC+ C  S+ +    CL+C  P+T  + +YN
Sbjct: 106 CGHYTLCTVC--SVQMCGKPCLLCQMPVTEYV-DYN 138
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="22531056" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 22531056></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=22531056&dopt=GenPept" >gb|AAM97032.1|</a> (AY136366) unknown protein [Arabidopsis thaliana]
          Length = 738

 Score = 31.6 bits (70), Expect = 6.2
 Identities = 14/36 (38%), Positives = 18/36 (49%), Gaps = 1/36 (2%)
 Frame = +3

Query: 228 CKHTTLCSSCGKS-MALSSARCLVCSAPITNLIREY 332
           C H  +C+SC  S M    A C  C AP+   IR +
Sbjct: 699 CAHQVVCASCSDSFMGSGKATCPCCRAPVQQRIRVF 734
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="20890044" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 20890044></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=20890044&dopt=GenPept" >ref|XP_123433.1|</a> (XM_123433) similar to neuralized homolog (Drosophila) [Mus
           musculus]
          Length = 499

 Score = 31.6 bits (70), Expect = 6.2
 Identities = 14/37 (37%), Positives = 21/37 (55%), Gaps = 1/37 (2%)
 Frame = +3

Query: 225 SCKHTTLCSSCGKSMALS-SARCLVCSAPITNLIREY 332
           +C H  LC SCG  +  +  A C +C  PI ++I+ Y
Sbjct: 460 TCGHMCLCYSCGLRLKKALHACCPICRRPIKDIIKTY 496
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="15420883" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 15420883></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=15420883&dopt=GenPept" >gb|AAK97495.1|AF401228_1</a> (AF401228) neuralized [Mus musculus]
          Length = 557

 Score = 31.6 bits (70), Expect = 6.2
 Identities = 14/37 (37%), Positives = 21/37 (55%), Gaps = 1/37 (2%)
 Frame = +3

Query: 225 SCKHTTLCSSCGKSMALS-SARCLVCSAPITNLIREY 332
           +C H  LC SCG  +  +  A C +C  PI ++I+ Y
Sbjct: 518 TCGHMCLCYSCGLRLKKALHACCPICRRPIKDIIKTY 554
</PRE>


<PRE>
<input type="checkbox" name="getSeqGi" value="18590406" onClick="synchronizeCheck(this.value, ''getSeqAlignment'', ''getSeqGi'', this.checked)">><a name = 18590406></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=18590406&dopt=GenPept" >ref|XP_085974.1|</a> (XM_085974) similar to zinc finger protein [Homo sapiens]
          Length = 241

 Score = 31.6 bits (70), Expect = 6.2
 Identities = 16/50 (32%), Positives = 22/50 (44%), Gaps = 11/50 (22%)
 Frame = +3

Query: 186 CEGCGSPSDLYGTSCKHTTL--------CSSCGKSMALSS---ARCLVCS 302
           C  CG   +   T C+H  +        CS CGKS + SS     C +C+
Sbjct: 187 CHACGKAFNTSSTLCQHNRIHTGEKPFQCSQCGKSFSCSSHLTRHCRMCN 236
</PRE>


</form>
<table border="0"><tr><td><FORM  method="post" action="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?SUBMIT=y" name="submitterBottom"><input type=button value="Get selected sequences" onClick="finalSubmit(0, ''getSeqAlignment'', ''getSeqGi'', ''submitterBottom'')"><input type="hidden" name="db" value=""><input type="hidden" name="term" value=""><input type="hidden" name="doptcmdl" value="docsum"><input type="hidden" name="cmd" value="search"></form></td><td><FORM><input type="button" value="Select all" onClick="handleCheckAll(''select'', ''getSeqAlignment'', ''getSeqGi'')"></form></td><td><FORM><input type="button" value="Deselect all" onClick="handleCheckAll(''deselect'', ''getSeqAlignment'', ''getSeqGi'')"></form></td></tr></table><form>

<PRE>
  Database: All non-redundant GenBank CDS
  translations+PDB+SwissProt+PIR+PRF
    Posted date:  Sep 19, 2002  1:01 AM
  Number of letters in database: 370,891,306
  Number of sequences in database:  1,171,253
  
Lambda     K      H
   0.318    0.135    0.401 

Gapped
Lambda     K      H
   0.267   0.0410    0.140 


Matrix: BLOSUM62
Gap Penalties: Existence: 11, Extension: 1
Number of Hits to DB: 342,546,019
Number of Sequences: 1171253
Number of extensions: 6751909
Number of successful extensions: 24973
Number of sequences better than 10.0: 122
Number of HSP''s better than 10.0 without gapping: 23403
Number of HSP''s successfully gapped in prelim test: 0
Number of HSP''s that attempted gapping in prelim test: 0
Number of HSP''s gapped (non-prelim): 24941
length of database: 370,891,306
effective HSP length: 115
effective length of database: 236,197,211
effective search space used: 17950988036
frameshift window, decay const: 50,  0.1
T: 12
A: 40
X1: 16 ( 7.3 bits)
X2: 38 (14.6 bits)
X3: 64 (24.7 bits)
S1: 41 (21.7 bits)

</form>

'
]

{ #category : #'results-ready' }
BioWebBlastSamples >> bt073Txt [
	"WARNING: This is code generated automatically.
 On: 27 December 2010 - 5:37:15 pm"

	^ '<HTML>
<HEAD>
</HEAD>
<BODY BGCOLOR="#FFFFFF" LINK="#0000FF" VLINK="#660099" ALINK="#660099">
<IMG SRC="images/head_results.gif" ALT="Header of the page" BORDER="0"NAME="BlastHeaderGif" WIDTH="600" HEIGHT="45" ALIGN="middle">
<form action="Blast.cgi" enctype="application/x-www-form-urlencoded" method="POST"><input name="ALIGNMENTS" type="hidden" value="50"><input name="AUTO_FORMAT" type="hidden" value="on"><input name="CLIENT" type="hidden" value="web"><input name="DESCRIPTIONS" type="hidden" value="100"><input name="EXPECT" type="hidden" value="10"><input name="HITLIST_SIZE" type="hidden" value="100"><input name="LAYOUT" type="hidden" value="OneWindow"><input name="NCBI_GI" type="hidden" value="checked"><input name="PAGE" type="hidden" value="Nucleotides"><input name="RID" type="hidden" value="1038164033-015457-19065"><input name="RTOE" type="hidden" value="18"><input name="SHOW_OVERVIEW" type="hidden" value="checked"><input name="STEP_NUMBER" type="hidden" value="1"><input name="CMD" type="hidden" value="Get"></form>
<form action="Blast.cgi" enctype="application/x-www-form-urlencoded" method="POST" TARGET=""><input name="ALIGNMENTS" type="hidden" value="50"><input name="AUTO_FORMAT" type="hidden" value="on"><input name="CLIENT" type="hidden" value="web"><input name="DESCRIPTIONS" type="hidden" value="100"><input name="EXPECT" type="hidden" value="10"><input name="HITLIST_SIZE" type="hidden" value="100"><input name="LAYOUT" type="hidden" value="OneWindow"><input name="NCBI_GI" type="hidden" value="checked"><input name="PAGE" type="hidden" value="Nucleotides"><input name="RID" type="hidden" value="1038164033-015457-19065"><input name="RTOE" type="hidden" value="18"><input name="SHOW_OVERVIEW" type="hidden" value="checked"><input name="STEP_NUMBER" type="hidden" value="1"><input name="CMD" type="hidden" value="Get">

<p><!--
QBlastInfoBegin
	Status=READY
QBlastInfoEnd
--><p><TITLE> RID=1038164033-015457-19065, gi|25056539|ref|XM_195248.1| Mus musculus similar to putative polyubiquitin (UBQ10) [Arabidopsis thaliana] (LOC270670), mRNA </TITLE>
<b>BLASTN 2.2.4 [Aug-26-2002]</b>

<pre>
<b><a href="http://www.ncbi.nlm.nih.gov/htbin-
post/Entrez/query?uid=9254694&form=6&db=m&Dopt=r">Reference</a>:</b>
Altschul, Stephen F., Thomas L. Madden, Alejandro A. Sch&auml;ffer, 
Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), 
"Gapped BLAST and PSI-BLAST: a new generation of protein database search
programs",  Nucleic Acids Res. 25:3389-3402.
<p>
RID: 1038164033-015457-19065
<p>
<b>Query=</b> gi|25056539|ref|XM_195248.1| Mus musculus similar to
putative polyubiquitin (UBQ10) [Arabidopsis thaliana] (LOC270670),
mRNA
         (285 letters)

<p>
<b>Database:</b> All GenBank+EMBL+DDBJ+PDB sequences (but no EST, STS,
GSS, or phase 0, 1 or 2 HTGS sequences) 
           1,473,826 sequences; 7,284,980,748 total letters

<p> <p>If you have any problems or questions with the results of this search <br>please refer to the <b><a href=http://www.ncbi.nlm.nih.gov/blast/blast_FAQs.html>BLAST FAQs</a></b><br><p>
<a href="Blast.cgi?CMD=Get&RID=1038164033-015457-19065&FORMAT_OBJECT=TaxBlast" TARGET="Taxonomy BLAST Results for 1038164033-015457-19065">Taxonomy reports</a>
<BR>
<PRE>


                                                                 Score    E
Sequences producing significant alignments:                      (bits) Value

<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=25056539&dopt=GenBank" >ref|XM_195248.1|</a>  Mus musculus similar to putative polyubiqu...   <a href = #25056539>565</a>   e-158
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20302084&dopt=GenBank" >ref|NM_138895.1|</a>  Rattus norvegicus polyubiquitin (Loc192255...   <a href = #20302084>333</a>   8e-89
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00471155&dopt=GenBank" >dbj|D16554.1|RATPOLYU</a>  Rat mRNA for polyubiquitin (four repe...   <a href = #471155>333</a>   8e-89
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=18044722&dopt=GenBank" >gb|BC019850.1|</a>  Mus musculus, ubiquitin B, clone MGC:29922 I...   <a href = #18044722>325</a>   2e-86
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=06755918&dopt=GenBank" >ref|NM_011664.1|</a>  Mus musculus ubiquitin B (Ubb), mRNA            <a href = #6755918>315</a>   2e-83
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=18476730&dopt=GenBank" >emb|AL596181.10|</a>  Mouse DNA sequence from clone RP23-234K24 ...   <a href = #18476730>315</a>   2e-83
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00055117&dopt=GenBank" >emb|X51703.1|MMUBIQU</a>  Mouse mRNA for ubiquitin                    <a href = #55117>315</a>   2e-83
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12849188&dopt=GenBank" >dbj|AK012443.1|</a>  Mus musculus 11 days embryo whole body cDNA...   <a href = #12849188>315</a>   2e-83
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12850136&dopt=GenBank" >dbj|AK013027.1|</a>  Mus musculus 10, 11 days embryo whole body ...   <a href = #12850136>315</a>   2e-83
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12846201&dopt=GenBank" >dbj|AK010625.1|</a>  Mus musculus ES cells cDNA, RIKEN full-leng...   <a href = #12846201>315</a>   2e-83
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12833701&dopt=GenBank" >dbj|AK003190.1|</a>  Mus musculus 18 days embryo whole body cDNA...   <a href = #12833701>315</a>   2e-83
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12845837&dopt=GenBank" >dbj|AK010413.1|</a>  Mus musculus ES cells cDNA, RIKEN full-leng...   <a href = #12845837>315</a>   2e-83
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12840716&dopt=GenBank" >dbj|AK007273.1|</a>  Mus musculus adult male testis cDNA, RIKEN ...   <a href = #12840716>315</a>   2e-83
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20873674&dopt=GenBank" >ref|XM_122700.1|</a>  Mus musculus similar to polyubiquitin 10 -...   <a href = #20873674>303</a>   7e-80
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=23593636&dopt=GenBank" >ref|XM_135280.2|</a>  Mus musculus similar to polyubiquitin [Rat...   <a href = #23593636>303</a>   7e-80
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00049476&dopt=GenBank" >emb|X60390.1|CGPOLYUGE</a>  C.griseus gene for polyubiquitin          <a href = #49476>303</a>   7e-80
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20864222&dopt=GenBank" >ref|XM_143052.1|</a>  Mus musculus similar to fusion protein: ub...   <a href = #20864222>301</a>   3e-79
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00049585&dopt=GenBank" >emb|X08013.1|CSUBIQ</a>  Chinese hamster mRNA for ubiquitin           <a href = #49585>301</a>   3e-79
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12851403&dopt=GenBank" >dbj|AK013873.1|</a>  Mus musculus 12 days embryo head cDNA, RIKE...   <a href = #12851403>301</a>   3e-79
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00202260&dopt=GenBank" >gb|M81745.1|MUSUBIQB</a>  Mouse 1400 base pair ubiquitin mRNA, 3...   <a href = #202260>291</a>   3e-76
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=21070214&dopt=GenBank" >gb|AF506969.1|</a>  Equus caballus ubiquitin mRNA, complete cds       <a href = #21070214>287</a>   4e-75
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=02707836&dopt=GenBank" >gb|AF038129.1|AF038129</a>  Ovis aries polyubiquitin mRNA, compl...   <a href = #2707836>285</a>   2e-74
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00000644&dopt=GenBank" >emb|Z18245.1|BTPOLYUB</a>  Bos taurus gene for polyubiquitin          <a href = #644>285</a>   2e-74
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=15451312&dopt=GenBank" >dbj|AB071067.1|</a>  Macaca fascicularis testis cDNA clone:QtsA-...   <a href = #15451312>283</a>   6e-74
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00987828&dopt=GenBank" >emb|Z54175.1|BVDTGACB1</a>  Bovine viral diarrhea virus TGAC-B1 RNA   <a href = #987828>280</a>   1e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00987825&dopt=GenBank" >emb|Z54176.1|BVDCPA2</a>  Bovine viral diarrhea virus cpA2 RNA        <a href = #987825>280</a>   1e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00163574&dopt=GenBank" >gb|M62429.1|BOVPOUBA</a>  Bovine polyubiquitin mRNA, 3'' end, clo...   <a href = #163574>280</a>   1e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=24660326&dopt=GenBank" >gb|BC038999.1|</a>  Homo sapiens, ubiquitin B, clone IMAGE:49432...   <a href = #24660326>278</a>   4e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=22538474&dopt=GenBank" >ref|NM_018955.2|</a>  Homo sapiens ubiquitin B (UBB), mRNA            <a href = #22538474>278</a>   4e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=21410248&dopt=GenBank" >gb|BC031027.1|</a>  Homo sapiens, clone MGC:32826 IMAGE:4715377,...   <a href = #21410248>278</a>   4e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20070822&dopt=GenBank" >gb|BC026301.1|</a>  Homo sapiens, clone MGC:24729 IMAGE:4280629,...   <a href = #20070822>278</a>   4e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=18308345&dopt=GenBank" >gb|AC093484.2|</a>  Homo sapiens chromosome , clone RP11-138I1, ...   <a href = #18308345>278</a>   4e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=15929388&dopt=GenBank" >gb|BC015127.1|BC015127</a>  Homo sapiens, clone MGC:24232 IMAGE:...   <a href = #15929388>278</a>   4e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=14424551&dopt=GenBank" >gb|BC009301.1|BC009301</a>  Homo sapiens, clone MGC:16688 IMAGE:...   <a href = #14424551>278</a>   4e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12653220&dopt=GenBank" >gb|BC000379.1|BC000379</a>  Homo sapiens, ubiquitin B, clone MGC...   <a href = #12653220>278</a>   4e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=06647297&dopt=GenBank" >emb|X04803.2|HSYUBG1</a>  Homo sapiens ubiquitin gene                 <a href = #6647297>278</a>   4e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=14488116&dopt=GenBank" >emb|AL356460.3|HS84M10</a>  Homo sapiens chromosome 17 from PAC ...   <a href = #14488116>278</a>   4e-72
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20163047&dopt=GenBank" >gb|AC068902.20|</a>  Mus musculus clone rp23-151l10, complete se...   <a href = #20163047>276</a>   2e-71
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=15680082&dopt=GenBank" >gb|BC014367.1|BC014367</a>  Homo sapiens, Similar to orosomucoid...   <a href = #15680082>276</a>   2e-71
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20068526&dopt=GenBank" >emb|AL603923.7|</a>  Mouse DNA sequence from clone RP23-180L15 o...   <a href = #20068526>276</a>   2e-71
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00323207&dopt=GenBank" >gb|M62431.1|BVDCP1</a>  Bovine viral diarrhea virus CP1 putative...   <a href = #323207>270</a>   9e-70
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=24942955&dopt=GenBank" >gb|AC087575.11|</a>  Homo sapiens chromosome 17, clone RP11-305L...   <a href = #24942955>268</a>   4e-69
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=22064817&dopt=GenBank" >ref|XM_170833.1|</a>  Homo sapiens similar to polyubiquitin (UBQ...   <a href = #22064817>268</a>   4e-69
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00323229&dopt=GenBank" >gb|M96687.1|BVDPP</a>  Bovine viral diarrhea virus polyprotein g...   <a href = #323229>262</a>   2e-67
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=24047132&dopt=GenBank" >ref|NG_002287.1|</a>  Homo sapiens ubiquitin B pseudogene 2 (UBB...   <a href = #24047132>258</a>   4e-66
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00037582&dopt=GenBank" >emb|X04802.1|HSUBPSE2</a>  Homo sapiens UBBP2 pseudogene for ubi...   <a href = #37582>258</a>   4e-66
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00323216&dopt=GenBank" >gb|M87812.1|BVDMSEQH</a>  Bovine viral diarrhea virus mRNA sequence   <a href = #323216>254</a>   6e-65
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=09837283&dopt=GenBank" >gb|AF285161.1|AF285161</a>  Mus musculus cell-line C3H/He polyub...   <a href = #9837283>246</a>   1e-62
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=24047130&dopt=GenBank" >ref|NG_002285.1|</a>  Homo sapiens ubiquitin B pseudogene 4 (UBB...   <a href = #24047130>242</a>   2e-61
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00037572&dopt=GenBank" >emb|X07499.1|HSUBBP</a>  Homo sapiens UBBP4 pseudogene for ubiqu...   <a href = #37572>242</a>   2e-61
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=16973876&dopt=GenBank" >emb|AL445428.5|</a>  Human DNA sequence from clone RP11-144C20 o...   <a href = #16973876>242</a>   2e-61
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=23958187&dopt=GenBank" >gb|BC036303.1|</a>  Mus musculus, Similar to ubiquitin C, clone ...   <a href = #23958187>238</a>   3e-60
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=18256863&dopt=GenBank" >gb|BC021837.1|</a>  Mus musculus, Similar to ubiquitin C, clone ...   <a href = #18256863>238</a>   3e-60
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=19483856&dopt=GenBank" >gb|BC025894.1|</a>  Mus musculus, Similar to RIKEN cDNA 2700054O...   <a href = #19483856>238</a>   3e-60
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=14250447&dopt=GenBank" >gb|BC008661.1|</a>  Mus musculus, clone MGC:11492 IMAGE:3598724,...   <a href = #14250447>238</a>   3e-60
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=13879397&dopt=GenBank" >gb|BC006680.1|</a>  Mus musculus, Similar to ubiquitin C, clone ...   <a href = #13879397>238</a>   3e-60
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=21070949&dopt=GenBank" >ref|NM_019639.2|</a>  Mus musculus ubiquitin C (Ubc), mRNA            <a href = #21070949>238</a>   3e-60
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20842691&dopt=GenBank" >ref|XM_147315.1|</a>  Mus musculus ubiquitin C (Ubc), mRNA            <a href = #20842691>238</a>   3e-60
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=09837285&dopt=GenBank" >gb|AF285162.1|AF285162</a>  Mus musculus cell-line C3H/RV polyub...   <a href = #9837285>238</a>   3e-60
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12849162&dopt=GenBank" >dbj|AK012427.1|</a>  Mus musculus 11 days embryo whole body cDNA...   <a href = #12849162>238</a>   3e-60
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12846765&dopt=GenBank" >dbj|AK010964.1|</a>  Mus musculus 13 days embryo liver cDNA, RIK...   <a href = #12846765>238</a>   3e-60
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00208890&dopt=GenBank" >gb|M11691.1|SYNMUSUBGA</a>  Synthetic beta-galactosidase/mouse u...   <a href = #208890>238</a>   3e-60
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00940394&dopt=GenBank" >dbj|D63782.1|CRUPUQ</a>  Chinese hamster gene for polyubiquitin,...   <a href = #940394>234</a>   5e-59
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=05523986&dopt=GenBank" >gb|AF104029.1|AF104029</a>  Bovine viral diarrhea virus-2 subgen...   <a href = #5523986>232</a>   2e-58
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=05523980&dopt=GenBank" >gb|AF104026.1|AF104026</a>  Bovine viral diarrhea virus-2 subgen...   <a href = #5523980>232</a>   2e-58
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=05523978&dopt=GenBank" >gb|AF104025.1|AF104025</a>  Bovine viral diarrhea virus-2 subgen...   <a href = #5523978>232</a>   2e-58
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=05523976&dopt=GenBank" >gb|AF104024.1|AF104024</a>  Bovine viral diarrhea virus-2 subgen...   <a href = #5523976>232</a>   2e-58
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=05523974&dopt=GenBank" >gb|AF104023.1|AF104023</a>  Bovine viral diarrhea virus-2 subgen...   <a href = #5523974>232</a>   2e-58
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=05523972&dopt=GenBank" >gb|AF104022.1|AF104022</a>  Bovine viral diarrhea virus-2 subgen...   <a href = #5523972>232</a>   2e-58
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=05523970&dopt=GenBank" >gb|AF104021.1|AF104021</a>  Bovine viral diarrhea virus-2 subgen...   <a href = #5523970>232</a>   2e-58
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=05523968&dopt=GenBank" >gb|AF104020.1|AF104020</a>  Bovine viral diarrhea virus-2 subgen...   <a href = #5523968>232</a>   2e-58
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=05523966&dopt=GenBank" >gb|AF104019.1|AF104019</a>  Bovine viral diarrhea virus-2 subgen...   <a href = #5523966>232</a>   2e-58
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00289506&dopt=GenBank" >gb|L13783.1|BVDP125A</a>  Bovine viral diarrhea virus p125 prote...   <a href = #289506>232</a>   2e-58
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=01197092&dopt=GenBank" >dbj|D83208.1|GPIUBIY</a>  Cavia cobaya mRNA for ubiquitin, compl...   <a href = #1197092>232</a>   2e-58
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=02627132&dopt=GenBank" >dbj|AB003732.1|</a>  Cricetulus griseus gene for polyubiquitin, ...   <a href = #2627132>226</a>   1e-56
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=02627130&dopt=GenBank" >dbj|AB003731.1|</a>  Cricetulus griseus gene for polyubiquitin, ...   <a href = #2627130>226</a>   1e-56
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=22798393&dopt=GenBank" >emb|AL808018.7|</a>  Mouse DNA sequence from clone RP23-473C10 o...   <a href = #22798393>226</a>   1e-56
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=23895840&dopt=GenBank" >emb|AL845466.3|</a>  Mouse DNA sequence from clone RP23-433P19 o...   <a href = #23895840>224</a>   5e-56
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00163572&dopt=GenBank" >gb|M62428.1|BOVPOUB</a>  Bovine polyubiquitin mRNA, 3'' end, clon...   <a href = #163572>224</a>   5e-56
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=08394501&dopt=GenBank" >ref|NM_017314.1|</a>  Rattus norvegicus ubiquitin C (Ubc), mRNA       <a href = #8394501>222</a>   2e-55
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00471153&dopt=GenBank" >dbj|D17296.1|RATPILP</a>  Rat mRNA for polyubiquitin (ten comple...   <a href = #471153>222</a>   2e-55
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=05523982&dopt=GenBank" >gb|AF104027.1|AF104027</a>  Bovine viral diarrhea virus-2 subgen...   <a href = #5523982>220</a>   8e-55
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=10121775&dopt=GenBank" >gb|AF268174.1|AF268174</a>  Bovine viral diarrhea virus type 2 s...   <a href = #10121775>218</a>   3e-54
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=05523984&dopt=GenBank" >gb|AF104028.1|AF104028</a>  Bovine viral diarrhea virus-2 subgen...   <a href = #5523984>216</a>   1e-53
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00323217&dopt=GenBank" >gb|M87813.1|BVDMSEQI</a>  Bovine viral diarrhea virus mRNA sequence   <a href = #323217>214</a>   5e-53
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=01167509&dopt=GenBank" >dbj|D50527.1|MUSTI225D</a>  Mouse mRNA for TI-225, complete cds       <a href = #1167509>214</a>   5e-53
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00463374&dopt=GenBank" >gb|U03707.1|QSU03707</a>  Quinqueloculina seminulum ubiquitin ge...   <a href = #463374>212</a>   2e-52
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=24657521&dopt=GenBank" >gb|BC039193.1|</a>  Homo sapiens, Similar to ubiquitin C, clone ...   <a href = #24657521>202</a>   2e-49
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=22058885&dopt=GenBank" >ref|XM_055013.5|</a>  Homo sapiens ubiquitin C (UBC), mRNA            <a href = #22058885>202</a>   2e-49
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=22003948&dopt=GenBank" >gb|AC126309.8|</a>  Homo sapiens 12 BAC RP11-592O2 (Roswell Park...   <a href = #22003948>202</a>   2e-49
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=14286307&dopt=GenBank" >gb|BC008955.1|BC008955</a>  Homo sapiens, Similar to ubiquitin C...   <a href = #14286307>202</a>   2e-49
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12653358&dopt=GenBank" >gb|BC000449.1|BC000449</a>  Homo sapiens, Similar to ubiquitin C...   <a href = #12653358>202</a>   2e-49
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=02627128&dopt=GenBank" >dbj|AB003730.1|</a>  Homo sapiens gene for polyubiquitin, comple...   <a href = #2627128>202</a>   2e-49
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=10439801&dopt=GenBank" >dbj|AK026846.1|</a>  Homo sapiens cDNA: FLJ23193 fis, clone REC0...   <a href = #10439801>202</a>   2e-49
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=01304127&dopt=GenBank" >dbj|D63791.1|HUMPOLYUBI</a>  Human UbC gene for polyubiquitin, e...   <a href = #1304127>202</a>   2e-49
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=02647407&dopt=GenBank" >dbj|AB009010.1|</a>  Homo sapiens mRNA for polyubiquitin UbC, co...   <a href = #2647407>202</a>   2e-49
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=21758959&dopt=GenBank" >dbj|AK098827.1|</a>  Homo sapiens cDNA FLJ25961 fis, clone TST09...   <a href = #21758959>202</a>   2e-49
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00063746&dopt=GenBank" >emb|X58195.1|GGPOUBII</a>  G.gallus DNA for polyubiquitin gene U...   <a href = #63746>200</a>   7e-49
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=01050929&dopt=GenBank" >emb|X92661.1|RNUBC5</a>  R.norvegicus mRNA for polyubiquitin 5'' end   <a href = #1050929>200</a>   7e-49
<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00212848&dopt=GenBank" >gb|M14693.1|CHKUB1A</a>  Chicken ubiquitin I (UbI) gene, partial...   <a href = #212848>200</a>   7e-49
</PRE>
<CENTER><b><FONT color="green">Alignments</FONT></b></CENTER>
</form>
<PRE>
><a name = 25056539></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=25056539&dopt=GenBank" >ref|XM_195248.1|</a> Mus musculus similar to putative polyubiquitin (UBQ10) [Arabidopsis
           thaliana] (LOC270670), mRNA
          Length = 285

 Score =  565 bits (285), Expect = e-158
 Identities = 285/285 (100%)
 Strand = Plus / Plus

                                                                       
Query: 1   atgggcattttgaaggcaagagcagacatgttggaaaaggaatctggaggcacctgggtc 60
           ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct: 1   atgggcattttgaaggcaagagcagacatgttggaaaaggaatctggaggcacctgggtc 60

                                                                       
Query: 61  aaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagccc 120
           ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct: 61  aaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagccc 120

                                                                       
Query: 121 agtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccccccgacc 180
           ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct: 121 agtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccccccgacc 180

                                                                       
Query: 181 agcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattaca 240
           ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct: 181 agcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattaca 240

                                                        
Query: 241 acatccagaaagagtcgaccctgcacctggtcctctggctattaa 285
           |||||||||||||||||||||||||||||||||||||||||||||
Sbjct: 241 acatccagaaagagtcgaccctgcacctggtcctctggctattaa 285
</PRE>


<PRE>
><a name = 20302084></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20302084&dopt=GenBank" >ref|NM_138895.1|</a> Rattus norvegicus polyubiquitin (Loc192255), mRNA
          Length = 1115

 Score =  333 bits (168), Expect = 8e-89
 Identities = 208/220 (94%), Gaps = 1/220 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||||||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 57  ggtcaaaatgcaaatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 116

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||||
Sbjct: 117 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccc 176

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            ||||||||||||||||||||||| |||||||| |||||||||||| ||||| |||||||
Sbjct: 177 tgaccagcagaggctcatctttgccggcaagcagctggaagatggccgcaccctctctga 236

                                                   
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcctc 275
            |||||||||||||||||||| ||||||||||||||||||
Sbjct: 237 ctacaacatccagaaagagtcaaccctgcacctggtcctc 276
</PRE>


<PRE>

 Score =  311 bits (157), Expect = 3e-82
 Identities = 200/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 748 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 807

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 808 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 867

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 868 cagaggctcatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 927

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 928 atccagaaagagtcaaccctgcacctggtcctc 960
</PRE>


<PRE>

 Score =  311 bits (157), Expect = 3e-82
 Identities = 200/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||||||| |||||||||||
Sbjct: 520 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtggagcccagt 579

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 580 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 639

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 640 cagaggctcatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 699

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||| ||||| ||||||||||||||||||
Sbjct: 700 atccagaaggagtcaaccctgcacctggtcctc 732
</PRE>


<PRE>

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 292 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 351

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 352 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 411

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 412 cagaggctcatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 471

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||| ||||||
Sbjct: 472 atccagaaagagtcaaccctgcaccttgtcctc 504
</PRE>


<PRE>
><a name = 471155></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00471155&dopt=GenBank" >dbj|D16554.1|RATPOLYU</a> Rat mRNA for polyubiquitin (four repetitive ubiquitins in tandem),
           complete cds
          Length = 1115

 Score =  333 bits (168), Expect = 8e-89
 Identities = 208/220 (94%), Gaps = 1/220 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||||||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 57  ggtcaaaatgcaaatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 116

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||||
Sbjct: 117 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccc 176

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            ||||||||||||||||||||||| |||||||| |||||||||||| ||||| |||||||
Sbjct: 177 tgaccagcagaggctcatctttgccggcaagcagctggaagatggccgcaccctctctga 236

                                                   
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcctc 275
            |||||||||||||||||||| ||||||||||||||||||
Sbjct: 237 ctacaacatccagaaagagtcaaccctgcacctggtcctc 276
</PRE>


<PRE>

 Score =  311 bits (157), Expect = 3e-82
 Identities = 200/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 748 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 807

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 808 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 867

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 868 cagaggctcatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 927

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 928 atccagaaagagtcaaccctgcacctggtcctc 960
</PRE>


<PRE>

 Score =  311 bits (157), Expect = 3e-82
 Identities = 200/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||||||| |||||||||||
Sbjct: 520 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtggagcccagt 579

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 580 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 639

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 640 cagaggctcatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 699

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||| ||||| ||||||||||||||||||
Sbjct: 700 atccagaaggagtcaaccctgcacctggtcctc 732
</PRE>


<PRE>

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 292 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 351

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 352 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 411

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 412 cagaggctcatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 471

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||| ||||||
Sbjct: 472 atccagaaagagtcaaccctgcaccttgtcctc 504
</PRE>


<PRE>
><a name = 18044722></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=18044722&dopt=GenBank" >gb|BC019850.1|</a> Mus musculus, ubiquitin B, clone MGC:29922 IMAGE:5123849, mRNA,
           complete cds
          Length = 1146

 Score =  325 bits (164), Expect = 2e-86
 Identities = 207/220 (94%), Gaps = 1/220 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 61  ggtcaaaatgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 120

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||||
Sbjct: 121 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccc 180

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||| |||||||| |||||||| |||||||||||| ||||| |||||||
Sbjct: 181 tgaccagcagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctga 240

                                                   
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcctc 275
           ||||||||||||||||||||| ||||||||||||||||||
Sbjct: 241 ttacaacatccagaaagagtcaaccctgcacctggtcctc 280
</PRE>


<PRE>

 Score =  311 bits (157), Expect = 3e-82
 Identities = 200/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 752 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 811

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||||||||||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 812 gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccctgaccag 871

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||  ||||||||||||||
Sbjct: 872 cagaggctgatctttgccggcaagcagctggaagatggccgcactctctctgattacaac 931

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||||||||
Sbjct: 932 atccagaaagagtcgaccctgcacctggtcctc 964
</PRE>


<PRE>

 Score =  301 bits (152), Expect = 3e-79
 Identities = 198/212 (93%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||||||||||||||||||||| ||| |||||||||||
Sbjct: 524 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctggaggtggagcccagt 583

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 584 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 643

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 644 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 703

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| ||||| |||||||||||||||||
Sbjct: 704 atccagaaggagtcaaccctgcacctggtcct 735
</PRE>


<PRE>

 Score =  295 bits (149), Expect = 2e-77
 Identities = 198/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 296 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 355

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||||||||||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 356 gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccctgaccag 415

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           || ||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 416 cataggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 475

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||| ||||| ||||||||||||||||||
Sbjct: 476 atccagaaggagtcaaccctgcacctggtcctc 508
</PRE>


<PRE>
><a name = 6755918></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=06755918&dopt=GenBank" >ref|NM_011664.1|</a> Mus musculus ubiquitin B (Ubb), mRNA
          Length = 1172

 Score =  315 bits (159), Expect = 2e-83
 Identities = 205/219 (93%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 98  ggtcaaaatgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 157

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||||
Sbjct: 158 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccc 217

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||| |||||||| |||||||| |||||||||||| ||||| |||||||
Sbjct: 218 tgaccagcagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctga 277

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||| ||||| |||||||||||||||||
Sbjct: 278 ttacaacatccagaaggagtcaaccctgcacctggtcct 316
</PRE>


<PRE>

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 333 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 392

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 393 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 452

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 453 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 512

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 513 atccagaaagagtcaaccctgcacctggtcctc 545
</PRE>


<PRE>

 Score =  295 bits (149), Expect = 2e-77
 Identities = 198/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||||| |||||||||||| ||||||||||||||| | ||| |||||||||||
Sbjct: 789  atgcagatcttcgtgaagaccctgaccggcaagaccatcaccttggaggtggagcccagt 848

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || |||||||||||||||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 849  gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccctgaccag 908

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||| |||||||| |||||||| || ||||||||| ||||  ||||||||||||||
Sbjct: 909  cagaggctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaac 968

                                             
Query: 243  atccagaaagagtcgaccctgcacctggtcctc 275
            |||||||||||||||||||||||||||||||||
Sbjct: 969  atccagaaagagtcgaccctgcacctggtcctc 1001
</PRE>


<PRE>

 Score =  293 bits (148), Expect = 7e-77
 Identities = 197/212 (92%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||||||||||||||||||||| ||| |||||||||||
Sbjct: 561 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctggaggtggagcccagt 620

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 621 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 680

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| ||||| || |||||||||||| ||||| ||||||||||||||
Sbjct: 681 cagaggctgatctttgccggcaaacagctggaagatggccgcaccctctctgattacaac 740

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| ||||| |||||||||||||||||
Sbjct: 741 atccagaaggagtcaaccctgcacctggtcct 772
</PRE>


<PRE>
><a name = 18476730></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=18476730&dopt=GenBank" >emb|AL596181.10|</a> Mouse DNA sequence from clone RP23-234K24 on chromosome 11, complete
              sequence
          Length = 195339

 Score =  315 bits (159), Expect = 2e-83
 Identities = 205/219 (93%), Gaps = 1/219 (0%)
 Strand = Plus / Minus

                                                                          
Query: 57     ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
              |||||||||||| ||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 122012 ggtcaaaatgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 121953

                                                                          
Query: 117    gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
              ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||||
Sbjct: 121952 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccc 121893

                                                                          
Query: 177    -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
               |||||||||||||| |||||||| |||||||| |||||||||||| ||||| |||||||
Sbjct: 121892 tgaccagcagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctga 121833

                                                     
Query: 236    ttacaacatccagaaagagtcgaccctgcacctggtcct 274
              ||||||||||||||| ||||| |||||||||||||||||
Sbjct: 121832 ttacaacatccagaaggagtcaaccctgcacctggtcct 121794
</PRE>


<PRE>

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Minus

                                                                          
Query: 64     atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
              ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 121777 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 121718

                                                                          
Query: 124    gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
              || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 121717 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 121658

                                                                          
Query: 183    cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
              |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 121657 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 121598

                                               
Query: 243    atccagaaagagtcgaccctgcacctggtcctc 275
              |||||||||||||| ||||||||||||||||||
Sbjct: 121597 atccagaaagagtcaaccctgcacctggtcctc 121565
</PRE>


<PRE>

 Score =  301 bits (152), Expect = 3e-79
 Identities = 198/212 (93%), Gaps = 1/212 (0%)
 Strand = Plus / Minus

                                                                          
Query: 64     atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
              ||||| ||||||| |||||||||||||||||||||||||||||| ||| |||||||||||
Sbjct: 121549 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctggaggtggagcccagt 121490

                                                                          
Query: 124    gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
              || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 121489 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 121430

                                                                          
Query: 183    cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
              |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 121429 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 121370

                                              
Query: 243    atccagaaagagtcgaccctgcacctggtcct 274
              |||||||| ||||| |||||||||||||||||
Sbjct: 121369 atccagaaggagtcaaccctgcacctggtcct 121338
</PRE>


<PRE>

 Score =  295 bits (149), Expect = 2e-77
 Identities = 198/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Minus

                                                                          
Query: 64     atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
              ||||| ||||||| |||||||||||| ||||||||||||||| | ||| |||||||||||
Sbjct: 121321 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccttggaggtggagcccagt 121262

                                                                          
Query: 124    gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
              || |||||||||||||||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 121261 gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccctgaccag 121202

                                                                          
Query: 183    cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
              |||||||| |||||||| |||||||| || ||||||||| ||||  ||||||||||||||
Sbjct: 121201 cagaggctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaac 121142

                                               
Query: 243    atccagaaagagtcgaccctgcacctggtcctc 275
              |||||||||||||||||||||||||||||||||
Sbjct: 121141 atccagaaagagtcgaccctgcacctggtcctc 121109
</PRE>


<PRE>
><a name = 55117></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00055117&dopt=GenBank" >emb|X51703.1|MMUBIQU</a> Mouse mRNA for ubiquitin
          Length = 1172

 Score =  315 bits (159), Expect = 2e-83
 Identities = 205/219 (93%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 98  ggtcaaaatgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 157

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||||
Sbjct: 158 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccc 217

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||| |||||||| |||||||| |||||||||||| ||||| |||||||
Sbjct: 218 tgaccagcagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctga 277

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||| ||||| |||||||||||||||||
Sbjct: 278 ttacaacatccagaaggagtcaaccctgcacctggtcct 316
</PRE>


<PRE>

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 333 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 392

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 393 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 452

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 453 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 512

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 513 atccagaaagagtcaaccctgcacctggtcctc 545
</PRE>


<PRE>

 Score =  295 bits (149), Expect = 2e-77
 Identities = 198/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||||| |||||||||||| ||||||||||||||| | ||| |||||||||||
Sbjct: 789  atgcagatcttcgtgaagaccctgaccggcaagaccatcaccttggaggtggagcccagt 848

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || |||||||||||||||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 849  gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccctgaccag 908

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||| |||||||| |||||||| || ||||||||| ||||  ||||||||||||||
Sbjct: 909  cagaggctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaac 968

                                             
Query: 243  atccagaaagagtcgaccctgcacctggtcctc 275
            |||||||||||||||||||||||||||||||||
Sbjct: 969  atccagaaagagtcgaccctgcacctggtcctc 1001
</PRE>


<PRE>

 Score =  293 bits (148), Expect = 7e-77
 Identities = 197/212 (92%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||||||||||||||||||||| ||| |||||||||||
Sbjct: 561 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctggaggtggagcccagt 620

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 621 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 680

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| ||||| || |||||||||||| ||||| ||||||||||||||
Sbjct: 681 cagaggctgatctttgccggcaaacagctggaagatggccgcaccctctctgattacaac 740

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| ||||| |||||||||||||||||
Sbjct: 741 atccagaaggagtcaaccctgcacctggtcct 772
</PRE>


<PRE>
><a name = 12849188></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12849188&dopt=GenBank" >dbj|AK012443.1|</a> Mus musculus 11 days embryo whole body cDNA, RIKEN full-length
           enriched library, clone:2700055N04:ubiquitin B, full
           insert sequence
          Length = 1166

 Score =  315 bits (159), Expect = 2e-83
 Identities = 205/219 (93%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 94  ggtcaaaatgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 153

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||||
Sbjct: 154 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccc 213

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||| |||||||| |||||||| |||||||||||| ||||| |||||||
Sbjct: 214 tgaccagcagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctga 273

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||| ||||| |||||||||||||||||
Sbjct: 274 ttacaacatccagaaggagtcaaccctgcacctggtcct 312
</PRE>


<PRE>

 Score =  301 bits (152), Expect = 3e-79
 Identities = 198/212 (93%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||||||||||||||||||||| ||| |||||||||||
Sbjct: 557 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctggaggtggagcccagt 616

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 617 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 676

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 677 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 736

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| ||||| |||||||||||||||||
Sbjct: 737 atccagaaggagtcaaccctgcacctggtcct 768
</PRE>


<PRE>

 Score =  297 bits (150), Expect = 4e-78
 Identities = 196/210 (93%), Gaps = 1/210 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 329 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 388

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 389 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 448

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 449 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 508

                                         
Query: 243 atccagaaagagtcgaccctgcacctggtc 272
           |||||||||||||| |||||||||||||||
Sbjct: 509 atccagaaagagtcaaccctgcacctggtc 538
</PRE>


<PRE>

 Score =  295 bits (149), Expect = 2e-77
 Identities = 198/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||| | ||| |||||||||||
Sbjct: 785 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccttggaggtggagcccagt 844

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||||||||||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 845 gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccctgaccag 904

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| || ||||||||| ||||  ||||||||||||||
Sbjct: 905 cagaggctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaac 964

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||||||||
Sbjct: 965 atccagaaagagtcgaccctgcacctggtcctc 997
</PRE>


<PRE>
><a name = 12850136></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12850136&dopt=GenBank" >dbj|AK013027.1|</a> Mus musculus 10, 11 days embryo whole body cDNA, RIKEN full-length
           enriched library, clone:2810407D23:ubiquitin B, full
           insert sequence
          Length = 1167

 Score =  315 bits (159), Expect = 2e-83
 Identities = 205/219 (93%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 93  ggtcaaaatgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 152

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||||
Sbjct: 153 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccc 212

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||| |||||||| |||||||| |||||||||||| ||||| |||||||
Sbjct: 213 tgaccagcagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctga 272

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||| ||||| |||||||||||||||||
Sbjct: 273 ttacaacatccagaaggagtcaaccctgcacctggtcct 311
</PRE>


<PRE>

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 328 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 387

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 388 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 447

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 448 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 507

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 508 atccagaaagagtcaaccctgcacctggtcctc 540
</PRE>


<PRE>

 Score =  301 bits (152), Expect = 3e-79
 Identities = 198/212 (93%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||||||||||||||||||||| ||| |||||||||||
Sbjct: 556 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctggaggtggagcccagt 615

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 616 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 675

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 676 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 735

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| ||||| |||||||||||||||||
Sbjct: 736 atccagaaggagtcaaccctgcacctggtcct 767
</PRE>


<PRE>

 Score =  295 bits (149), Expect = 2e-77
 Identities = 198/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||| | ||| |||||||||||
Sbjct: 784 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccttggaggtggagcccagt 843

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||||||||||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 844 gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccctgaccag 903

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| || ||||||||| ||||  ||||||||||||||
Sbjct: 904 cagaggctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaac 963

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||||||||
Sbjct: 964 atccagaaagagtcgaccctgcacctggtcctc 996
</PRE>


<PRE>
><a name = 12846201></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12846201&dopt=GenBank" >dbj|AK010625.1|</a> Mus musculus ES cells cDNA, RIKEN full-length enriched library,
           clone:2410036G24:ubiquitin B, full insert sequence
          Length = 1160

 Score =  315 bits (159), Expect = 2e-83
 Identities = 205/219 (93%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 93  ggtcaaaatgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 152

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||||
Sbjct: 153 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccc 212

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||| |||||||| |||||||| |||||||||||| ||||| |||||||
Sbjct: 213 tgaccagcagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctga 272

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||| ||||| |||||||||||||||||
Sbjct: 273 ttacaacatccagaaggagtcaaccctgcacctggtcct 311
</PRE>


<PRE>

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 328 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 387

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 388 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 447

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 448 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 507

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 508 atccagaaagagtcaaccctgcacctggtcctc 540
</PRE>


<PRE>

 Score =  301 bits (152), Expect = 3e-79
 Identities = 198/212 (93%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||||||||||||||||||||| ||| |||||||||||
Sbjct: 556 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctggaggtggagcccagt 615

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 616 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 675

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 676 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 735

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| ||||| |||||||||||||||||
Sbjct: 736 atccagaaggagtcaaccctgcacctggtcct 767
</PRE>


<PRE>

 Score =  295 bits (149), Expect = 2e-77
 Identities = 198/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||| | ||| |||||||||||
Sbjct: 784 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccttggaggtggagcccagt 843

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||||||||||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 844 gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccctgaccag 903

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| || ||||||||| ||||  ||||||||||||||
Sbjct: 904 cagaggctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaac 963

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||||||||
Sbjct: 964 atccagaaagagtcgaccctgcacctggtcctc 996
</PRE>


<PRE>
><a name = 12833701></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12833701&dopt=GenBank" >dbj|AK003190.1|</a> Mus musculus 18 days embryo whole body cDNA, RIKEN full-length
           enriched library, clone:1100001L13:ubiquitin B, full
           insert sequence
          Length = 932

 Score =  315 bits (159), Expect = 2e-83
 Identities = 205/219 (93%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 93  ggtcaaaatgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 152

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||||
Sbjct: 153 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccc 212

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||| |||||||| |||||||| |||||||||||| ||||| |||||||
Sbjct: 213 tgaccagcagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctga 272

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||| ||||| |||||||||||||||||
Sbjct: 273 ttacaacatccagaaggagtcaaccctgcacctggtcct 311
</PRE>


<PRE>

 Score =  295 bits (149), Expect = 2e-77
 Identities = 198/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||| | ||| |||||||||||
Sbjct: 556 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccttggaggtggagcccagt 615

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||||||||||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 616 gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccctgaccag 675

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| || ||||||||| ||||  ||||||||||||||
Sbjct: 676 cagaggctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaac 735

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||||||||
Sbjct: 736 atccagaaagagtcgaccctgcacctggtcctc 768
</PRE>


<PRE>

 Score =  293 bits (148), Expect = 7e-77
 Identities = 197/212 (92%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 328 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 387

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 388 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 447

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 448 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 507

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| ||||| |||||||||||||||||
Sbjct: 508 atccagaaggagtcaaccctgcacctggtcct 539
</PRE>


<PRE>
><a name = 12845837></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12845837&dopt=GenBank" >dbj|AK010413.1|</a> Mus musculus ES cells cDNA, RIKEN full-length enriched library,
           clone:2410005G06:ubiquitin B, full insert sequence
          Length = 1165

 Score =  315 bits (159), Expect = 2e-83
 Identities = 205/219 (93%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 94  ggtcaaaatgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 153

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||||
Sbjct: 154 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccc 213

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||| |||||||| |||||||| |||||||||||| ||||| |||||||
Sbjct: 214 tgaccagcagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctga 273

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||| ||||| |||||||||||||||||
Sbjct: 274 ttacaacatccagaaggagtcaaccctgcacctggtcct 312
</PRE>


<PRE>

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 329 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 388

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 389 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 448

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 449 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 508

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 509 atccagaaagagtcaaccctgcacctggtcctc 541
</PRE>


<PRE>

 Score =  301 bits (152), Expect = 3e-79
 Identities = 198/212 (93%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||||||||||||||||||||| ||| |||||||||||
Sbjct: 557 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctggaggtggagcccagt 616

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 617 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 676

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 677 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 736

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| ||||| |||||||||||||||||
Sbjct: 737 atccagaaggagtcaaccctgcacctggtcct 768
</PRE>


<PRE>

 Score =  295 bits (149), Expect = 2e-77
 Identities = 198/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||| | ||| |||||||||||
Sbjct: 785 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccttggaggtggagcccagt 844

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||||||||||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 845 gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccctgaccag 904

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| || ||||||||| ||||  ||||||||||||||
Sbjct: 905 cagaggctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaac 964

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||||||||
Sbjct: 965 atccagaaagagtcgaccctgcacctggtcctc 997
</PRE>


<PRE>
><a name = 12840716></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12840716&dopt=GenBank" >dbj|AK007273.1|</a> Mus musculus adult male testis cDNA, RIKEN full-length enriched
           library, clone:1700124N12:ubiquitin B, full insert
           sequence
          Length = 1195

 Score =  315 bits (159), Expect = 2e-83
 Identities = 205/219 (93%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 124 ggtcaaaatgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 183

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||||
Sbjct: 184 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccc 243

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||| |||||||| |||||||| |||||||||||| ||||| |||||||
Sbjct: 244 tgaccagcagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctga 303

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||| ||||| |||||||||||||||||
Sbjct: 304 ttacaacatccagaaggagtcaaccctgcacctggtcct 342
</PRE>


<PRE>

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 359 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 418

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 419 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 478

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 479 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 538

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 539 atccagaaagagtcaaccctgcacctggtcctc 571
</PRE>


<PRE>

 Score =  301 bits (152), Expect = 3e-79
 Identities = 198/212 (93%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||||||||||||||||||||| ||| |||||||||||
Sbjct: 587 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctggaggtggagcccagt 646

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 647 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 706

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 707 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 766

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| ||||| |||||||||||||||||
Sbjct: 767 atccagaaggagtcaaccctgcacctggtcct 798
</PRE>


<PRE>

 Score =  295 bits (149), Expect = 2e-77
 Identities = 198/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||||| |||||||||||| ||||||||||||||| | ||| |||||||||||
Sbjct: 815  atgcagatcttcgtgaagaccctgaccggcaagaccatcaccttggaggtggagcccagt 874

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || |||||||||||||||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 875  gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccctgaccag 934

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||| |||||||| |||||||| || ||||||||| ||||  ||||||||||||||
Sbjct: 935  cagaggctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaac 994

                                             
Query: 243  atccagaaagagtcgaccctgcacctggtcctc 275
            |||||||||||||||||||||||||||||||||
Sbjct: 995  atccagaaagagtcgaccctgcacctggtcctc 1027
</PRE>


<PRE>
><a name = 20873674></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20873674&dopt=GenBank" >ref|XM_122700.1|</a> Mus musculus similar to polyubiquitin 10 - rat (LOC218963), mRNA
          Length = 840

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||||||| |||||||||||
Sbjct: 1   atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtggagcccagt 60

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 61  gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 120

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 121 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 180

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||| ||||| ||||||||||||||||||
Sbjct: 181 atccagaaggagtcaaccctgcacctggtcctc 213
</PRE>


<PRE>

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 229 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 288

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 289 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 348

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 349 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 408

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 409 atccagaaagagtcaaccctgcacctggtcctc 441
</PRE>


<PRE>

 Score =  299 bits (151), Expect = 1e-78
 Identities = 199/214 (92%), Gaps = 2/214 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||||||||||||||||||||| ||| |||||||||||
Sbjct: 457 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctggaggtggagcccagt 516

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc--gacca 181
           || ||||||||||| ||||||||||||||||||||||||||||||||||||||  |||||
Sbjct: 517 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatccccccctgacca 576

                                                                       
Query: 182 gcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaa 241
           ||||||||| |||||||| |||||||| || ||||||||| ||||  |||||||||||||
Sbjct: 577 gcagaggctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaa 636

                                             
Query: 242 catccagaaagagtcgaccctgcacctggtcctc 275
           ||||||||||||||||||||||||||||||||||
Sbjct: 637 catccagaaagagtcgaccctgcacctggtcctc 670
</PRE>


<PRE>
><a name = 23593636></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=23593636&dopt=GenBank" >ref|XM_135280.2|</a> Mus musculus similar to polyubiquitin [Rattus norvegicus]
           (LOC212125), mRNA
          Length = 839

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||||||| |||||||||||
Sbjct: 1   atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtggagcccagt 60

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 61  gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 120

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 121 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 180

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||| ||||| ||||||||||||||||||
Sbjct: 181 atccagaaggagtcaaccctgcacctggtcctc 213
</PRE>


<PRE>

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 229 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 288

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 289 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 348

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 349 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 408

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 409 atccagaaagagtcaaccctgcacctggtcctc 441
</PRE>


<PRE>

 Score =  299 bits (151), Expect = 1e-78
 Identities = 194/207 (93%), Gaps = 1/207 (0%)
 Strand = Plus / Plus

                                                                       
Query: 70  atcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagtgaaacc 129
           ||||||| |||||||||||||||||||||||||||||| ||| ||||||||||||| |||
Sbjct: 463 atcttcgtgaagaccctgactggcaagaccatcaccctggaggtggagcccagtgacacc 522

                                                                       
Query: 130 atcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccagcagagg 188
           |||||||| |||||||||||||||||||||||||||||||||||||| ||||||||||||
Sbjct: 523 atcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccagcagagg 582

                                                                       
Query: 189 ctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaacatccag 248
           || |||||||| |||||||| || ||||||||| ||||  ||||||||||||||||||||
Sbjct: 583 ctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaacatccag 642

                                      
Query: 249 aaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||
Sbjct: 643 aaagagtcgaccctgcacctggtcctc 669
</PRE>


<PRE>
><a name = 49476></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00049476&dopt=GenBank" >emb|X60390.1|CGPOLYUGE</a> C.griseus gene for polyubiquitin
          Length = 1603

 Score =  303 bits (153), Expect = 7e-80
 Identities = 199/213 (93%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||||| |||||||||||||||||||||||||||||||||| |||||||||||
Sbjct: 1089 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctagaggtggagcccagt 1148

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
            || |||||||||||||||||||||||||||||||||||||||||||| ||||||||||||
Sbjct: 1149 gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccccgaccag 1208

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            ||| | ||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 1209 cagcgactcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 1268

                                             
Query: 243  atccagaaagagtcgaccctgcacctggtcctc 275
            |||||||||||||| ||||||||||||||||||
Sbjct: 1269 atccagaaagagtccaccctgcacctggtcctc 1301
</PRE>


<PRE>

 Score =  301 bits (152), Expect = 3e-79
 Identities = 204/220 (92%), Gaps = 1/220 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||||||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 170 ggtcaaaatgcaaatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 229

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
           ||||||||| |||||||| ||||| ||||||||||||||||||||||||||||| |||||
Sbjct: 230 gcccagtgacaccatcgaaaatgtcaaggccaagatccaggataaagagggcatcccccc 289

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           |||||||||| | ||||||||||| |||||||| |||||||||||| ||||  | |||||
Sbjct: 290 cgaccagcagcgactcatctttgccggcaagcagctggaagatggccgcactctttctga 349

                                                   
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcctc 275
           ||||||||||||||||||||| ||||||||||||||||||
Sbjct: 350 ttacaacatccagaaagagtccaccctgcacctggtcctc 389
</PRE>


<PRE>

 Score =  280 bits (141), Expect = 1e-72
 Identities = 196/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||||||| |||||||||||
Sbjct: 633 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtggagcccagt 692

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
           || |||||||||||||| |||||||||||||||||||| |||||||| ||||||||||||
Sbjct: 693 gacaccatcgagaatgtcaaggccaagatccaggataaggagggcatcccccccgaccag 752

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||| | ||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 753 cagcgactcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 812

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 813 atccagaaagagtccaccctgcacctggtcctc 845
</PRE>


<PRE>

 Score =  264 bits (133), Expect = 6e-68
 Identities = 194/213 (91%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| || |||| |||||||||||| ||||||||||||||||||||| |||| ||||||
Sbjct: 861  atgcagattttcgtgaagaccctgaccggcaagaccatcaccctagaggtggaacccagt 920

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
            || |||||||||||||| |||||||||||||||||||| |||||||| ||||||||||||
Sbjct: 921  gacaccatcgagaatgtcaaggccaagatccaggataaggagggcatcccccccgaccag 980

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            ||| | ||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 981  cagcgactcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 1040

                                             
Query: 243  atccagaaagagtcgaccctgcacctggtcctc 275
            |||||||||||||| ||||||||||||||||||
Sbjct: 1041 atccagaaagagtccaccctgcacctggtcctc 1073
</PRE>


<PRE>

 Score =  264 bits (133), Expect = 6e-68
 Identities = 194/213 (91%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| || |||| |||||||||||| ||||||||||||||||||||| |||| ||||||
Sbjct: 405 atgcagattttcgtgaagaccctgaccggcaagaccatcaccctagaggtggaacccagt 464

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
           || |||||||||||||| |||||||||||||||||||| |||||||| ||||||||||||
Sbjct: 465 gacaccatcgagaatgtcaaggccaagatccaggataaggagggcatcccccccgaccag 524

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||| | ||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 525 cagcgactcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 584

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 585 atccagaaagagtccaccctgcacctggtcctc 617
</PRE>


<PRE>
><a name = 20864222></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20864222&dopt=GenBank" >ref|XM_143052.1|</a> Mus musculus similar to fusion protein: ubiquitin (bases 43_513);
           ribosomal protein S27a (bases 217_532) [Rattus
           norvegicus] (LOC241863), mRNA
          Length = 858

 Score =  301 bits (152), Expect = 3e-79
 Identities = 195/208 (93%), Gaps = 1/208 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||||||| |||||||||||
Sbjct: 1   atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtggagcccagt 60

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||| ||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 61  gacaccattgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 120

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 121 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 180

                                       
Query: 243 atccagaaagagtcgaccctgcacctgg 270
           ||||||||||||||||||||||||||||
Sbjct: 181 atccagaaagagtcgaccctgcacctgg 208
</PRE>


<PRE>
><a name = 49585></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00049585&dopt=GenBank" >emb|X08013.1|CSUBIQ</a> Chinese hamster mRNA for ubiquitin
          Length = 752

 Score =  301 bits (152), Expect = 3e-79
 Identities = 204/220 (92%), Gaps = 1/220 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||||||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 78  ggtcaaaatgcaaatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 137

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
           ||||||||| |||||||| ||||| ||||||||||||||||||||||||||||| |||||
Sbjct: 138 gcccagtgacaccatcgaaaatgtcaaggccaagatccaggataaagagggcatcccccc 197

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           |||||||||| | ||||||||||| |||||||| |||||||||||| ||||  | |||||
Sbjct: 198 cgaccagcagcgactcatctttgccggcaagcagctggaagatggccgcactctttctga 257

                                                   
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcctc 275
           ||||||||||||||||||||| ||||||||||||||||||
Sbjct: 258 ttacaacatccagaaagagtccaccctgcacctggtcctc 297
</PRE>


<PRE>

 Score =  301 bits (152), Expect = 3e-79
 Identities = 198/212 (93%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||||||||||||||||||||||||| |||||||||||
Sbjct: 541 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctagaggtggagcccagt 600

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
           || |||||||||||||||||||||||||||||||||||||||||||| ||||||||||||
Sbjct: 601 gacaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccccgaccag 660

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||| | ||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 661 cagcgactcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 720

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||||||||| |||||||||||||||||
Sbjct: 721 atccagaaagagtccaccctgcacctggtcct 752
</PRE>


<PRE>

 Score =  264 bits (133), Expect = 6e-68
 Identities = 194/213 (91%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| || |||| |||||||||||| ||||||||||||||||||||| |||| ||||||
Sbjct: 313 atgcagattttcgtgaagaccctgaccggcaagaccatcaccctagaggtggaacccagt 372

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
           || |||||||||||||| |||||||||||||||||||| |||||||| ||||||||||||
Sbjct: 373 gacaccatcgagaatgtcaaggccaagatccaggataaggagggcatcccccccgaccag 432

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||| | ||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 433 cagcgactcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 492

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 493 atccagaaagagtccaccctgcacctggtcctc 525
</PRE>


<PRE>
><a name = 12851403></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12851403&dopt=GenBank" >dbj|AK013873.1|</a> Mus musculus 12 days embryo head cDNA, RIKEN full-length enriched
           library, clone:3000008M07:ubiquitin B, full insert
           sequence
          Length = 1162

 Score =  301 bits (152), Expect = 3e-79
 Identities = 198/212 (93%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||||||||||||||||||||| ||| |||||||||||
Sbjct: 554 atgcagatcttcgtgaagaccctgactggcaagaccatcaccctggaggtggagcccagt 613

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 614 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 673

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 674 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 733

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| ||||| |||||||||||||||||
Sbjct: 734 atccagaaggagtcaaccctgcacctggtcct 765
</PRE>


<PRE>

 Score =  291 bits (147), Expect = 3e-76
 Identities = 202/219 (92%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||| ||||||||||||||||||||| ||||
Sbjct: 91  ggtcaaaatgcagatcttcgtgaagaccctgaccggcaagaccatcaccctagaggtgga 150

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| |||||||||||||||| |||||||||||||||||||||
Sbjct: 151 gcccagtgacaccatcgagaacgtgaaggccaagatccgggataaagagggcatcccccc 210

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||| |||||||| |||||||| |||||||||||  ||||| |||||||
Sbjct: 211 tgaccagcagaggctgatctttgccggcaagcagctggaagatggaagcaccctctctga 270

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
           |||||||| |||||| ||||| |||||||||||||||||
Sbjct: 271 ttacaacaaccagaaggagtcaaccctgcacctggtcct 309
</PRE>


<PRE>

 Score =  287 bits (145), Expect = 4e-75
 Identities = 197/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||| | ||| |||||||||||
Sbjct: 782 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccttggaggtggagcccagt 841

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||||||||||||||||||||||||||| |||||||||||||| ||||||
Sbjct: 842 gacaccatcgagaatgtgaaggccaagatccaggataaggagggcatcccccctgaccag 901

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| || ||||||||| ||||  ||||||||||||||
Sbjct: 902 cagaggctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaac 961

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||||||||
Sbjct: 962 atccagaaagagtcgaccctgcacctggtcctc 994
</PRE>


<PRE>

 Score =  287 bits (145), Expect = 4e-75
 Identities = 197/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| ||||||||| || ||||||||||||||||| | | |||||||||||
Sbjct: 326 atgcagatcttcgtgaagacccttaccggcaagaccatcaccctgggggtggagcccagt 385

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| |||||||||||||||||||||||||||||||||||||| ||||||
Sbjct: 386 gacaccatcgagaacgtgaaggccaagatccaggataaagagggcatcccccctgaccag 445

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| |||||||| |||||||| |||||||||||| ||||| ||||||||||||||
Sbjct: 446 cagaggctgatctttgccggcaagcagctggaagatggccgcaccctctctgattacaac 505

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||| ||||||||||||||||||
Sbjct: 506 atccagaaagagtcaaccctgcacctggtcctc 538
</PRE>


<PRE>
><a name = 202260></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00202260&dopt=GenBank" >gb|M81745.1|MUSUBIQB</a> Mouse 1400 base pair ubiquitin mRNA, 3'' end
          Length = 329

 Score =  291 bits (147), Expect = 3e-76
 Identities = 193/207 (93%), Gaps = 1/207 (0%)
 Strand = Plus / Plus

                                                                       
Query: 70  atcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagtgaaacc 129
           ||||||| |||||||||||| ||||||||||||||| | ||| ||||||||||||| |||
Sbjct: 1   atcttcgtgaagaccctgaccggcaagaccatcaccttggaggtggagcccagtgacacc 60

                                                                       
Query: 130 atcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccagcagagg 188
           ||||||||||||||||||||||||||||||||||||||||||||||| ||||||||||||
Sbjct: 61  atcgagaatgtgaaggccaagatccaggataaagagggcatcccccctgaccagcagagg 120

                                                                       
Query: 189 ctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaacatccag 248
           || |||||||| |||||||| || ||||||||| ||||  ||||||||||||||||||||
Sbjct: 121 ctgatctttgccggcaagcagctagaagatggccgcactctctctgattacaacatccag 180

                                      
Query: 249 aaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||
Sbjct: 181 aaagagtcgaccctgcacctggtcctc 207
</PRE>


<PRE>
><a name = 21070214></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=21070214&dopt=GenBank" >gb|AF506969.1|</a> Equus caballus ubiquitin mRNA, complete cds
          Length = 1157

 Score =  287 bits (145), Expect = 4e-75
 Identities = 194/209 (92%), Gaps = 1/209 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| || |||| |||||||||||| ||||||||||||||||| ||| |||||||||| 
Sbjct: 803  atgcagattttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagc 862

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || ||||||||||||||||||||||||||||||||||| |||||||||||||| ||||||
Sbjct: 863  gacaccatcgagaatgtgaaggccaagatccaggataaggagggcatcccccccgaccag 922

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||||||||||||||||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 923  cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgattacaac 982

                                         
Query: 243  atccagaaagagtcgaccctgcacctggt 271
            |||||||||||||||||||||||||||||
Sbjct: 983  atccagaaagagtcgaccctgcacctggt 1011
</PRE>


<PRE>

 Score =  278 bits (140), Expect = 4e-72
 Identities = 198/216 (91%), Gaps = 1/216 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||| | |||||||||||| ||||||||||||||||| ||| ||||
Sbjct: 112 ggtcaaaatgcagatctttgtgaagaccctgaccggcaagaccatcaccctggaggtgga 171

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           |||||| || ||||||||||| || |||||||||||||||||||| ||||||||||||||
Sbjct: 172 gcccagcgacaccatcgagaacgtcaaggccaagatccaggataaggagggcatcccccc 231

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||||||||||||||||||||| |||||||||||| ||||  | || ||
Sbjct: 232 cgaccagcagaggctcatctttgcaggcaagcagctggaagatggccgcactctttccga 291

                                               
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggt 271
           ||||||||||||||||||||||||||||||||||||
Sbjct: 292 ttacaacatccagaaagagtcgaccctgcacctggt 327
</PRE>


<PRE>

 Score =  240 bits (121), Expect = 8e-61
 Identities = 188/209 (89%), Gaps = 1/209 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| || |||| |||||||||||| ||||||||||| ||||| ||| |||||||||| 
Sbjct: 575 atgcagattttcgtgaagaccctgaccggcaagaccattaccctggaggtggagcccagc 634

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
           || ||||||||||||||||||||||||||||||||||| |||||||| ||||||||||||
Sbjct: 635 gacaccatcgagaatgtgaaggccaagatccaggataaggagggcatcccccccgaccag 694

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||| ||||||||||||||||||| ||||| |||||  ||||| | ||||||||||||
Sbjct: 695 cagaggttcatctttgcaggcaagcagctggaggatgggcgcaccctgtctgattacaac 754

                                        
Query: 243 atccagaaagagtcgaccctgcacctggt 271
           |||||||| ||||| || |||||||||||
Sbjct: 755 atccagaaggagtccactctgcacctggt 783
</PRE>


<PRE>

 Score =  232 bits (117), Expect = 2e-58
 Identities = 187/209 (89%), Gaps = 1/209 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| || |||| |||||||||||| ||||||||||||||||| ||| |||||||||| 
Sbjct: 347 atgcagattttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagc 406

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
           || ||||||||||| || |||||||||||||||||||| |||||||| ||||||||||||
Sbjct: 407 gacaccatcgagaacgtcaaggccaagatccaggataaggagggcatcccccccgaccag 466

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| ||||| |||||  ||||| | ||||| ||||||
Sbjct: 467 cagaggctcatctttgcaggcaagcagctggaggatgggcgcaccctgtctgactacaac 526

                                        
Query: 243 atccagaaagagtcgaccctgcacctggt 271
           |||||||| ||||| || |||||||||||
Sbjct: 527 atccagaaggagtccactctgcacctggt 555
</PRE>


<PRE>
><a name = 2707836></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=02707836&dopt=GenBank" >gb|AF038129.1|AF038129</a> Ovis aries polyubiquitin mRNA, complete cds
          Length = 1102

 Score =  285 bits (144), Expect = 2e-74
 Identities = 199/216 (92%), Gaps = 1/216 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||||||||||| ||| |||||||| ||||||||||||||||| ||| ||||
Sbjct: 89  ggtcaaaatgcaaatcttcgtgaaaaccctgaccggcaagaccatcaccctggaggtgga 148

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggca-tccccc 175
           ||||||||| ||||||||||||||||||||||||||||||||||| || |||| ||||||
Sbjct: 149 gcccagtgacaccatcgagaatgtgaaggccaagatccaggataaggaaggcattccccc 208

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            ||||||||||||||||||||||| |||||||| |||||||||||| ||||  | |||||
Sbjct: 209 tgaccagcagaggctcatctttgccggcaagcagctggaagatggccgcactctttctga 268

                                               
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggt 271
           ||||||||||||||| ||||||||||||||||||||
Sbjct: 269 ttacaacatccagaaggagtcgaccctgcacctggt 304
</PRE>


<PRE>

 Score =  264 bits (133), Expect = 6e-68
 Identities = 191/209 (91%), Gaps = 1/209 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 324 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 383

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggca-tccccccgaccag 182
           || ||||||||||| ||||||||||||||||||||||| || |||| |||||| ||||||
Sbjct: 384 gacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccctgaccag 443

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 444 cagaggctcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 503

                                        
Query: 243 atccagaaagagtcgaccctgcacctggt 271
           |||||||| ||||||||||||||||||||
Sbjct: 504 atccagaaggagtcgaccctgcacctggt 532
</PRE>


<PRE>

 Score =  264 bits (133), Expect = 6e-68
 Identities = 191/209 (91%), Gaps = 1/209 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 552 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 611

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggca-tccccccgaccag 182
           || ||||||||||| ||||||||||||||||||||||| || |||| |||||| ||||||
Sbjct: 612 gacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccctgaccag 671

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 672 cagaggctcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 731

                                        
Query: 243 atccagaaagagtcgaccctgcacctggt 271
           |||||||| ||||||||||||||||||||
Sbjct: 732 atccagaaggagtcgaccctgcacctggt 760
</PRE>


<PRE>

 Score =  262 bits (132), Expect = 2e-67
 Identities = 193/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||| | |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 780 atgcagatctttgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 839

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| ||||||||||||||||||||||| || ||||| ||||| ||||||
Sbjct: 840 gacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccctgaccag 899

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 900 cagaggctcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 959

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           || |||||||||||||||||||||||||||||
Sbjct: 960 attcagaaagagtcgaccctgcacctggtcct 991
</PRE>


<PRE>
><a name = 644></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00000644&dopt=GenBank" >emb|Z18245.1|BTPOLYUB</a> Bos taurus gene for polyubiquitin
          Length = 1144

 Score =  285 bits (144), Expect = 2e-74
 Identities = 202/220 (91%), Gaps = 1/220 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| ||| |||||||| ||||||||||||||||| ||| ||||
Sbjct: 80  ggtcaaaatgcagatcttcgtgaaaaccctgaccggcaagaccatcaccctggaggtgga 139

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
           ||||||||| ||||||||||| ||||||||||||||||||||||| || ||||| |||||
Sbjct: 140 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccc 199

                                                                       
Query: 177 -gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            ||||||||||||||||||||||| |||||||| |||||||||||| ||||  | |||||
Sbjct: 200 tgaccagcagaggctcatctttgccggcaagcagctggaagatggccgcactctttctga 259

                                                   
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcctc 275
           ||||||||||||||||||||||||||||||||||||||||
Sbjct: 260 ttacaacatccagaaagagtcgaccctgcacctggtcctc 299
</PRE>


<PRE>

 Score =  280 bits (141), Expect = 1e-72
 Identities = 196/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 543 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 602

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| ||||||||||||||||||||||| || ||||| ||||| ||||||
Sbjct: 603 gacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccctgaccag 662

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 663 cagaggctcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 722

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||||||||
Sbjct: 723 atccagaaagagtcgaccctgcacctggtcctc 755
</PRE>


<PRE>

 Score =  272 bits (137), Expect = 2e-70
 Identities = 195/213 (91%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| || |||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 315 atgcagattttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 374

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
           || ||||||||||| ||||||||||||||||||||||| |||||||| ||||||||||||
Sbjct: 375 gacaccatcgagaacgtgaaggccaagatccaggataaggagggcattccccccgaccag 434

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||  | | ||||||||||
Sbjct: 435 cagaggctcatctttgccggcaagcagctggaagatggccgcactctttttgattacaac 494

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||||||||
Sbjct: 495 atccagaaagagtcgaccctgcacctggtcctc 527
</PRE>


<PRE>

 Score =  270 bits (136), Expect = 9e-70
 Identities = 194/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 771 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 830

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| ||||||||||||||||||||||| || ||||| ||||| ||||||
Sbjct: 831 gacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccctgaccag 890

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 891 cagaggctcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 950

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||||||||
Sbjct: 951 atccagaaagagtcgaccctgcacctggtcct 982
</PRE>


<PRE>
><a name = 15451312></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=15451312&dopt=GenBank" >dbj|AB071067.1|</a> Macaca fascicularis testis cDNA clone:QtsA-16192, full insert
           sequence
          Length = 883

 Score =  283 bits (143), Expect = 6e-74
 Identities = 201/219 (91%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||| ||||||||||||||||| ||| ||||
Sbjct: 30  ggtcaaaatgcagatcttcgtgaagaccctgaccggcaagaccatcacccttgaggtgga 89

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
           ||||||||| |||||||| |||||||||||||| ||||||||||| || ||||| |||||
Sbjct: 90  gcccagtgacaccatcgaaaatgtgaaggccaaaatccaggataaggaaggcattccccc 149

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           ||||||||||||||||||||||||||||||||| |||||||||||| ||||  | |||||
Sbjct: 150 cgaccagcagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctga 209

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||||||||||||||||||||| |||||
Sbjct: 210 ctacaacatccagaaagagtcgaccctgcaccttgtcct 248
</PRE>


<PRE>

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 265 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 324

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccc-cccgaccag 182
           || |||||||| ||||||||||||||||||||||||||||| |||||||| |||||||||
Sbjct: 325 gacaccatcgaaaatgtgaaggccaagatccaggataaagaaggcatccctcccgaccag 384

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 385 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 444

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| |||||||||||||||||||||||
Sbjct: 445 atccagaaggagtcgaccctgcacctggtcct 476
</PRE>


<PRE>

 Score =  262 bits (132), Expect = 2e-67
 Identities = 193/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| ||| |||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 493 atgcagatcttcgtgaaaaccctgaccggcaagaccatcaccctggaggtggagcccagt 552

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
           || |||||||| |||||||||||||||||||| |||||||| ||||| ||||||||||||
Sbjct: 553 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccgaccag 612

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 613 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 672

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| ||||| |||||||||||||||||
Sbjct: 673 atccagaaggagtcaaccctgcacctggtcct 704
</PRE>


<PRE>
><a name = 987828></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00987828&dopt=GenBank" >emb|Z54175.1|BVDTGACB1</a> Bovine viral diarrhea virus TGAC-B1 RNA
          Length = 984

 Score =  280 bits (141), Expect = 1e-72
 Identities = 196/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 574 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 633

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| ||||||||||||||||||||||| || ||||| ||||| ||||||
Sbjct: 634 gacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccctgaccag 693

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 694 cagaggctcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 753

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||||||||
Sbjct: 754 atccagaaagagtcgaccctgcacctggtcctc 786
</PRE>


<PRE>

 Score = 56.0 bits (28), Expect = 3e-05
 Identities = 31/32 (96%)
 Strand = Plus / Plus

                                           
Query: 244 tccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||| |||||||
Sbjct: 527 tccagaaagagtcgaccctgcacccggtcctc 558
</PRE>


<PRE>
><a name = 987825></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00987825&dopt=GenBank" >emb|Z54176.1|BVDCPA2</a> Bovine viral diarrhea virus cpA2 RNA
          Length = 984

 Score =  280 bits (141), Expect = 1e-72
 Identities = 196/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 574 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 633

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| ||||||||||||||||||||||| || ||||| ||||| ||||||
Sbjct: 634 gacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccctgaccag 693

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 694 cagaggctcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 753

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||||||||
Sbjct: 754 atccagaaagagtcgaccctgcacctggtcctc 786
</PRE>


<PRE>

 Score = 56.0 bits (28), Expect = 3e-05
 Identities = 31/32 (96%)
 Strand = Plus / Plus

                                           
Query: 244 tccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||| |||||||
Sbjct: 527 tccagaaagagtcgaccctgcacccggtcctc 558
</PRE>


<PRE>
><a name = 163574></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00163574&dopt=GenBank" >gb|M62429.1|BOVPOUBA</a> Bovine polyubiquitin mRNA, 3'' end, clone rpub2
          Length = 636

 Score =  280 bits (141), Expect = 1e-72
 Identities = 196/213 (92%), Gaps = 1/213 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 35  atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaggtggagcccagt 94

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| ||||||||||||||||||||||| || ||||| ||||| ||||||
Sbjct: 95  gacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccctgaccag 154

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 155 cagaggctcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 214

                                            
Query: 243 atccagaaagagtcgaccctgcacctggtcctc 275
           |||||||||||||||||||||||||||||||||
Sbjct: 215 atccagaaagagtcgaccctgcacctggtcctc 247
</PRE>


<PRE>

 Score =  270 bits (136), Expect = 9e-70
 Identities = 194/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 263 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 322

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| ||||||||||||||||||||||| || ||||| ||||| ||||||
Sbjct: 323 gacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccctgaccag 382

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 383 cagaggctcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 442

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||||||||
Sbjct: 443 atccagaaagagtcgaccctgcacctggtcct 474
</PRE>


<PRE>
><a name = 24660326></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=24660326&dopt=GenBank" >gb|BC038999.1|</a> Homo sapiens, ubiquitin B, clone IMAGE:4943285, mRNA
          Length = 957

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 336 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 395

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccc-cccgaccag 182
           || |||||||| ||||||||||||||||||||||||||||| |||||||| |||||||||
Sbjct: 396 gacaccatcgaaaatgtgaaggccaagatccaggataaagaaggcatccctcccgaccag 455

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 456 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 515

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| |||||||||||||||||||||||
Sbjct: 516 atccagaaggagtcgaccctgcacctggtcct 547
</PRE>


<PRE>

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| |||||||||||||| || ||| |||||||||||
Sbjct: 564 atgcagatcttcgtgaagaccctgaccggcaagaccatcactctggaggtggagcccagt 623

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||| |||||||||||||||||||| |||||||| ||||||||||| ||||||
Sbjct: 624 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccgaccag 683

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 684 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 743

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||||||||
Sbjct: 744 atccagaaagagtcgaccctgcacctggtcct 775
</PRE>


<PRE>

 Score =  268 bits (135), Expect = 4e-69
 Identities = 199/219 (90%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| ||| ||||| || ||||||||||||||||| ||| ||||
Sbjct: 101 ggtcaaaatgcagatcttcgtgaaaacccttaccggcaagaccatcacccttgaggtgga 160

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
           ||||||||| |||||||| |||||||||||||||||||||||||| || ||||| |||||
Sbjct: 161 gcccagtgacaccatcgaaaatgtgaaggccaagatccaggataaggaaggcattccccc 220

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           ||||||||||||||||||||||||||||||||| |||||||||||| | ||  | |||||
Sbjct: 221 cgaccagcagaggctcatctttgcaggcaagcagctggaagatggccgtactctttctga 280

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||||||||
Sbjct: 281 ctacaacatccagaaggagtcgaccctgcacctggtcct 319
</PRE>


<PRE>
><a name = 22538474></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=22538474&dopt=GenBank" >ref|NM_018955.2|</a> Homo sapiens ubiquitin B (UBB), mRNA
          Length = 971

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 367 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 426

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccc-cccgaccag 182
           || |||||||| ||||||||||||||||||||||||||||| |||||||| |||||||||
Sbjct: 427 gacaccatcgaaaatgtgaaggccaagatccaggataaagaaggcatccctcccgaccag 486

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 487 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 546

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| |||||||||||||||||||||||
Sbjct: 547 atccagaaggagtcgaccctgcacctggtcct 578
</PRE>


<PRE>

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| |||||||||||||| || ||| |||||||||||
Sbjct: 595 atgcagatcttcgtgaagaccctgaccggcaagaccatcactctggaggtggagcccagt 654

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||| |||||||||||||||||||| |||||||| ||||||||||| ||||||
Sbjct: 655 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccgaccag 714

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 715 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 774

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||||||||
Sbjct: 775 atccagaaagagtcgaccctgcacctggtcct 806
</PRE>


<PRE>

 Score =  268 bits (135), Expect = 4e-69
 Identities = 199/219 (90%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| ||| ||||| || ||||||||||||||||| ||| ||||
Sbjct: 132 ggtcaaaatgcagatcttcgtgaaaacccttaccggcaagaccatcacccttgaggtgga 191

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
           ||||||||| |||||||| |||||||||||||||||||||||||| || ||||| |||||
Sbjct: 192 gcccagtgacaccatcgaaaatgtgaaggccaagatccaggataaggaaggcattccccc 251

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           ||||||||||||||||||||||||||||||||| |||||||||||| | ||  | |||||
Sbjct: 252 cgaccagcagaggctcatctttgcaggcaagcagctggaagatggccgtactctttctga 311

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||||||||
Sbjct: 312 ctacaacatccagaaggagtcgaccctgcacctggtcct 350
</PRE>


<PRE>
><a name = 21410248></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=21410248&dopt=GenBank" >gb|BC031027.1|</a> Homo sapiens, clone MGC:32826 IMAGE:4715377, mRNA, complete cds
          Length = 919

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 327 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 386

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccc-cccgaccag 182
           || |||||||| ||||||||||||||||||||||||||||| |||||||| |||||||||
Sbjct: 387 gacaccatcgaaaatgtgaaggccaagatccaggataaagaaggcatccctcccgaccag 446

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 447 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 506

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| |||||||||||||||||||||||
Sbjct: 507 atccagaaggagtcgaccctgcacctggtcct 538
</PRE>


<PRE>

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| |||||||||||||| || ||| |||||||||||
Sbjct: 555 atgcagatcttcgtgaagaccctgaccggcaagaccatcactctggaggtggagcccagt 614

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||| |||||||||||||||||||| |||||||| ||||||||||| ||||||
Sbjct: 615 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccgaccag 674

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 675 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 734

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||||||||
Sbjct: 735 atccagaaagagtcgaccctgcacctggtcct 766
</PRE>


<PRE>

 Score =  268 bits (135), Expect = 4e-69
 Identities = 199/219 (90%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| ||| ||||| || ||||||||||||||||| ||| ||||
Sbjct: 92  ggtcaaaatgcagatcttcgtgaaaacccttaccggcaagaccatcacccttgaggtgga 151

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
           ||||||||| |||||||| |||||||||||||||||||||||||| || ||||| |||||
Sbjct: 152 gcccagtgacaccatcgaaaatgtgaaggccaagatccaggataaggaaggcattccccc 211

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           ||||||||||||||||||||||||||||||||| |||||||||||| | ||  | |||||
Sbjct: 212 cgaccagcagaggctcatctttgcaggcaagcagctggaagatggccgtactctttctga 271

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||||||||
Sbjct: 272 ctacaacatccagaaggagtcgaccctgcacctggtcct 310
</PRE>


<PRE>
><a name = 20070822></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20070822&dopt=GenBank" >gb|BC026301.1|</a> Homo sapiens, clone MGC:24729 IMAGE:4280629, mRNA, complete cds
          Length = 957

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 325 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 384

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccc-cccgaccag 182
           || |||||||| ||||||||||||||||||||||||||||| |||||||| |||||||||
Sbjct: 385 gacaccatcgaaaatgtgaaggccaagatccaggataaagaaggcatccctcccgaccag 444

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 445 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 504

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| |||||||||||||||||||||||
Sbjct: 505 atccagaaggagtcgaccctgcacctggtcct 536
</PRE>


<PRE>

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| |||||||||||||| || ||| |||||||||||
Sbjct: 553 atgcagatcttcgtgaagaccctgaccggcaagaccatcactctggaggtggagcccagt 612

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||| |||||||||||||||||||| |||||||| ||||||||||| ||||||
Sbjct: 613 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccgaccag 672

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 673 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 732

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||||||||
Sbjct: 733 atccagaaagagtcgaccctgcacctggtcct 764
</PRE>


<PRE>

 Score =  268 bits (135), Expect = 4e-69
 Identities = 199/219 (90%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| ||| ||||| || ||||||||||||||||| ||| ||||
Sbjct: 90  ggtcaaaatgcagatcttcgtgaaaacccttaccggcaagaccatcacccttgaggtgga 149

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
           ||||||||| |||||||| |||||||||||||||||||||||||| || ||||| |||||
Sbjct: 150 gcccagtgacaccatcgaaaatgtgaaggccaagatccaggataaggaaggcattccccc 209

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           ||||||||||||||||||||||||||||||||| |||||||||||| | ||  | |||||
Sbjct: 210 cgaccagcagaggctcatctttgcaggcaagcagctggaagatggccgtactctttctga 269

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||||||||
Sbjct: 270 ctacaacatccagaaggagtcgaccctgcacctggtcct 308
</PRE>


<PRE>
><a name = 18308345></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=18308345&dopt=GenBank" >gb|AC093484.2|</a> Homo sapiens chromosome , clone RP11-138I1, complete sequence
          Length = 170944

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                          
Query: 64     atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
              ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 102925 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 102984

                                                                          
Query: 124    gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccc-cccgaccag 182
              || |||||||| ||||||||||||||||||||||||||||| |||||||| |||||||||
Sbjct: 102985 gacaccatcgaaaatgtgaaggccaagatccaggataaagaaggcatccctcccgaccag 103044

                                                                          
Query: 183    cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
              |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 103045 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 103104

                                              
Query: 243    atccagaaagagtcgaccctgcacctggtcct 274
              |||||||| |||||||||||||||||||||||
Sbjct: 103105 atccagaaggagtcgaccctgcacctggtcct 103136
</PRE>


<PRE>

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                          
Query: 64     atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
              ||||| ||||||| |||||||||||| |||||||||||||| || ||| |||||||||||
Sbjct: 103153 atgcagatcttcgtgaagaccctgaccggcaagaccatcactctggaggtggagcccagt 103212

                                                                          
Query: 124    gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
              || |||||||| |||||||||||||||||||| |||||||| ||||||||||| ||||||
Sbjct: 103213 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccgaccag 103272

                                                                          
Query: 183    cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
              |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 103273 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 103332

                                              
Query: 243    atccagaaagagtcgaccctgcacctggtcct 274
              ||||||||||||||||||||||||||||||||
Sbjct: 103333 atccagaaagagtcgaccctgcacctggtcct 103364
</PRE>


<PRE>

 Score =  268 bits (135), Expect = 4e-69
 Identities = 199/219 (90%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                          
Query: 57     ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
              |||||||||||| ||||||| ||| ||||| || ||||||||||||||||| ||| ||||
Sbjct: 102690 ggtcaaaatgcagatcttcgtgaaaacccttaccggcaagaccatcacccttgaggtgga 102749

                                                                          
Query: 117    gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
              ||||||||| |||||||| |||||||||||||||||||||||||| || ||||| |||||
Sbjct: 102750 gcccagtgacaccatcgaaaatgtgaaggccaagatccaggataaggaaggcattccccc 102809

                                                                          
Query: 176    cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
              ||||||||||||||||||||||||||||||||| |||||||||||| | ||  | |||||
Sbjct: 102810 cgaccagcagaggctcatctttgcaggcaagcagctggaagatggccgtactctttctga 102869

                                                     
Query: 236    ttacaacatccagaaagagtcgaccctgcacctggtcct 274
               |||||||||||||| |||||||||||||||||||||||
Sbjct: 102870 ctacaacatccagaaggagtcgaccctgcacctggtcct 102908
</PRE>


<PRE>
><a name = 15929388></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=15929388&dopt=GenBank" >gb|BC015127.1|BC015127</a> Homo sapiens, clone MGC:24232 IMAGE:3929901, mRNA, complete cds
          Length = 965

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 329 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 388

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccc-cccgaccag 182
           || |||||||| ||||||||||||||||||||||||||||| |||||||| |||||||||
Sbjct: 389 gacaccatcgaaaatgtgaaggccaagatccaggataaagaaggcatccctcccgaccag 448

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 449 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 508

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| |||||||||||||||||||||||
Sbjct: 509 atccagaaggagtcgaccctgcacctggtcct 540
</PRE>


<PRE>

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| |||||||||||||| || ||| |||||||||||
Sbjct: 557 atgcagatcttcgtgaagaccctgaccggcaagaccatcactctggaggtggagcccagt 616

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||| |||||||||||||||||||| |||||||| ||||||||||| ||||||
Sbjct: 617 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccgaccag 676

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 677 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 736

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||||||||
Sbjct: 737 atccagaaagagtcgaccctgcacctggtcct 768
</PRE>


<PRE>

 Score =  268 bits (135), Expect = 4e-69
 Identities = 199/219 (90%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| ||| ||||| || ||||||||||||||||| ||| ||||
Sbjct: 94  ggtcaaaatgcagatcttcgtgaaaacccttaccggcaagaccatcacccttgaggtgga 153

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
           ||||||||| |||||||| |||||||||||||||||||||||||| || ||||| |||||
Sbjct: 154 gcccagtgacaccatcgaaaatgtgaaggccaagatccaggataaggaaggcattccccc 213

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           ||||||||||||||||||||||||||||||||| |||||||||||| | ||  | |||||
Sbjct: 214 cgaccagcagaggctcatctttgcaggcaagcagctggaagatggccgtactctttctga 273

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||||||||
Sbjct: 274 ctacaacatccagaaggagtcgaccctgcacctggtcct 312
</PRE>


<PRE>
><a name = 14424551></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=14424551&dopt=GenBank" >gb|BC009301.1|BC009301</a> Homo sapiens, clone MGC:16688 IMAGE:4126622, mRNA, complete cds
          Length = 952

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 322 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 381

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccc-cccgaccag 182
           || |||||||| ||||||||||||||||||||||||||||| |||||||| |||||||||
Sbjct: 382 gacaccatcgaaaatgtgaaggccaagatccaggataaagaaggcatccctcccgaccag 441

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 442 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 501

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| |||||||||||||||||||||||
Sbjct: 502 atccagaaggagtcgaccctgcacctggtcct 533
</PRE>


<PRE>

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| |||||||||||||| || ||| |||||||||||
Sbjct: 550 atgcagatcttcgtgaagaccctgaccggcaagaccatcactctggaggtggagcccagt 609

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||| |||||||||||||||||||| |||||||| ||||||||||| ||||||
Sbjct: 610 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccgaccag 669

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 670 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 729

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||||||||
Sbjct: 730 atccagaaagagtcgaccctgcacctggtcct 761
</PRE>


<PRE>

 Score =  268 bits (135), Expect = 4e-69
 Identities = 199/219 (90%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| ||| ||||| || ||||||||||||||||| ||| ||||
Sbjct: 87  ggtcaaaatgcagatcttcgtgaaaacccttaccggcaagaccatcacccttgaggtgga 146

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
           ||||||||| |||||||| |||||||||||||||||||||||||| || ||||| |||||
Sbjct: 147 gcccagtgacaccatcgaaaatgtgaaggccaagatccaggataaggaaggcattccccc 206

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           ||||||||||||||||||||||||||||||||| |||||||||||| | ||  | |||||
Sbjct: 207 cgaccagcagaggctcatctttgcaggcaagcagctggaagatggccgtactctttctga 266

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||||||||
Sbjct: 267 ctacaacatccagaaggagtcgaccctgcacctggtcct 305
</PRE>


<PRE>
><a name = 12653220></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12653220&dopt=GenBank" >gb|BC000379.1|BC000379</a> Homo sapiens, ubiquitin B, clone MGC:8385 IMAGE:2820408, mRNA,
           complete cds
          Length = 998

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 376 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 435

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccc-cccgaccag 182
           || |||||||| ||||||||||||||||||||||||||||| |||||||| |||||||||
Sbjct: 436 gacaccatcgaaaatgtgaaggccaagatccaggataaagaaggcatccctcccgaccag 495

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 496 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 555

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           |||||||| |||||||||||||||||||||||
Sbjct: 556 atccagaaggagtcgaccctgcacctggtcct 587
</PRE>


<PRE>

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| |||||||||||||| || ||| |||||||||||
Sbjct: 604 atgcagatcttcgtgaagaccctgaccggcaagaccatcactctggaggtggagcccagt 663

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || |||||||| |||||||||||||||||||| |||||||| ||||||||||| ||||||
Sbjct: 664 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccgaccag 723

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 724 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 783

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||||||||
Sbjct: 784 atccagaaagagtcgaccctgcacctggtcct 815
</PRE>


<PRE>

 Score =  260 bits (131), Expect = 9e-67
 Identities = 198/219 (90%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| ||| ||||| || ||||||||||||||||| ||| ||||
Sbjct: 141 ggtcaaaatgcagatcttcgtgaaaacccttaccggcaagaccatcacccttgaggtgga 200

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggca-tccccc 175
           ||||||||| |||||||| |||||||||||||||||||||||||| || |||| ||||||
Sbjct: 201 gcccagtgacaccatcgaaaatgtgaaggccaagatccaggataaggaaggcattccccc 260

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           ||||||||||||||||||||||||||||||||| |||||||| ||| | ||  | |||||
Sbjct: 261 cgaccagcagaggctcatctttgcaggcaagcagctggaagacggccgtactctttctga 320

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||||||||
Sbjct: 321 ctacaacatccagaaggagtcgaccctgcacctggtcct 359
</PRE>


<PRE>
><a name = 6647297></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=06647297&dopt=GenBank" >emb|X04803.2|HSYUBG1</a> Homo sapiens ubiquitin gene
          Length = 3107

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 2311 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 2370

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccc-cccgaccag 182
            || |||||||| ||||||||||||||||||||||||||||| |||||||| |||||||||
Sbjct: 2371 gacaccatcgaaaatgtgaaggccaagatccaggataaagaaggcatccctcccgaccag 2430

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 2431 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 2490

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            |||||||| |||||||||||||||||||||||
Sbjct: 2491 atccagaaggagtcgaccctgcacctggtcct 2522
</PRE>


<PRE>

 Score =  268 bits (135), Expect = 4e-69
 Identities = 199/219 (90%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                        
Query: 57   ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
            |||||||||||| ||||||| ||| ||||| || ||||||||||||||||| ||| ||||
Sbjct: 2076 ggtcaaaatgcagatcttcgtgaaaacccttaccggcaagaccatcacccttgaggtgga 2135

                                                                        
Query: 117  gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
            ||||||||| |||||||| |||||||||||||||||||||||||| || ||||| |||||
Sbjct: 2136 gcccagtgacaccatcgaaaatgtgaaggccaagatccaggataaggaaggcattccccc 2195

                                                                        
Query: 176  cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            ||||||||||||||||||||||||||||||||| |||||||||||| | ||  | |||||
Sbjct: 2196 cgaccagcagaggctcatctttgcaggcaagcagctggaagatggccgtactctttctga 2255

                                                   
Query: 236  ttacaacatccagaaagagtcgaccctgcacctggtcct 274
             |||||||||||||| |||||||||||||||||||||||
Sbjct: 2256 ctacaacatccagaaggagtcgaccctgcacctggtcct 2294
</PRE>


<PRE>

 Score =  262 bits (132), Expect = 2e-67
 Identities = 193/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||||| |||||||||||| |||||||||||||| || ||  |||||||||||
Sbjct: 2539 atgcagatcttcgtgaagaccctgaccggcaagaccatcactctggaagtggagcccagt 2598

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccc-cccgaccag 182
            || |||||||| |||||||||||||||||||| |||||||| |||||||| |||||||||
Sbjct: 2599 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatccctcccgaccag 2658

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 2659 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 2718

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            |||||||| |||||||||||||||||||||||
Sbjct: 2719 atccagaaggagtcgaccctgcacctggtcct 2750
</PRE>


<PRE>
><a name = 14488116></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=14488116&dopt=GenBank" >emb|AL356460.3|HS84M10</a> Homo sapiens chromosome 17 from PAC 84M10 map17p11.2  region
            D17S842-D17S953, complete sequence
          Length = 161943

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Minus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 7361 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 7302

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccc-cccgaccag 182
            || |||||||| ||||||||||||||||||||||||||||| |||||||| |||||||||
Sbjct: 7301 gacaccatcgaaaatgtgaaggccaagatccaggataaagaaggcatccctcccgaccag 7242

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 7241 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 7182

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            |||||||| |||||||||||||||||||||||
Sbjct: 7181 atccagaaggagtcgaccctgcacctggtcct 7150
</PRE>


<PRE>

 Score =  278 bits (140), Expect = 4e-72
 Identities = 195/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Minus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||||| |||||||||||| |||||||||||||| || ||| |||||||||||
Sbjct: 7133 atgcagatcttcgtgaagaccctgaccggcaagaccatcactctggaggtggagcccagt 7074

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || |||||||| |||||||||||||||||||| |||||||| ||||||||||| ||||||
Sbjct: 7073 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccgaccag 7014

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||||||||||||||||||||| |||||||||||| ||||  | ||||| ||||||
Sbjct: 7013 cagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctgactacaac 6954

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            ||||||||||||||||||||||||||||||||
Sbjct: 6953 atccagaaagagtcgaccctgcacctggtcct 6922
</PRE>


<PRE>

 Score =  268 bits (135), Expect = 4e-69
 Identities = 199/219 (90%), Gaps = 1/219 (0%)
 Strand = Plus / Minus

                                                                        
Query: 57   ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
            |||||||||||| ||||||| ||| ||||| || ||||||||||||||||| ||| ||||
Sbjct: 7596 ggtcaaaatgcagatcttcgtgaaaacccttaccggcaagaccatcacccttgaggtgga 7537

                                                                        
Query: 117  gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
            ||||||||| |||||||| |||||||||||||||||||||||||| || ||||| |||||
Sbjct: 7536 gcccagtgacaccatcgaaaatgtgaaggccaagatccaggataaggaaggcattccccc 7477

                                                                        
Query: 176  cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            ||||||||||||||||||||||||||||||||| |||||||||||| | ||  | |||||
Sbjct: 7476 cgaccagcagaggctcatctttgcaggcaagcagctggaagatggccgtactctttctga 7417

                                                   
Query: 236  ttacaacatccagaaagagtcgaccctgcacctggtcct 274
             |||||||||||||| |||||||||||||||||||||||
Sbjct: 7416 ctacaacatccagaaggagtcgaccctgcacctggtcct 7378
</PRE>


<PRE>
><a name = 20163047></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20163047&dopt=GenBank" >gb|AC068902.20|</a> Mus musculus clone rp23-151l10, complete sequence
          Length = 199514

 Score =  276 bits (139), Expect = 2e-71
 Identities = 199/219 (90%)
 Strand = Plus / Minus

                                                                          
Query: 57     ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
              |||||||||||| ||||||  || ||||||||||||||||||| ||||| ||||| ||||
Sbjct: 191585 ggtcaaaatgcagatcttcacgacgaccctgactggcaagaccctcaccttagaggtgga 191526

                                                                          
Query: 117    gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
              ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||| 
Sbjct: 191525 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatccccct 191466

                                                                          
Query: 177    gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgat 236
              |||||||||||||| |||||||| |||||||| || ||||||||| ||||  ||||||||
Sbjct: 191465 gaccagcagaggctgatctttgctggcaagcagctagaagatggccgcactctctctgat 191406

                                                     
Query: 237    tacaacatccagaaagagtcgaccctgcacctggtcctc 275
              |||||||||||||||||||   |||||||||||||||||
Sbjct: 191405 tacaacatccagaaagagtgagccctgcacctggtcctc 191367
</PRE>


<PRE>
><a name = 15680082></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=15680082&dopt=GenBank" >gb|BC014367.1|BC014367</a> Homo sapiens, Similar to orosomucoid 1, clone MGC:24263
           IMAGE:3934516, mRNA, complete cds
          Length = 790

 Score =  276 bits (139), Expect = 2e-71
 Identities = 200/219 (91%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| ||| ||||| || ||||||||||||||||| ||| ||||
Sbjct: 100 ggtcaaaatgcagatcttcgtgaaaacccttaccggcaagaccatcacccttgaggtgga 159

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccc 175
           ||||||||| |||||||| |||||||||||||||||||||||||| || ||||| |||||
Sbjct: 160 gcccagtgacaccatcgaaaatgtgaaggccaagatccaggataaggaaggcattccccc 219

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           ||||||||||||||||||||||||||||||||| |||||||||||| ||||  | |||||
Sbjct: 220 cgaccagcagaggctcatctttgcaggcaagcagctggaagatggccgcactctttctga 279

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||||||||
Sbjct: 280 ctacaacatccagaaggagtcgaccctgcacctggtcct 318
</PRE>


<PRE>
><a name = 20068526></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=20068526&dopt=GenBank" >emb|AL603923.7|</a> Mouse DNA sequence from clone RP23-180L15 on chromosome 11, complete
             sequence
          Length = 141596

 Score =  276 bits (139), Expect = 2e-71
 Identities = 199/219 (90%)
 Strand = Plus / Plus

                                                                         
Query: 57    ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
             |||||||||||| ||||||  || ||||||||||||||||||| ||||| ||||| ||||
Sbjct: 74964 ggtcaaaatgcagatcttcacgacgaccctgactggcaagaccctcaccttagaggtgga 75023

                                                                         
Query: 117   gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc 176
             ||||||||| ||||||||||| ||||||||||||||||||||||||||||||||||||| 
Sbjct: 75024 gcccagtgacaccatcgagaacgtgaaggccaagatccaggataaagagggcatccccct 75083

                                                                         
Query: 177   gaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgat 236
             |||||||||||||| |||||||| |||||||| || ||||||||| ||||  ||||||||
Sbjct: 75084 gaccagcagaggctgatctttgctggcaagcagctagaagatggccgcactctctctgat 75143

                                                    
Query: 237   tacaacatccagaaagagtcgaccctgcacctggtcctc 275
             |||||||||||||||||||   |||||||||||||||||
Sbjct: 75144 tacaacatccagaaagagtgagccctgcacctggtcctc 75182
</PRE>


<PRE>
><a name = 323207></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00323207&dopt=GenBank" >gb|M62431.1|BVDCP1</a> Bovine viral diarrhea virus CP1 putative helcase/protease mRNA,
            partial cds
          Length = 5688

 Score =  270 bits (136), Expect = 9e-70
 Identities = 194/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 2968 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 3027

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || ||||||||||| ||||||||||||||||||||||| || ||||| ||||| ||||||
Sbjct: 3028 gacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccctgaccag 3087

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            ||||||||||||||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 3088 cagaggctcatctttgccggcaagcagctggaagatggccgcactctttctgattacaac 3147

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            ||||||||||||||||||||||||||||||||
Sbjct: 3148 atccagaaagagtcgaccctgcacctggtcct 3179
</PRE>


<PRE>

 Score =  159 bits (80), Expect = 2e-36
 Identities = 114/124 (91%), Gaps = 1/124 (0%)
 Strand = Plus / Plus

                                                                        
Query: 153  ccaggataaagagggcatcccccc-gaccagcagaggctcatctttgcaggcaagcaact 211
            ||||||||| || ||||| ||||| ||||||||||||||||||||||| |||||||| ||
Sbjct: 2829 ccaggataaggaaggcattccccctgaccagcagaggctcatctttgccggcaagcagct 2888

                                                                        
Query: 212  ggaagatggctgcaccttctctgattacaacatccagaaagagtcgaccctgcacctggt 271
            |||||||||| ||||  | |||||||||||||||||||||||||||||||||||||||||
Sbjct: 2889 ggaagatggccgcactctttctgattacaacatccagaaagagtcgaccctgcacctggt 2948

                
Query: 272  cctc 275
            ||||
Sbjct: 2949 cctc 2952
</PRE>


<PRE>
><a name = 24942955></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=24942955&dopt=GenBank" >gb|AC087575.11|</a> Homo sapiens chromosome 17, clone RP11-305L6, complete sequence
          Length = 198756

 Score =  268 bits (135), Expect = 4e-69
 Identities = 192/211 (90%)
 Strand = Plus / Minus

                                                                          
Query: 64     atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
              ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 167602 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 167543

                                                                          
Query: 124    gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccccccgaccagc 183
              || |||||||| |||||||||||||||||||| |||||||| ||||||||||||| ||||
Sbjct: 167542 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatccccccgatcagc 167483

                                                                          
Query: 184    agaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaaca 243
              ||||||||||||||||||||||||| |||||||||||| | ||  | ||||| |||||||
Sbjct: 167482 agaggctcatctttgcaggcaagcagctggaagatggcggtactctttctgactacaaca 167423

                                             
Query: 244    tccagaaagagtcgaccctgcacctggtcct 274
              ||||||| |||||||||||||||||||||||
Sbjct: 167422 tccagaaggagtcgaccctgcacctggtcct 167392
</PRE>


<PRE>

 Score =  262 bits (132), Expect = 2e-67
 Identities = 193/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Minus

                                                                          
Query: 64     atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
              ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 167830 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 167771

                                                                          
Query: 124    gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
              || |||||||| |||||||||||||||||||| |||||||| ||||| ||||||||||||
Sbjct: 167770 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccgaccag 167711

                                                                          
Query: 183    cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
              |||||||||||||||||||||||||| |||||||||||| |||   | ||||| ||||||
Sbjct: 167710 cagaggctcatctttgcaggcaagcagctggaagatggccgcagtctttctgactacaac 167651

                                              
Query: 243    atccagaaagagtcgaccctgcacctggtcct 274
              ||||||||||||||||||||||| ||||||||
Sbjct: 167650 atccagaaagagtcgaccctgcatctggtcct 167619
</PRE>


<PRE>

 Score =  242 bits (122), Expect = 2e-61
 Identities = 186/206 (90%), Gaps = 1/206 (0%)
 Strand = Plus / Minus

                                                                          
Query: 70     atcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagtgaaacc 129
              ||||||| ||||||||||||||| |||||||||||||| ||| ||||||||||||| |||
Sbjct: 167369 atcttcgtgaagaccctgactggaaagaccatcaccctggaggtggagcccagtgacacc 167310

                                                                          
Query: 130    atcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccagcagagg 188
              ||||| |||||||| ||||||||||||||| |||| ||||| |||||||| |||||||||
Sbjct: 167309 atcgaaaatgtgaaagccaagatccaggatgaagaaggcatcccccccgatcagcagagg 167250

                                                                          
Query: 189    ctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaacatccag 248
              |||||||||||||||||| |  ||||||||||| ||||  | ||||| |||| |||||||
Sbjct: 167249 ctcatctttgcaggcaagaagttggaagatggccgcactctttctgactacagcatccag 167190

                                        
Query: 249    aaagagtcgaccctgcacctggtcct 274
              ||||||||||||||||||||||||||
Sbjct: 167189 aaagagtcgaccctgcacctggtcct 167164
</PRE>


<PRE>

 Score =  172 bits (87), Expect = 2e-40
 Identities = 187/219 (85%), Gaps = 1/219 (0%)
 Strand = Plus / Minus

                                                                          
Query: 57     ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
              |||||||||||  ||||||| ||| ||||| || ||||||| ||||||||| ||  ||||
Sbjct: 168065 ggtcaaaatgcggatcttcgtgaaaacccttaccggcaagatcatcacccttgaagtgga 168006

                                                                          
Query: 117    gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggca-tccccc 175
              ||||||||  || ||||| ||||| || ||||| ||||| |||||||| |||| ||||  
Sbjct: 168005 gcccagtgccactatcgaaaatgtcaaagccaaaatccaagataaagaaggcaatccctg 167946

                                                                          
Query: 176    cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
               |||||||||||||||||||||||||||||||| | |||||||||| |||   | |||||
Sbjct: 167945 tgaccagcagaggctcatctttgcaggcaagcagcgggaagatggccgcagtctttctga 167886

                                                     
Query: 236    ttacaacatccagaaagagtcgaccctgcacctggtcct 274
               ||||||||||||||||||||||||||||| ||||||||
Sbjct: 167885 ctacaacatccagaaagagtcgaccctgcatctggtcct 167847
</PRE>


<PRE>
><a name = 22064817></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=22064817&dopt=GenBank" >ref|XM_170833.1|</a> Homo sapiens similar to polyubiquitin (UBQ10) (LOC254746), mRNA
          Length = 1153

 Score =  268 bits (135), Expect = 4e-69
 Identities = 192/211 (90%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 552 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 611

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatccccccgaccagc 183
           || |||||||| |||||||||||||||||||| |||||||| ||||||||||||| ||||
Sbjct: 612 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatccccccgatcagc 671

                                                                       
Query: 184 agaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaaca 243
           ||||||||||||||||||||||||| |||||||||||| | ||  | ||||| |||||||
Sbjct: 672 agaggctcatctttgcaggcaagcagctggaagatggcggtactctttctgactacaaca 731

                                          
Query: 244 tccagaaagagtcgaccctgcacctggtcct 274
           ||||||| |||||||||||||||||||||||
Sbjct: 732 tccagaaggagtcgaccctgcacctggtcct 762
</PRE>


<PRE>

 Score =  262 bits (132), Expect = 2e-67
 Identities = 193/212 (91%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 324 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 383

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
           || |||||||| |||||||||||||||||||| |||||||| ||||| ||||||||||||
Sbjct: 384 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccgaccag 443

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| |||   | ||||| ||||||
Sbjct: 444 cagaggctcatctttgcaggcaagcagctggaagatggccgcagtctttctgactacaac 503

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||| ||||||||
Sbjct: 504 atccagaaagagtcgaccctgcatctggtcct 535
</PRE>


<PRE>

 Score =  242 bits (122), Expect = 2e-61
 Identities = 186/206 (90%), Gaps = 1/206 (0%)
 Strand = Plus / Plus

                                                                       
Query: 70  atcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagtgaaacc 129
           ||||||| ||||||||||||||| |||||||||||||| ||| ||||||||||||| |||
Sbjct: 785 atcttcgtgaagaccctgactggaaagaccatcaccctggaggtggagcccagtgacacc 844

                                                                       
Query: 130 atcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccagcagagg 188
           ||||| |||||||| ||||||||||||||| |||| ||||| |||||||| |||||||||
Sbjct: 845 atcgaaaatgtgaaagccaagatccaggatgaagaaggcatcccccccgatcagcagagg 904

                                                                       
Query: 189 ctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaacatccag 248
           |||||||||||||||||| |  ||||||||||| ||||  | ||||| |||| |||||||
Sbjct: 905 ctcatctttgcaggcaagaagttggaagatggccgcactctttctgactacagcatccag 964

                                     
Query: 249 aaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||
Sbjct: 965 aaagagtcgaccctgcacctggtcct 990
</PRE>


<PRE>

 Score =  172 bits (87), Expect = 2e-40
 Identities = 187/219 (85%), Gaps = 1/219 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||  ||||||| ||| ||||| || ||||||| ||||||||| ||  ||||
Sbjct: 89  ggtcaaaatgcggatcttcgtgaaaacccttaccggcaagatcatcacccttgaagtgga 148

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggca-tccccc 175
           ||||||||  || ||||| ||||| || ||||| ||||| |||||||| |||| ||||  
Sbjct: 149 gcccagtgccactatcgaaaatgtcaaagccaaaatccaagataaagaaggcaatccctg 208

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||||||||||||||||||||| | |||||||||| |||   | |||||
Sbjct: 209 tgaccagcagaggctcatctttgcaggcaagcagcgggaagatggccgcagtctttctga 268

                                                  
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcct 274
            ||||||||||||||||||||||||||||| ||||||||
Sbjct: 269 ctacaacatccagaaagagtcgaccctgcatctggtcct 307
</PRE>


<PRE>
><a name = 323229></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00323229&dopt=GenBank" >gb|M96687.1|BVDPP</a> Bovine viral diarrhea virus polyprotein gene, complete cds
          Length = 12480

 Score =  262 bits (132), Expect = 2e-67
 Identities = 196/216 (90%), Gaps = 1/216 (0%)
 Strand = Plus / Plus

                                                                        
Query: 61   aaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagccc 120
            |||||||| ||||||| ||| |||||||| |||| |||||||||||| ||| ||||||||
Sbjct: 5151 aaaatgcagatcttcgtgaaaaccctgaccggcaggaccatcaccctggaggtggagccc 5210

                                                                        
Query: 121  agtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gac 179
            ||||| ||||||||||| ||||||||||||||||||||||| || ||||| ||||| |||
Sbjct: 5211 agtgacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccctgac 5270

                                                                        
Query: 180  cagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattac 239
            |||||||||||||||||||| |||||||| |||||||||||| || |  | |||||||||
Sbjct: 5271 cagcagaggctcatctttgccggcaagcagctggaagatggccgctctctttctgattac 5330

                                                
Query: 240  aacatccagaaagagtcgaccctgcacctggtcctc 275
            ||||||||||||||||||||||||||||||||||||
Sbjct: 5331 aacatccagaaagagtcgaccctgcacctggtcctc 5366
</PRE>


<PRE>
><a name = 24047132></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=24047132&dopt=GenBank" >ref|NG_002287.1|</a> Homo sapiens ubiquitin B pseudogene 2 (UBBP2) on chromosome 1
          Length = 647

 Score =  258 bits (130), Expect = 4e-66
 Identities = 197/218 (90%), Gaps = 1/218 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||||||||||||||||||||| ||  ||||
Sbjct: 181 ggtcaaaatgcagatcttcgtgaagaccctgactggcaagaccatcacccttgaagtgga 240

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcc-ccc 175
           ||||||||| |||||||| |||||||||||||| ||||||||||| || ||||||| |||
Sbjct: 241 gcccagtgacaccatcgaaaatgtgaaggccaatatccaggataaggaaggcatcctccc 300

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           ||||||||||||||||||||||||||||| ||| || ||||||||||| ||  | |||||
Sbjct: 301 cgaccagcagaggctcatctttgcaggcatgcagctagaagatggctgtactctttctga 360

                                                 
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcc 273
            ||||||||||||||||||| ||||||| |||||||||
Sbjct: 361 ctacaacatccagaaagagttgaccctgtacctggtcc 398
</PRE>


<PRE>
><a name = 37582></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00037582&dopt=GenBank" >emb|X04802.1|HSUBPSE2</a> Homo sapiens UBBP2 pseudogene for ubiquitin UBB
          Length = 647

 Score =  258 bits (130), Expect = 4e-66
 Identities = 197/218 (90%), Gaps = 1/218 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           |||||||||||| ||||||| |||||||||||||||||||||||||||||| ||  ||||
Sbjct: 181 ggtcaaaatgcagatcttcgtgaagaccctgactggcaagaccatcacccttgaagtgga 240

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcc-ccc 175
           ||||||||| |||||||| |||||||||||||| ||||||||||| || ||||||| |||
Sbjct: 241 gcccagtgacaccatcgaaaatgtgaaggccaatatccaggataaggaaggcatcctccc 300

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
           ||||||||||||||||||||||||||||| ||| || ||||||||||| ||  | |||||
Sbjct: 301 cgaccagcagaggctcatctttgcaggcatgcagctagaagatggctgtactctttctga 360

                                                 
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggtcc 273
            ||||||||||||||||||| ||||||| |||||||||
Sbjct: 361 ctacaacatccagaaagagttgaccctgtacctggtcc 398
</PRE>


<PRE>
><a name = 323216></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00323216&dopt=GenBank" >gb|M87812.1|BVDMSEQH</a> Bovine viral diarrhea virus mRNA sequence
          Length = 768

 Score =  254 bits (128), Expect = 6e-65
 Identities = 192/212 (90%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 282 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 341

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
           || ||||||||||| ||||||||||||||||||||||| || ||||| ||||| ||||||
Sbjct: 342 gacaccatcgagaacgtgaaggccaagatccaggataaggaaggcattccccctgaccag 401

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||| | |||||| |||||||| |||||||||||| ||||  | ||||||||||||
Sbjct: 402 cagaggcttacctttgccggcaagcagctggaagatggccgcactctttctgattacaac 461

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||||||||
Sbjct: 462 atccagaaagagtcgaccctgcacctggtcct 493
</PRE>


<PRE>

 Score = 56.0 bits (28), Expect = 3e-05
 Identities = 28/28 (100%)
 Strand = Plus / Plus

                                       
Query: 248 gaaagagtcgaccctgcacctggtcctc 275
           ||||||||||||||||||||||||||||
Sbjct: 239 gaaagagtcgaccctgcacctggtcctc 266
</PRE>


<PRE>
><a name = 9837283></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=09837283&dopt=GenBank" >gb|AF285161.1|AF285161</a> Mus musculus cell-line C3H/He polyubiquitin C (Ubc) gene, complete
            cds
          Length = 3756

 Score =  246 bits (124), Expect = 1e-62
 Identities = 191/212 (90%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||| | |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 3067 atgcagatctttgtgaagaccctgacaggcaagaccatcaccctggaggtggagcccagt 3126

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || ||||| |||||||| ||||| ||||||||||| || |||||||||||||| ||||||
Sbjct: 3127 gacaccattgagaatgtcaaggcaaagatccaggacaaggagggcatcccccctgaccag 3186

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||| ||||||||||||||||| |||||||||||| ||||| | || || ||||||
Sbjct: 3187 cagaggctgatctttgcaggcaagcagctggaagatggccgcaccctgtcagactacaac 3246

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||
Sbjct: 3247 atccagaaagagtccaccctgcacctggtcct 3278
</PRE>


<PRE>

 Score =  246 bits (124), Expect = 1e-62
 Identities = 191/212 (90%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||| | |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 3295 atgcagatctttgtgaagaccctgacaggcaagaccatcaccctggaggtggagcccagt 3354

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || ||||| |||||||| ||||| ||||||||||| || |||||||||||||| ||||||
Sbjct: 3355 gacaccattgagaatgtcaaggcaaagatccaggacaaggagggcatcccccctgaccag 3414

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||| ||||||||||||||||| |||||||||||| ||||| | || || ||||||
Sbjct: 3415 cagaggctgatctttgcaggcaagcagctggaagatggccgcaccctgtcagactacaac 3474

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||
Sbjct: 3475 atccagaaagagtccaccctgcacctggtcct 3506
</PRE>


<PRE>

 Score =  246 bits (124), Expect = 1e-62
 Identities = 191/212 (90%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||| | |||||||||||| ||||||||||||||||| ||| |||||||||||
Sbjct: 2611 atgcagatctttgtgaagaccctgacaggcaagaccatcaccctggaggtggagcccagt 2670

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || ||||| |||||||| ||||| ||||||||||| || |||||||||||||| ||||||
Sbjct: 2671 gacaccattgagaatgtcaaggcaaagatccaggacaaggagggcatcccccctgaccag 2730

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||| ||||||||||||||||| |||||||||||| ||||| | || || ||||||
Sbjct: 2731 cagaggctgatctttgcaggcaagcagctggaagatggccgcaccctgtcagactacaac 2790

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||
Sbjct: 2791 atccagaaagagtccaccctgcacctggtcct 2822
</PRE>


<PRE>

 Score =  238 bits (120), Expect = 3e-60
 Identities = 190/212 (89%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||| | |||||||||||| ||||||||||||||||| ||| | |||||||||
Sbjct: 1699 atgcagatctttgtgaagaccctgacaggcaagaccatcaccctggaggtcgagcccagt 1758

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || ||||| |||||||| ||||| ||||||||||| || |||||||||||||| ||||||
Sbjct: 1759 gacaccattgagaatgtcaaggcaaagatccaggacaaggagggcatcccccctgaccag 1818

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||| ||||||||||||||||| |||||||||||| ||||| | || || ||||||
Sbjct: 1819 cagaggctgatctttgcaggcaagcagctggaagatggccgcaccctgtcagactacaac 1878

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||
Sbjct: 1879 atccagaaagagtccaccctgcacctggtcct 1910
</PRE>


<PRE>

 Score =  238 bits (120), Expect = 3e-60
 Identities = 190/212 (89%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||| | |||||||||||| ||||||||||||||||| ||| | |||||||||
Sbjct: 2839 atgcagatctttgtgaagaccctgacaggcaagaccatcaccctggaggtcgagcccagt 2898

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || ||||| |||||||| ||||| ||||||||||| || |||||||||||||| ||||||
Sbjct: 2899 gacaccattgagaatgtcaaggcaaagatccaggacaaggagggcatcccccctgaccag 2958

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||| ||||||||||||||||| |||||||||||| ||||| | || || ||||||
Sbjct: 2959 cagaggctgatctttgcaggcaagcagctggaagatggccgcaccctgtcagactacaac 3018

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||
Sbjct: 3019 atccagaaagagtccaccctgcacctggtcct 3050
</PRE>


<PRE>

 Score =  230 bits (116), Expect = 8e-58
 Identities = 189/212 (89%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||| | ||| |||||||| ||||||||||||||||| ||| | |||||||||
Sbjct: 2383 atgcagatctttgtgaaaaccctgacaggcaagaccatcaccctggaggtcgagcccagt 2442

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || ||||| |||||||| ||||| ||||||||||| || |||||||||||||| ||||||
Sbjct: 2443 gacaccatagagaatgtcaaggcaaagatccaggacaaggagggcatcccccctgaccag 2502

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||| ||||||||||||||||| |||||||||||| ||||| | || || ||||||
Sbjct: 2503 cagaggctgatctttgcaggcaagcagctggaagatggccgcaccctgtcagactacaac 2562

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||
Sbjct: 2563 atccagaaagagtccaccctgcacctggtcct 2594
</PRE>


<PRE>

 Score =  230 bits (116), Expect = 8e-58
 Identities = 189/212 (89%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||| | |||||||||||| ||||||||||||||||| ||| | |||||||||
Sbjct: 2155 atgcagatctttgtgaagaccctgacaggcaagaccatcaccctggaggtcgagcccagt 2214

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || ||||| |||||||| ||||| ||||||||||| || ||||||||| |||| ||||||
Sbjct: 2215 gacaccatagagaatgtcaaggcaaagatccaggacaaggagggcatctcccctgaccag 2274

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||| ||||||||||||||||| |||||||||||| ||||| | || || ||||||
Sbjct: 2275 cagaggctgatctttgcaggcaagcagctggaagatggccgcaccctgtcagactacaac 2334

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||
Sbjct: 2335 atccagaaagagtccaccctgcacctggtcct 2366
</PRE>


<PRE>

 Score =  230 bits (116), Expect = 8e-58
 Identities = 189/212 (89%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                        
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
            ||||| ||||| | |||||||||||| ||||||||||||||||| ||| | |||||||||
Sbjct: 1927 atgcagatctttgtgaagaccctgacaggcaagaccatcaccctggaggtcgagcccagt 1986

                                                                        
Query: 124  gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcatcccccc-gaccag 182
            || || || |||||||| ||||| ||||||||||| || |||||||||||||| ||||||
Sbjct: 1987 gacactatagagaatgtcaaggcaaagatccaggacaaggagggcatcccccctgaccag 2046

                                                                        
Query: 183  cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
            |||||||| ||||||||||||||||| |||||||||||| ||||| | || || ||||||
Sbjct: 2047 cagaggctgatctttgcaggcaagcagctggaagatggccgcaccctgtcagactacaac 2106

                                            
Query: 243  atccagaaagagtcgaccctgcacctggtcct 274
            |||||||||||||| |||||||||||||||||
Sbjct: 2107 atccagaaagagtccaccctgcacctggtcct 2138
</PRE>


<PRE>

 Score =  214 bits (108), Expect = 5e-53
 Identities = 169/188 (89%), Gaps = 1/188 (0%)
 Strand = Plus / Plus

                                                                        
Query: 88   actggcaagaccatcaccctagagatggagcccagtgaaaccatcgagaatgtgaaggcc 147
            ||||| |||||||||||||| ||| | ||||||||||| ||||| |||||||| ||||| 
Sbjct: 1495 actggtaagaccatcaccctggaggtcgagcccagtgacaccattgagaatgtcaaggca 1554

                                                                        
Query: 148  aagatccaggataaagagggcatcccccc-gaccagcagaggctcatctttgcaggcaag 206
            ||||||||||| || |||||||||||||| |||||||||||||| |||||||||||||||
Sbjct: 1555 aagatccaggacaaggagggcatcccccctgaccagcagaggctgatctttgcaggcaag 1614

                                                                        
Query: 207  caactggaagatggctgcaccttctctgattacaacatccagaaagagtcgaccctgcac 266
            || |||||||||||| ||||| | || || |||||||||||||||||||| |||||||||
Sbjct: 1615 cagctggaagatggccgcaccctgtcagactacaacatccagaaagagtccaccctgcac 1674

                    
Query: 267  ctggtcct 274
            ||||||||
Sbjct: 1675 ctggtcct 1682
</PRE>


<PRE>

 Score = 52.0 bits (26), Expect = 4e-04
 Identities = 38/42 (90%)
 Strand = Plus / Plus

                                                      
Query: 64   atgcaaatcttcgagaagaccctgactggcaagaccatcacc 105
            ||||| ||||| | |||||||||||| |||||||||||||||
Sbjct: 3523 atgcagatctttgtgaagaccctgacaggcaagaccatcacc 3564
</PRE>


<PRE>
><a name = 24047130></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=24047130&dopt=GenBank" >ref|NG_002285.1|</a> Homo sapiens ubiquitin B pseudogene 4 (UBBP4) on chromosome 17
          Length = 1335

 Score =  242 bits (122), Expect = 2e-61
 Identities = 186/206 (90%), Gaps = 1/206 (0%)
 Strand = Plus / Plus

                                                                       
Query: 70  atcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagtgaaacc 129
           ||||||| ||||||||||||||| |||||||||||||| ||| ||||||||||||| |||
Sbjct: 782 atcttcgtgaagaccctgactggaaagaccatcaccctggaggtggagcccagtgacacc 841

                                                                       
Query: 130 atcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccagcagagg 188
           ||||| |||||||| ||||||||||||||| |||| ||||| |||||||| |||||||||
Sbjct: 842 atcgaaaatgtgaaagccaagatccaggatgaagaaggcatcccccccgatcagcagagg 901

                                                                       
Query: 189 ctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaacatccag 248
           |||||||||||||||||| |  ||||||||||| ||||  | ||||| |||| |||||||
Sbjct: 902 ctcatctttgcaggcaagaagttggaagatggccgcactctttctgactacagcatccag 961

                                     
Query: 249 aaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||
Sbjct: 962 aaagagtcgaccctgcacctggtcct 987
</PRE>


<PRE>

 Score =  240 bits (121), Expect = 8e-61
 Identities = 188/209 (89%), Gaps = 1/209 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 548 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 607

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggca-tccccccgaccag 182
           || |||||||| |||||||||||||||||||| |||||||| |||| ||||||||| |||
Sbjct: 608 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcantccccccgatcag 667

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| | ||  | ||||| ||||||
Sbjct: 668 cagaggctcatctttgcaggcaagcagctggaagatggccgtactctttctgactacaac 727

                                        
Query: 243 atccagaaagagtcgaccctgcacctggt 271
           || ||||| ||||||||||||||||||||
Sbjct: 728 attcagaaggagtcgaccctgcacctggt 756
</PRE>


<PRE>

 Score =  238 bits (120), Expect = 3e-60
 Identities = 190/212 (89%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 320 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 379

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
           || |||||||| |||||||||||||||||||| |||||||| ||||| ||||||| || |
Sbjct: 380 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccggccgg 439

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||| |||||||||||| |||||||||||| |||   | ||||| ||||||
Sbjct: 440 cagaggctcatctctgcaggcaagcagctggaagatggccgcagtctttctgactacaac 499

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||| ||||||||
Sbjct: 500 atccagaaagagtcgaccctgcatctggtcct 531
</PRE>


<PRE>

 Score =  167 bits (84), Expect = 1e-38
 Identities = 184/216 (85%), Gaps = 1/216 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           ||||||||||| |||||||| ||| ||||| || ||||||| ||||||||| ||  ||||
Sbjct: 85  ggtcaaaatgcgaatcttcgtgaaaacccttaccggcaagatcatcacccttgaagtgga 144

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggca-tccccc 175
           ||||||||  || ||||| ||||| || ||||| ||||| |||||||| |||| ||||  
Sbjct: 145 gcccagtgccactatcgaaaatgtcaaagccaaaatccaagataaagaaggcaatccctg 204

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||||||||||||||||||||| | |||||||||| |||   | |||||
Sbjct: 205 tgaccagcagaggctcatctttgcaggcaagcagcgggaagatggccgcagtctttctga 264

                                               
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggt 271
            || |||||||||||||||||||||||||| |||||
Sbjct: 265 ctagaacatccagaaagagtcgaccctgcatctggt 300
</PRE>


<PRE>
><a name = 37572></a><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=00037572&dopt=GenBank" >emb|X07499.1|HSUBBP</a> Homo sapiens UBBP4 pseudogene for ubiquitin UBB
          Length = 1335

 Score =  242 bits (122), Expect = 2e-61
 Identities = 186/206 (90%), Gaps = 1/206 (0%)
 Strand = Plus / Plus

                                                                       
Query: 70  atcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagtgaaacc 129
           ||||||| ||||||||||||||| |||||||||||||| ||| ||||||||||||| |||
Sbjct: 782 atcttcgtgaagaccctgactggaaagaccatcaccctggaggtggagcccagtgacacc 841

                                                                       
Query: 130 atcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccagcagagg 188
           ||||| |||||||| ||||||||||||||| |||| ||||| |||||||| |||||||||
Sbjct: 842 atcgaaaatgtgaaagccaagatccaggatgaagaaggcatcccccccgatcagcagagg 901

                                                                       
Query: 189 ctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaacatccag 248
           |||||||||||||||||| |  ||||||||||| ||||  | ||||| |||| |||||||
Sbjct: 902 ctcatctttgcaggcaagaagttggaagatggccgcactctttctgactacagcatccag 961

                                     
Query: 249 aaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||||||
Sbjct: 962 aaagagtcgaccctgcacctggtcct 987
</PRE>


<PRE>

 Score =  240 bits (121), Expect = 8e-61
 Identities = 188/209 (89%), Gaps = 1/209 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 548 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 607

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggca-tccccccgaccag 182
           || |||||||| |||||||||||||||||||| |||||||| |||| ||||||||| |||
Sbjct: 608 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcantccccccgatcag 667

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           |||||||||||||||||||||||||| |||||||||||| | ||  | ||||| ||||||
Sbjct: 668 cagaggctcatctttgcaggcaagcagctggaagatggccgtactctttctgactacaac 727

                                        
Query: 243 atccagaaagagtcgaccctgcacctggt 271
           || ||||| ||||||||||||||||||||
Sbjct: 728 attcagaaggagtcgaccctgcacctggt 756
</PRE>


<PRE>

 Score =  238 bits (120), Expect = 3e-60
 Identities = 190/212 (89%), Gaps = 1/212 (0%)
 Strand = Plus / Plus

                                                                       
Query: 64  atgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatggagcccagt 123
           ||||| ||||||| |||||||||||| ||||||||||||||||| ||  |||||||||||
Sbjct: 320 atgcagatcttcgtgaagaccctgaccggcaagaccatcaccctggaagtggagcccagt 379

                                                                       
Query: 124 gaaaccatcgagaatgtgaaggccaagatccaggataaagagggcat-ccccccgaccag 182
           || |||||||| |||||||||||||||||||| |||||||| ||||| ||||||| || |
Sbjct: 380 gacaccatcgaaaatgtgaaggccaagatccaagataaagaaggcatcccccccggccgg 439

                                                                       
Query: 183 cagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctgattacaac 242
           ||||||||||||| |||||||||||| |||||||||||| |||   | ||||| ||||||
Sbjct: 440 cagaggctcatctctgcaggcaagcagctggaagatggccgcagtctttctgactacaac 499

                                           
Query: 243 atccagaaagagtcgaccctgcacctggtcct 274
           ||||||||||||||||||||||| ||||||||
Sbjct: 500 atccagaaagagtcgaccctgcatctggtcct 531
</PRE>


<PRE>

 Score =  167 bits (84), Expect = 1e-38
 Identities = 184/216 (85%), Gaps = 1/216 (0%)
 Strand = Plus / Plus

                                                                       
Query: 57  ggtcaaaatgcaaatcttcgagaagaccctgactggcaagaccatcaccctagagatgga 116
           ||||||||||| |||||||| ||| ||||| || ||||||| ||||||||| ||  ||||
Sbjct: 85  ggtcaaaatgcgaatcttcgtgaaaacccttaccggcaagatcatcacccttgaagtgga 144

                                                                       
Query: 117 gcccagtgaaaccatcgagaatgtgaaggccaagatccaggataaagagggca-tccccc 175
           ||||||||  || ||||| ||||| || ||||| ||||| |||||||| |||| ||||  
Sbjct: 145 gcccagtgccactatcgaaaatgtcaaagccaaaatccaagataaagaaggcaatccctg 204

                                                                       
Query: 176 cgaccagcagaggctcatctttgcaggcaagcaactggaagatggctgcaccttctctga 235
            |||||||||||||||||||||||||||||||| | |||||||||| |||   | |||||
Sbjct: 205 tgaccagcagaggctcatctttgcaggcaagcagcgggaagatggccgcagtctttctga 264

                                               
Query: 236 ttacaacatccagaaagagtcgaccctgcacctggt 271
            || |||||||||||||||||||||||||| |||||
Sbjct: 265 ctagaacatccagaaagagtcgaccctgcatctggt 300
</PRE>


<form>

<PRE>
  Database: All GenBank+EMBL+DDBJ+PDB sequences (but no EST, STS, GSS,
  or phase 0, 1 or 2 HTGS sequences)
    Posted date:  Nov 24, 2002  6:29 AM
  Number of letters in database: -1,304,953,840
  Number of sequences in database:  1,473,826
  
Lambda     K      H
    1.37    0.711     1.31 

Gapped
Lambda     K      H
    1.37    0.711     1.31 


Matrix: blastn matrix:1 -3
Gap Penalties: Existence: 5, Extension: 2
Number of Hits to DB: 1,303,692
Number of Sequences: 1473826
Number of extensions: 1303692
Number of successful extensions: 26770
Number of sequences better than 10.0: 790
Number of HSP''s better than 10.0 without gapping: 784
Number of HSP''s successfully gapped in prelim test: 7
Number of HSP''s that attempted gapping in prelim test: 22844
Number of HSP''s gapped (non-prelim): 2671
length of query: 285
length of database: 7,284,980,748
effective HSP length: 20
effective length of query: 265
effective length of database: 7,255,504,228
effective search space: 1922708620420
effective search space used: 1922708620420
T: 0
A: 0
X1: 6 (11.9 bits)
X2: 15 (29.7 bits)
S1: 12 (24.3 bits)
S2: 19 (38.2 bits)

</form>

'
]

{ #category : #'results-ready' }
BioWebBlastSamples >> bt074Txt [
	"WARNING: This is code generated automatically.
 On: 27 December 2010 - 5:37:16 pm"

	^ '<HTML>
<HEAD>
</HEAD>
<BODY BGCOLOR="#FFFFFF" LINK="#0000FF" VLINK="#660099" ALINK="#660099">
<IMG SRC="images/head_results.gif" ALT="Header of the page" BORDER="0"NAME="BlastHeaderGif" WIDTH="600" HEIGHT="45" ALIGN="middle">
<form action="Blast.cgi" enctype="application/x-www-form-urlencoded" method="POST"><input name="ALIGNMENTS" type="hidden" value="10"><input name="ALIGNMENT_VIEW" type="hidden" value="Pairwise"><input name="AUTO_FORMAT" type="hidden" value="on"><input name="CLIENT" type="hidden" value="web"><input name="DESCRIPTIONS" type="hidden" value="10"><input name="EXPECT" type="hidden" value="0.01"><input name="FORMAT_ENTREZ_QUERY" type="hidden" value="(none)"><input name="FORMAT_OBJECT" type="hidden" value="Alignment"><input name="FORMAT_TYPE" type="hidden" value="HTML"><input name="HITLIST_SIZE" type="hidden" value="10"><input name="RID" type="hidden" value="1038588547-028642-15893"><input name="RTOE" type="hidden" value="85"><input name="SHOW_OVERVIEW" type="hidden" value="on"><input name="STEP_NUMBER" type="hidden" value="1"><input name="WWW_BLAST_TYPE" type="hidden" value="hs_genes"><input name="CMD" type="hidden" value="Get"></form>
<form action="Blast.cgi" enctype="application/x-www-form-urlencoded" method="POST" TARGET=""><input name="ALIGNMENTS" type="hidden" value="10"><input name="ALIGNMENT_VIEW" type="hidden" value="Pairwise"><input name="AUTO_FORMAT" type="hidden" value="on"><input name="CLIENT" type="hidden" value="web"><input name="DESCRIPTIONS" type="hidden" value="10"><input name="EXPECT" type="hidden" value="0.01"><input name="FORMAT_ENTREZ_QUERY" type="hidden" value="(none)"><input name="FORMAT_OBJECT" type="hidden" value="Alignment"><input name="FORMAT_TYPE" type="hidden" value="HTML"><input name="HITLIST_SIZE" type="hidden" value="10"><input name="RID" type="hidden" value="1038588547-028642-15893"><input name="RTOE" type="hidden" value="85"><input name="SHOW_OVERVIEW" type="hidden" value="on"><input name="STEP_NUMBER" type="hidden" value="1"><input name="WWW_BLAST_TYPE" type="hidden" value="hs_genes"><input name="CMD" type="hidden" value="Get">

<p><!--
QBlastInfoBegin
	Status=READY
QBlastInfoEnd
--><p><TITLE> RID=1038588547-028642-15893, lcl|1 </TITLE>
<HTML>
<HEAD>
<TITLE>Human Genome BLAST Search Results</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="http://www.ncbi.nlm.nih.gov/genome/seq/ncbi.css">
</HEAD>


<body bgcolor="#FFFFFF">


<table border="0" width="600" cellspacing="0" cellpadding="0">
  <tr valign="bottom"> 
    <td width="144" valign="top" align="left"><img src="http://www.ncbi.nlm.nih.gov/genome/seq/IMG/pix_tr.gif" width="144" height="1"><br>
      <a href="http://www.ncbi.nlm.nih.gov/"><img src="http://www.ncbi.nlm.nih.gov/genome/seq/IMG/ncbilogo.gif" width="130" height="45" border="0"></a></td>
    <td width="456"><a href="http://www.ncbi.nlm.nih.gov/genome/guide/"><img src="http://www.ncbi.nlm.nih.gov/entrez/query/static/gifs/entrez_gen.gif" width="456" height="45" border="0"></a></td>
  </tr>
</table>





<BR><BR>

<p class=HEAD2> Commencing search, please wait for results.</p>

<BR><BR>
<PRE>


<b>BLASTP 2.2.4 [Aug-26-2002]</b>

<pre>
<b><a href="http://www.ncbi.nlm.nih.gov/htbin-
post/Entrez/query?uid=9254694&form=6&db=m&Dopt=r">Reference</a>:</b>
Altschul, Stephen F., Thomas L. Madden, Alejandro A. Sch&auml;ffer, 
Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), 
"Gapped BLAST and PSI-BLAST: a new generation of protein database search
programs",  Nucleic Acids Res. 25:3389-3402.
<p>
RID: 1038588547-028642-15893
<p>
<b>Query=</b> lcl|1
         (87 letters)

<p>
<b>Database:</b> Homo sapiens protein sequences 
           39,341 sequences; 15,598,025 total letters

<p> <p>If you have any problems or questions with the results of this search <br>please refer to the <b><a href=http://www.ncbi.nlm.nih.gov/blast/blast_FAQs.html>BLAST FAQs</a></b><br><p>

<table border=0 width=600 cellpadding=8>
<tr valign="top">
<td><a href="http://www.ncbi.nlm.nih.gov/mapview/map_search.cgi?chr=hum_chr.inf&RID=1038588547-028642-15893">
<img border=0 src="html/GenomeView.gif"></a></td>
<td>Show positions of the BLAST hits in the human genome using the Entrez Genomes MapViewer</td>
</tr>
</table>

<p>
<a href="Blast.cgi?CMD=Get&RID=1038588547-028642-15893&FORMAT_OBJECT=TaxBlast" TARGET="Taxonomy BLAST Results for 1038588547-028642-15893">Taxonomy reports</a>
<BR>
</PRE>
<CENTER>
<H3><a href="/blast/newoptions.html#graphical-overview"> Distribution of 1 Blast Hits on the Query Sequence</a></H3>
<input name=defline size=80 value="Mouse-over to show defline and scores. Click to show alignments">
</CENTER>
<map name=img_map>
<area shape=rect coords=164,101,427,106 href="#22748611" ONMOUSEOVER=''document.forms[1].defline.value="NP_689464  defensin, beta 106; defensin, beta 6 [Homo sapiens]  ..S= 110 E=2e-25"'' ONMOUSEOUT=''document.forms[1].defline.value="Mouse-over to show defline and scores. Click to show alignments"'' >
</map>
<CENTER>
<IMG WIDTH=536 HEIGHT=108 USEMAP=#img_map BORDER=1 SRC="nph-getgif.cgi?iblast31&207891705318584.gif" ISMAP></CENTER>
<HR>
<PRE>
<PRE>


                                                                 Score    E
Sequences producing significant alignments:                      (bits) Value

<a href="http://www.ncbi.nlm.nih.gov/LocusLink/LocRpt.cgi?db=protein%20&na=0&gnl=ref%7CNP_689464.1%7C&gi=22748611&RID=1038588547-028642-15893&segs=16-64&seal=504D6EF60FDA6D00B5DF1946356E5FE4">ref|NP_689464.1|</a>  defensin, beta 106; defensin, beta 6 [Homo...   <a href = #22748611>110</a>   2e-25
</PRE>
<CENTER><b><FONT color="green">Alignments</FONT></b></CENTER>
</form>
<PRE>
><a name = 22748611></a><a href="http://www.ncbi.nlm.nih.gov/LocusLink/LocRpt.cgi?db=protein%20&na=0&gnl=ref%7CNP_689464.1%7C&gi=22748611&RID=1038588547-028642-15893&segs=16-64&seal=504D6EF60FDA6D00B5DF1946356E5FE4">ref|NP_689464.1|</a> defensin, beta 106; defensin, beta 6 [Homo sapiens]
 <a name = 22252904></a><a href="http://www.ncbi.nlm.nih.gov/LocusLink/LocRpt.cgi?db=protein%20&na=0&gnl=gb%7CAAM93908.1%7C&gi=22252904&RID=1038588547-028642-15893&segs=16-64&seal=CB377645AB0B7850EEA227F7D9C069D7">gb|AAM93908.1|</a> defensin beta 106 [Homo sapiens]
 <a name = 22506647></a><a href="http://www.ncbi.nlm.nih.gov/LocusLink/LocRpt.cgi?db=protein%20&na=0&gnl=dbj%7CBAC10631.1%7C&gi=22506647&RID=1038588547-028642-15893&segs=16-64&seal=F9EC3397411EB87986F3766DE1BE480F">dbj|BAC10631.1|</a> beta-defensin-6 [Homo sapiens]
          Length = 65

 <a name = 22748611_274></a><a name = 22748611_274_21_69_17_65></a>Score =  110 bits (274), Expect = 2e-25
 Identities = 49/49 (100%), Positives = 49/49 (100%)

Query: 21 AKNAFFDEKCNKLKGTCKNNCGKNEELIALCQKSLKCCRTIQPCGSIID 69
          AKNAFFDEKCNKLKGTCKNNCGKNEELIALCQKSLKCCRTIQPCGSIID
Sbjct: 17 AKNAFFDEKCNKLKGTCKNNCGKNEELIALCQKSLKCCRTIQPCGSIID 65
</PRE>


<form>

<PRE>
  Database: Homo sapiens protein sequences
    Posted date:  Nov 27, 2002 12:59 AM
  Number of letters in database: 15,598,025
  Number of sequences in database:  39,341
  
Lambda     K      H
   0.327    0.142    0.483 

Gapped
Lambda     K      H
   0.267   0.0410    0.140 


Matrix: BLOSUM62
Gap Penalties: Existence: 11, Extension: 1
Number of Hits to DB: 3,148,972
Number of Sequences: 39341
Number of extensions: 121780
Number of successful extensions: 393
Number of sequences better than 1.0e-02: 1
Number of HSP''s better than  0.0 without gapping: 1
Number of HSP''s successfully gapped in prelim test: 0
Number of HSP''s that attempted gapping in prelim test: 392
Number of HSP''s gapped (non-prelim): 1
length of query: 87
length of database: 15,598,025
effective HSP length: 63
effective length of query: 24
effective length of database: 13,119,542
effective search space: 314869008
effective search space used: 314869008
T: 11
A: 40
X1: 15 ( 7.1 bits)
X2: 38 (14.6 bits)
X3: 64 (24.7 bits)
S1: 40 (21.7 bits)
S2: 79 (35.0 bits)

</form>

'
]

{ #category : #examples }
BioWebBlastSamples >> ncbiClientSample01 [
"
http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?QUERY=555&DATABASE=nr&HITLIST_SIZE=10&FILTER=L&EXPECT=10&FORMAT_TYPE=HTML&PROGRAM=blastn&CLIENT=web&SERVICE=plain&NCBI_GI=on&PAGE=Nucleotides&CMD=Put
"
	| search |
	
	search := 
		BioNCBIWebBlastWrapper new nucleotide
			query: '555';
			hitListSize: 10;
			filterLowComplexity;
			expectValue: 10;
			blastn;
			blastPlainService;
			formatTypeXML;
			fetch.
	self dumpToFileNamed: 'blastQuery01.xml' contents: search result.


]

{ #category : #examples }
BioWebBlastSamples >> ncbiClientSample02 [

	| search |
	
	search := 
		BioNCBIWebBlastWrapper new nucleotide
			query: 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
			hitListSize: 100;
			filterLowComplexity;
			expectValue: 10;
			wordSize: 10;
			blastn;
			formatTypeXML;
			fetch.
	self dumpToFileNamed: 'blastQuery02.xml' contents: search result.

]

{ #category : #examples }
BioWebBlastSamples >> ncbiClientSample03 [

	| search |
	
	search := 
		BioNCBIWebBlastWrapper new nucleotide
			query: 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
			hitListSize: 10;
			filterLowComplexity;
			expectValue: 10;
			wordSize: 10;
			blastn;
			formatTypeXML;
			alignmentViewFlatQueryAnchoredNoIdentities;
			fetch.
	self dumpToFileNamed: 'blastQuery03.xml' contents: search result.
	search inspect.

]

{ #category : #examples }
BioWebBlastSamples >> ncbiClientSample04 [
	<example>
	| search |
	
	'blastQuery04.xml' asFileReference ensureDelete.
	search := 
		BioNCBIWebBlastWrapper new nucleotide
			query: 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
			hitListSize: 50;
			filterLowComplexity;
			expectValue: 10;
			wordSize: 10;
			blastn;
			blastPlainService;
			alignmentViewFlatQueryAnchored;
			formatTypeXML;			
			fetch.
	self dumpToFileNamed: 'blastQuery04.xml' contents: search result.
	search result inspect

]

{ #category : #autogenerated }
BioWebBlastSamples >> qbreq1Html [
	"WARNING: This is code generated automatically.
 On: 1 January 2011 - 6:33:03 pm"

	^ '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="ncbi_app" content="blast" />
<meta name="ncbi_pdid" content="blastformatreq" />
<meta name="ncbi_stat" content="false" />
<script type="text/javascript"> var ncbi_startTime = new Date(); </script>
<title>NCBI Blast</title>
<link rel="stylesheet" type="text/css" href="css/main.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/common.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/blastReq.css" media="screen" />
<!--[if IE]>
<link rel="stylesheet" type="text/css" href="css/blastReqIE.css" media="screen" />
<![endif]-->
<link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
<link rel="stylesheet" id="sugstyle" href="http://www.ncbi.nlm.nih.gov/coreweb/styles/ncbisuggest.css" type="text/css" />


<!--[if lte IE 6]>
<link rel="stylesheet" type="text/css" href="css/ie6_or_less.css" />
<![endif]-->

<script type="text/javascript" src="js/utils.js"></script>
<script type="text/javascript" src="js/toggle.js"></script>
<script type="text/javascript" src="js/blast.js"></script>
<script type="text/javascript" src="js/format.js"></script>
<script type="text/javascript" src="http://www.ncbi.nlm.nih.gov/coreweb/javascript/nsuggest/nsuggest_ajax.js"></script>
<script type="text/javascript">
/*NSuggest_CgiUrl = "/blast/zaretska/blastTest/nsuggest_proxy.cgi";*/
</script>
</head>

<body id="type-a">

<div id="wrap">
			<div id="header">	    
		<div id="site-name"><a id="logolink" href="http://www.ncbi.nlm.nih.gov" title="NCBI Home Page"><img src="css/images/helix.gif" alt="NCBI Logo" title="Link to NCBI Home Page" /></a>BLAST<h1 class="desc">Basic Local Alignment Search Tool</h1>
		</div>
		<div id="search">
		
<div>
<script language="JavaScript" type="text/javascript"><!--

var myncbi_x = MyNCBI_find();
var myncbi_cu = unescape(''http%3A//www.ncbi.nlm.nih.gov/blast/Blast.cgi%3FCLIENT%3Dweb%26CMD%3DPut%26DATABASE%3Dnr%26ENTREZ%5FQUERY%3D%26EXPECT%3D10%26FILTER%3DL%26FULL%5FDBNAME%3Dnr%26HITLIST%5FSIZE%3D10%26JOB%5FTITLE%3Dgi%257C555%2B%2B%28624%2Bletters%29%26MYNCBI%5FUSER%3D5907118723%26NCBI%5FGI%3Don%26PAGE%3DNucleotides%26PROGRAM%3Dblastn%26QUERY%5FINFO%3Dgi%257C555%2B%2B%28624%2Bletters%29%26QUERY%5FLENGTH%3D624%26RID%3DHZ50WJZT01N%26RTOE%3D10%26SERVICE%3Dplain%26USER%5FTYPE%3D2'');
function MyNCBI_find()
{
var cs = document.cookie.split(''; '');
for(var i = 0; i < cs.length; i++) {
// a name/value pair (a crumb) is separated by an equal sign
var c = cs[i].split(''='');
if(c[0] == ''WebCubbyUser'') { return c[1]; }
}
return '''';
}
function MyNCBI_auto_submit(url)
{
var qm = url.indexOf(''?'');
if( qm < 0 || qm >= (url.length - 1) ) {
window.location.replace(url);
} else {
var w = (self != top && self.name) ? top.frames[self.name] : self;
var f = ''<form name="myncbiautosubmitform" method="POST" action="'' + url.substr(0, qm) + ''" target="'' + w.name + ''">'';
var q = url.substr(qm + 1).replace(/&amp;/g,''&'');
var args = q.split(''&'');
for(j = 0; j < args.length; j++) {
var p = args[j].split(''='');
if(p[0].length < 1) { continue; }
f += ''<input type="hidden" name="'' + unescape(p[0]);
if( p.length > 1 ) {
p.shift();
f += ''" value="'' + unescape(p.join(''='')).replace(/"/g,''&quot;'');
}
f += ''"/>'';
}
f += ''</form>'';
w.document.body.innerHTML += f;
w.document.myncbiautosubmitform.submit();
}
}
function MyNCBI_r()
{
var x = MyNCBI_find();
if( x != myncbi_x ) {
myncbi_x = x;
MyNCBI_auto_submit(myncbi_cu);
} else {
window.setTimeout(MyNCBI_r, 500);
}
}
window.setTimeout(MyNCBI_r, 500);
// --></script><table class="medium1" style="border:2px solid #336699;" cellpadding="2" cellspacing="0" id="myncbi_off"><tr><td
bgcolor="#336699" align="left"><a href="http://www.ncbi.nlm.nih.gov/sites/myncbi/?"><font color="#FFFFFF"><b>My NCBI</b></font></a></td><td
bgcolor="#336699" align="right"><a href="/books/bv.fcgi?rid=helpmyncbi.chapter.MyNCBI" title="My NCBI help"><img border="0"
src="http://www.ncbi.nlm.nih.gov/corehtml/query/MyNCBI/myncbihelpicon.gif" alt="My NCBI help" /></a></td></tr><tr><td colspan="2" nowrap="nowrap"><a
href="http://www.ncbi.nlm.nih.gov/sites/myncbi/?back_url=http%3A//www.ncbi.nlm.nih.gov/blast/Blast.cgi%3FCLIENT%3Dweb%26CMD%3DPut%26DATABASE%3Dnr%26ENTREZ%5FQUERY%3D%26EXPECT%3D10%26FILTER%3DL%26FULL%5FDBNAME%3Dnr%26HITLIST%5FSIZE%3D10%26JOB%5FTITLE%3Dgi%257C555%2B%2B%28624%2Bletters%29%26MYNCBI%5FUSER%3D5907118723%26NCBI%5FGI%3Don%26PAGE%3DNucleotides%26PROGRAM%3Dblastn%26QUERY%5FINFO%3Dgi%257C555%2B%2B%28624%2Bletters%29%26QUERY%5FLENGTH%3D624%26RID%3DHZ50WJZT01N%26RTOE%3D10%26SERVICE%3Dplain%26USER%5FTYPE%3D2" title="Click to sign in"
onclick="MyNCBI_auto_submit(''http://www.ncbi.nlm.nih.gov/sites/myncbi/?back_url=http%3A//www.ncbi.nlm.nih.gov/blast/Blast.cgi%3FCLIENT%3Dweb%26CMD%3DPut%26DATABASE%3Dnr%26ENTREZ%5FQUERY%3D%26EXPECT%3D10%26FILTER%3DL%26FULL%5FDBNAME%3Dnr%26HITLIST%5FSIZE%3D10%26JOB%5FTITLE%3Dgi%257C555%2B%2B%28624%2Bletters%29%26MYNCBI%5FUSER%3D5907118723%26NCBI%5FGI%3Don%26PAGE%3DNucleotides%26PROGRAM%3Dblastn%26QUERY%5FINFO%3Dgi%257C555%2B%2B%28624%2Bletters%29%26QUERY%5FLENGTH%3D624%26RID%3DHZ50WJZT01N%26RTOE%3D10%26SERVICE%3Dplain%26USER%5FTYPE%3D2'');return false;">[Sign In]</a> <a
href="http://www.ncbi.nlm.nih.gov/sites/myncbi/register/?back_url=http%3A//www.ncbi.nlm.nih.gov/blast/Blast.cgi%3FCLIENT%3Dweb%26CMD%3DPut%26DATABASE%3Dnr%26ENTREZ%5FQUERY%3D%26EXPECT%3D10%26FILTER%3DL%26FULL%5FDBNAME%3Dnr%26HITLIST%5FSIZE%3D10%26JOB%5FTITLE%3Dgi%257C555%2B%2B%28624%2Bletters%29%26MYNCBI%5FUSER%3D5907118723%26NCBI%5FGI%3Don%26PAGE%3DNucleotides%26PROGRAM%3Dblastn%26QUERY%5FINFO%3Dgi%257C555%2B%2B%28624%2Bletters%29%26QUERY%5FLENGTH%3D624%26RID%3DHZ50WJZT01N%26RTOE%3D10%26SERVICE%3Dplain%26USER%5FTYPE%3D2" title="Click to register for an account"
onclick="MyNCBI_auto_submit(''http://www.ncbi.nlm.nih.gov/sites/myncbi/register/?back_url=http%3A//www.ncbi.nlm.nih.gov/blast/Blast.cgi%3FCLIENT%3Dweb%26CMD%3DPut%26DATABASE%3Dnr%26ENTREZ%5FQUERY%3D%26EXPECT%3D10%26FILTER%3DL%26FULL%5FDBNAME%3Dnr%26HITLIST%5FSIZE%3D10%26JOB%5FTITLE%3Dgi%257C555%2B%2B%28624%2Bletters%29%26MYNCBI%5FUSER%3D5907118723%26NCBI%5FGI%3Don%26PAGE%3DNucleotides%26PROGRAM%3Dblastn%26QUERY%5FINFO%3Dgi%257C555%2B%2B%28624%2Bletters%29%26QUERY%5FLENGTH%3D624%26RID%3DHZ50WJZT01N%26RTOE%3D10%26SERVICE%3Dplain%26USER%5FTYPE%3D2'');return false;">[Register]</a></td></tr></table></div>
		</div>
		<a class="skp" href="#content-wrap">Jump to Page Content</a>		
		<ul id="nav">
                <li  class="first "><a href="Blast.cgi?CMD=Web&amp;PAGE_TYPE=BlastHome" title="BLAST Home">Home</a></li>
                <li  class="recent "><a href="Blast.cgi?CMD=GetSaved&amp;RECENT_RESULTS=on" title="Unexpired BLAST jobs">Recent Results</a></li>                
                <li  class="saved "><a href="Blast.cgi?CMD=GetSaved" title="Saved sets of BLAST search parameters">Saved Strategies</a></li>
                <li  class= "last documentation "> <a href="Blast.cgi?CMD=Web&amp;PAGE_TYPE=BlastDocs" title="BLAST documentation">Help</a></li>                
                </ul>
    </div>
        <div id="content-wrap">

                <!-- %%% Add breadcrumb text -->
                <div id="breadcrumb">
                   <a href="http://www.ncbi.nlm.nih.gov/">NCBI</a>/
                   <a href="Blast.cgi?CMD=Web&PAGE_TYPE=BlastHome">BLAST</a>/                   
                   <strong>Format Request</strong>                   
                </div>

				<!-- Do errors this way -->				
				<!--<ul class="msg"><li class=""><p></p></li></ul>-->
				<ul id="msgR" class="msg"><li class=""></li></ul>
                <div id="content">
				<form action="Blast.cgi" enctype="application/x-www-form-urlencoded" method="post" name="FormatForm" id="FormatForm">				

<script language="JavaScript">

 <!--

//document.images[''BlastHeaderGif''].src = ''html/head_formating.gif'';

// -->

</script>



<!--
                <p class=''info''>
<strong>Job submitted.</strong>
We estimate that results will be ready in 16 seconds or less.

</p>
-->

<div class="fbtn">
<!--
<a href="javascript:document.forms[0].submit();">
<img align="middle" alt="Format button" border="0" src="FormatPage_files/format_but.gif">
</a>
-->
</div>

<dl class="summary  query title db">
<dd>
</dd>

<!-- <span class=" query title db">-->
<!-- <span  class="hidden query"><dt>Query</dt><dd>gi|555  (624 letters)</dd></span> -->
<dt class="hidden query">Query</dt><dd class="hidden query">gi|555  (624 letters)</dd>
<dt class="hidden db">Database</dt><dd class="hidden db">nr</dd>
<dt class="hidden title">Job title</dt><dd class="hidden title">gi|555  (624 letters)</dd>
<dt class="hidden entrez">Entrez Query</dt><dd class="hidden entrez"><span class="note entrez">Note: Your search is limited to records matching this Entrez query</span></dd>
<!-- </span> -->
<dt><label for="rid">Request ID</label></dt><dd><input name="RID" size="50" type="text" value="HZ50WJZT01N" id="rid" />
<input type="submit" value="View report" name="ViewReport" class="button" />
<!-- <img border="0" id="viewRpButton" src="images/veiwRpButton.jpg" class="viewReport"  alt="View report"  mouseovImg="images/veiwRpButtonOver.jpg" mouseoutImg="images/veiwRpButton.jpg" mousedownImg="images/veiwRpButtonDown.jpg" mouseupImg="images/veiwRpButtonOver.jpg"  />-->
<input type="checkbox" name="NEWWINRES"  form="FormatForm" winType="const" id="nw" class="newwin"  />
<label for="nw">Show results in a new window</label>
</dd>
<dt>Format<br/>
<!--<a class=''help'' href="#">[Help]</a></dt> -->

<dd>
<table class="options blastn ">

<tr class="paramSet xgl">
<td class="hd"><label for="FORMAT_OBJECT">Show</label></td>
<td>
<div class="fi">
<select id="FORMAT_OBJECT" class="reset" name="FORMAT_OBJECT" defVal="Alignment">
<option value="Alignment" >Alignment</option>
<option value="PSSM" >PSSM</option>
<option value="PSSM_Scoremat" >PssmWithParameters</option>
<option value="Bioseq"  >Bioseq</option>
</select>
<label for="FORMAT_TYPE">as</label>
<select name="FORMAT_TYPE" id="FORMAT_TYPE" class="reset" defVal="HTML">
<option value="HTML"  >HTML</option>
<option value="Text"  >Plain text</option>
<option value="ASN.1"  >ASN.1</option>
<option value="XML"  >XML</option>
</select>
<input name="PSSM_FORMAT_TYPE" value="Text" size="3" id="pssmFormat" type="text" class="hidden dispType" />
<input name="BIOSEQ_FORMAT_TYPE" value="ASN.1" size="3" id="bioseqFormat" type="text" class="hidden dispType" />
<input name="PSSM_SC_FORMAT_TYPE" value="ASN.1" size="3" id="pssmScFormat" type="text" class="hidden dispType" />
<span id="advView" class="">
<input name="NEW_VIEW" id="NEW_VIEW" type="checkbox" class="cb reset" defVal="checked"  />
<label for="NEW_VIEW">Advanced View</label>
<span class=""><input name="OLD_BLAST" id="OLD_BLAST" type="checkbox" class="cb reset" defVal="unchecked"  />
<label for="OLD_BLAST">Use old BLAST report format</label></span>
</span>
<a class="resetAll" id="resetAll" >Reset form to defaults</a>
<a class="helplink hiding" title="Alignments object formatting help" id="formatHelp" href="#"><span>[?]</span></a>
<p toggle="formatHelp" class="helpbox hidden" id="hlp1">
These options control formatting of alignments in results pages. The
default is HTML, but other formats (including plain text) are available.
PSSM and PssmWithParameters are representations of Position Specific Scoring Matrices and are only available for PSI-BLAST. 
The Advanced view option allows the database descriptions to be sorted by various indices in a table.
<a href="http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#format_object" target="helpWin" title="Additional alignments object formatting help">more...</a>
</p>
</div>
</td>
</tr>

<tr class="odd paramSet">
<td class="hd"><label for="ALIGNMENT_VIEW">Alignment View</label></td>
<td>
<div class="fi">
<select name="ALIGNMENT_VIEW" id="ALIGNMENT_VIEW" defVal="Pairwise" class="reset">
<option value="Pairwise"  >Pairwise</option>
<option value="PairwiseWithIdentities"  >Pairwise with dots for identities</option>
<option value="QueryAnchored"  >Query-anchored with dots for identities</option>
<option value="QueryAnchoredNoIdentities"  >Query-anchored with letters for identities</option>
<option value="FlatQueryAnchored"  >Flat query-anchored with dots for identities</option>
<option value="FlatQueryAnchoredNoIdentities"  >Flat query-anchored with letters for identities</option>
<option value="Tabular"  >Hit Table</option>
</select>

<a class="helplink hiding" title="Alignments view options help" id="alnViewHelp" href="#"><span>[?]</span></a>
<p toggle="alnViewHelp" class="helpbox hidden" id="hlp2">
Choose how to view alignments.
The default "pairwise" view shows how each subject sequence aligns
individually to the query sequence. The "query-anchored" view shows how
all subject sequences align to the query sequence. For each view type,
you can choose to show "identities" (matching residues) as letters or
dots.
<a href="http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#alignment_view" target="helpWin" title="Additional alignments view options help">more...</a>
</p>
</div>
</td>
</tr>

<tr class="paramSet">
<td class="hd"><label>Display</label></td>
<td class="cb">
<div class="fi">
<input name="SHOW_OVERVIEW" id="SHOW_OVERVIEW" type="checkbox" class="cb reset" defVal="checked" checked="checked" />
<label class="rb" for="SHOW_OVERVIEW">Graphical Overview</label>

<input name="SHOW_LINKOUT" id="SHOW_LINKOUT" type="checkbox" class="cb reset" defVal="checked" checked="checked" />
<label class="rb" for="SHOW_LINKOUT">Linkout</label>

<input name="GET_SEQUENCE" id="GET_SEQUENCE" type="checkbox" class="cb reset" defVal="checked" checked="checked" />
<label class="rb" for="GET_SEQUENCE">Sequence Retrieval</label>

<input name="NCBI_GI" id="NCBI_GI" type="checkbox" class="cb reset" defVal="unchecked" checked="checked" />
<label class="rb" for="NCBI_GI">NCBI-gi</label>

<input name="SHOW_CDS_FEATURE" id="SHOW_CDS_FEATURE" type="checkbox" class="cb reset blastn" defVal="unchecked"  />
<label for="SHOW_CDS_FEATURE" class="blastn">CDS feature</label>
<a class="helplink hiding" title="Alignments display options help" id="displayHelp" href="#"><span>[?]</span></a>
<ul toggle="displayHelp" class="helpbox hidden" id="hlp3">
<li>Graphical Overview: Graphical Overview: Show graph of similar sequence regions aligned to  query.
<a href="http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#show_overview" target="helpWin" title="Graphical Overview help">more...</a>
</li>
<li>Database LinkOuts: Show links from matching sequences to entries in specialized NCBI databases.
<a href="http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#show_linkout" title="LinkOut help" target="helpWin" >more...</a>
</li>
<li>Sequence Retrieval: Show buttons to download matching sequences.
<a href="http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#get_sequence" title="Sequence Retrieval help" target="helpWin" >more...</a>
</li>
<li>NCBI-gi: Show NCBI gi identifiers.
<a href="http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#ncbi_gi" title="NCBI-gi help" target="helpWin" >more...</a>
</li>
<li>CDS feature: Show annotated coding region and translation.
<a href="http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#show_cds_feature" title="CDS feature help" target="helpWin" >more...</a>
</li></ul>
</div>
</td>
</tr>


<tr class="paramSet odd xgl">
<td class="hd"><label>Masking</label></td>
<td>
<div class="fi">
<label for="MASK_CHAR"> Character: </label>
<select name="MASK_CHAR" id="MASK_CHAR"  class="reset" defVal="2">
<option value="0"  >X for protein, n for nucleotide</option>
<option value="2" selected="selected" >Lower Case</option>
</select>
<label for="MASK_COLOR"> Color:</label>
<select name="MASK_COLOR" id="MASK_COLOR" class="reset" defVal="1">
<option value="0"  >Black
</option>

<option value="1" selected="selected" >Grey
</option>

<option value="2"  >Red
</option>

</select>
<a class="helplink hiding" title="Alignments masking help" id="maskingHelp" href="#"><span>[?]</span></a>
<ul toggle="maskingHelp" class="helpbox hidden" id="hlp4">
<li>Masking Character: Display masked (filtered) sequence regions as lower-case or as specific letters (N for nucleotide, P for protein).
</li>
<li>Masking Color: Display masked sequence regions in the given color.</li>
</ul>
</div>
</td>
</tr>


<tr class="paramSet xgl">
<td class="hd"><label>Limit results</label></td>
<td>
<div class="fi">
<label for="FRM_DESCRIPTIONS">Descriptions:</label>
<select name="DESCRIPTIONS" id="FRM_DESCRIPTIONS" class="reset" defVal="100">
<option value="0"      >0</option>
<option value="10"     >10</option>
<option value="50"     >50</option>
<option value="100"   selected="selected" >100</option>
<option value="250"    >250</option>
<option value="500"    >500</option>
<option value="1000"   >1000</option>
<option value="5000"   >5000</option>
<option value="10000"  >10000</option>
<option value="20000"  >20000</option>
</select>

<label for="FRM_NUM_OVERVIEW">Graphical overview:</label>
<select name="NUM_OVERVIEW" id="FRM_NUM_OVERVIEW" class="reset" defVal="100">
<option value="0"     >0</option>
<option value="10"    >10</option>
<option value="50"    >50</option>
<option value="100"  selected="selected" >100</option>
<option value="250"   >250</option>
<option value="500"  >500</option>
<option value="1000"  >1000</option>
</select>

<label for="FRM_ALIGNMENTS">Alignments:</label>
<select name="ALIGNMENTS" id="FRM_ALIGNMENTS" class="reset" defVal="100">
<option value="0"      >0</option>
<option value="10"     >10</option>
<option value="50"     >50</option>
<option value="100"   selected="selected" >100</option>
<option value="250"    >250</option>
<option value="500"    >500</option>
<option value="1000"   >1000</option>
<option value="5000"   >5000</option>
<option value="10000"  >10000</option>
<option value="20000"  >20000</option>
</select>
<a class="helplink hiding" title="Limit number of descriptions/alignments help" id="numHelp" href="#"><span>[?]</span></a>
<ul toggle="numHelp" class="helpbox hidden" id="hlp5">
<li>Descriptions: Show short descriptions for up to the given number of  sequences.</li> 
<li>Alignments:  Show alignments for up to the given number of sequences, in order of statistical significance.</li>
</ul>
</div>
</td>
</tr>

<tr class="paramSet odd xgl">
<td class="hd"></td>
<td>
<div class="">
<label for="qorganism">Organism</label>
<span class="instr">Type common name, binomial, taxid, or group name. Only 20 top taxa will be shown.</span><br>
<input name="FORMAT_ORGANISM" size="55"  id="qorganism" sgDict="taxids_sg" value="" sgStyle="SG_green"  sgDelay="50" class="reset" />
<input type="checkbox" name="FORMAT_ORG_EXCLUDE"  class="oExclR cb" id="orgExcl"/>        
<input type="hidden" value = "1" name="FORMAT_NUM_ORG" id="numOrg" />
<label for="orgExcl" class="right">Exclude</label>
<a href="#" title="Add organism" id="addOrg"><img border="0" src="css/images/addOrg.jpg" id="addOrgIm"   alt="Add organism"  mouseovImg="css/images/addOrgOver.jpg" mouseoutImg="css/images/addOrg.jpg" mousedownImg="css/images/addOrgDown.jpg" mouseupImg="css/images/addOrgOver.jpg"  /></a>
<div id="orgs">

</div>
<div class="fi">
<a class="helplink hiding" title="Limit results by organism help" id="organismHelp" href="#"><span>[?]</span></a>
<p toggle="organismHelp" class="helpbox hidden" id="hlp6">
Show only sequences from the given organism.
</p>
</div>
</div>
</td>
</tr>

<tr class="paramSet xgl">
<td class="hd"></td>
<td>
<div class="fi">
<label for="FORMAT_EQ_TEXT">Entrez query:</label>
<input name="FORMAT_EQ_TEXT" id="FORMAT_EQ_TEXT" size="60" type="text" value="" class="reset" />
<a class="helplink hiding" title="Limit results by Entrez query help" id="entrezHelp" href="#"><span>[?]</span></a>
<p toggle="entrezHelp" class="helpbox hidden" id="hlp7">
Show only those sequences that match the given Entrez query.
<a href="http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#limit_result" target="helpWin" title="Additional limit results by Entrez query help"  target="helpWin">more...</a>
</p>
</div>
</td>
</tr>

  
<tr class="paramSet odd xgl">
<td class="hd"></td>
<td>
<div class="fi">
<label for="EXPECT_LOW">Expect Min:</label> <input name="EXPECT_LOW" id="EXPECT_LOW" size="10" type="text" value="" class="reset"/>
<label for="EXPECT_HIGH">Expect Max:</label> <input name="EXPECT_HIGH" id="EXPECT_HIGH" size="10" type="text" value="" class="reset" />
<a class="helplink hiding" title="Limit results by expect value range help" id="expectHelp" href="#"><span>[?]</span></a>
<p toggle="expectHelp" class="helpbox hidden" id="hlp8">
Show only sequences with expect values in the given range.
<a href="http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#expect_range" target="helpWin" title="Additional limit results by expect value range help">more...</a>
</p>
</div>
</td>
</tr>
<tr class="paramSet xgl">
<td class="hd"></td>
<td>
 <div class="fi">
<label for="PERC_IDENT_LOW">Percent Identity Min:</label> <input name="PERC_IDENT_LOW" id="PERC_IDENT_LOW" size="10" type="text" value="" class="reset"/>
<label for="PERC_IDENT_HIGH">Percent Identity Max:</label> <input name="PERC_IDENT_HIGH" id="PERC_IDENT_HIGH" size="10" type="text" value="" class="reset" />
<a class="helplink hiding" title="Limit results by percent identity range help" id="percIdentHelp" href="#"><span>[?]</span></a>
<p toggle="percIdentHelp" class="helpbox hidden" id="hlp10">
 Show only sequences with percent identity values in the given range.  
</p>
</div>
</td>
</tr>      
<tr class="psiBlast odd paramSet xgl">
<td class="hd"><label>Format for</label></td>
<td>
<div class="fi">
<input name="RUN_PSIBLAST_FORM" id="RUN_PSIBLAST" type="checkbox" class="cb psiBlast"  />
<label class="rb psiBlast" for="RUN_PSIBLAST">PSI-BLAST</label>
<label for="I_THRESH">with inclusion threshold:</label>
<input name="I_THRESH" id="I_THRESH" size="10" type="text" value="" defVal="0.005" />
<a class="helplink hiding" title="PSI BLAST formatting help" id="psiHelp" href="#"><span>[?]</span></a>
<ul toggle="psiHelp" class="helpbox hidden" id="hlp9">
<li>Format for PSI-BLAST: The Position-Specific Iterated BLAST (PSI-BLAST) program performs iterative searches with a protein query, 
in which sequences found in one round of search are used to build a custom score model for the next round.
<a href="http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#psiblast" target="helpWin" title="Additional PSI BLAST formatting help">more...</a>
</li>  
<li>Inclusion Threshold: This sets the statistical significance threshold for including a sequence in the model used 
by PSI-BLAST to create the PSSM on the next iteration.</li> 
</ul>
</div>
</td>
</tr>
</table>
</dd>
</dl>

<input name="RID" value="HZ50WJZT01N" type="hidden" />
<input name="CDD_RID" value="" type="hidden" />
<input name="CDD_SEARCH_STATE" type="hidden" value="" />

<input name="STEP_NUMBER" value="" id="stepNumber" type="hidden" />
<input name="CMD" value="Get" type="hidden" />
<input name="FORMAT_EQ_OP" value="AND" type="hidden" />
<input name="RESULTS_PAGE_TARGET" type="hidden" id="resPageTarget" value="Blast_Results_for_1285752802" />
<input name="QUERY_INFO" type="hidden" value="gi|555  (624 letters)" />                   		
<input name="ENTREZ_QUERY" type="hidden" value="" />
<input name="QUERY_INDEX" type="hidden" value="0"/>
<!-- Those params are set in the template (blastn.dat, blastp.dat etc. -->
<input name="BLAST_PROGRAMS" type="hidden" value="blastn"/>
<input name="PAGE" type="hidden" value="Nucleotides"/>
<input name="PROGRAM" type="hidden" value="blastn"/>
<input name="MEGABLAST" type="hidden" value="" />
<input name="RUN_PSIBLAST" type="hidden" value="" />
<input name="BLAST_SPEC" id="blastSpec" type="hidden" value=""/>


<input name="QUERY" type="hidden" value=""/>
<input name="JOB_TITLE" type="hidden" value="gi|555  (624 letters)"/>
<input name="QUERY_TO" type="hidden" value=""/>
<input name="QUERY_FROM" type="hidden" value=""/>
<input name="EQ_TEXT" type="hidden" value=""/>
<input name="ORGN" type="hidden" value=""/>
<input name="EQ_MENU" type="hidden" value=""/>
<input name="ORG_EXCLUDE" type="hidden" value=""/>
<input name="PHI_PATTERN" type="hidden" value=""/>
<input name="EXPECT" type="hidden" value="10"/>									
<input name="DATABASE" type="hidden" value="nr"/>
<input name="DB_GROUP" type="hidden" value=""/>
<input name="SUBGROUP_NAME" type="hidden" value=""/>

<input name="GENETIC_CODE" type="hidden" value=""/>
<input name="WORD_SIZE" type="hidden" value=""/>
<input name="MATCH_SCORES" type="hidden" value=""/>			
<input name="MATRIX_NAME" type="hidden" value=""/>				
<input name="GAPCOSTS" type="hidden" value=""/>
<input name="MAX_NUM_SEQ" id="maxNumSeq" type="hidden" value=""/>					
<input name="COMPOSITION_BASED_STATISTICS" type="hidden" value=""/>			
<input name="NEWWIN" type="hidden" value=""/>
<input name="SHORT_QUERY_ADJUST" type="hidden" value=""/>
<input name="FILTER" type="hidden" value="L;"/>
<input name="REPEATS" type="hidden" value=""/>
<input name="ID_FOR_PSSM" type="hidden" value=""/>
<input name="EXCLUDE_MODELS" type="hidden" value=""/>
<input name="EXCLUDE_SEQ_UNCULT" type="hidden" value=""/>
<input name="NUM_ORG" type="hidden" value = "1" />

<!-- PSSM -->
<input name="LCASE_MASK" type="hidden" value=""/>
<input name="TEMPLATE_TYPE" type="hidden" value=""/>
<input name="TEMPLATE_LENGTH" type="hidden" value=""/>
<input name="I_THRESH" type="hidden" value=""/>
<input name="PSI_PSEUDOCOUNT" type="hidden" value=""/>
<input name="HSP_RANGE_MAX" type="hidden" value=""/>



<input name="ADJUSTED_FOR_SHORT_QUERY" type="hidden" value=""/>
<input name="MIXED_QUERIES" type="hidden" value=""/>
<input name="MIXED_DATABASE" id="mixedDb" type="hidden" value=""/>

<!--QBlastInfoBegin
    RID = HZ50WJZT01N
    RTOE = 10
QBlastInfoEnd
-->
</form>		                              		
				
				</div><!-- /#content -->

        </div><!-- /#content-wrap -->

		    	
<div id="footer">
   <p id="orgns">
      <a href="http://www.ncbi.nlm.nih.gov/" title="National Center for Biotechnology Information">NCBI</a> |
      <a href="http://www.nlm.nih.gov/" title="National Library of Medicine">NLM</a> |
      <a href="http://www.nih.gov/" title="National Institutes of Health">NIH</a> |
      <a href="http://www.hhs.gov/" title="US Department of Health and Human Services">DHHS</a>
   </p>
   
   <p>
      <a href=''http://www.ncbi.nlm.nih.gov/About/disclaimer.html''
      title=''NCBI intellectual property statement''>Copyright</a> | 
      <a href=''http://www.ncbi.nlm.nih.gov/About/disclaimer.html#disclaimer''
      title=''About liability, endorsements, external links, pop-up advertisements''>Disclaimer</a> | 
      <a href=''http://www.nlm.nih.gov/privacy.html''
      title=''NLM privacy policy''>Privacy</a> | 
      <a href=''http://www.ncbi.nlm.nih.gov/About/accessibility.html''
      title=''About using NCBI resources with assistive technology''>Accessibility</a> |
      <a href=''http://www.ncbi.nlm.nih.gov/About/glance/contact_info.html''
      title=''How to get help, submit data, or provide feedback''>Contact</a> |
      <a href=''mailto:blast-help@ncbi.nlm.nih.gov''
      title=''How to get help, submit data, or provide feedback''>Send feedback</a>      
   </p>
</div>	
   </div><!--/#wrap-->
<script type="text/javascript" src="http://www.ncbi.nlm.nih.gov/coreweb/javascript/nsuggest/nsuggest_loader.js"></script>
<script type="text/javascript" src="http://blast.ncbi.nlm.nih.gov/portal/portal3rc.fcgi/rlib/js/InstrumentOmnitureBaseJS/InstrumentNCBIBaseJS/InstrumentPageStarterJS.js"></script>
</body>

</html>

 
'
]
