Class {
	#name : #BioNCBITests,
	#superclass : #BioAbstractTest,
	#instVars : [
		'filter'
	],
	#category : 'BioBlastTests-Core'
}

{ #category : #samples }
BioNCBITests >> giList1 [

	^ #('256041716' '256041695' '256041622' '256041566' '256041453' '256041384' '199589056' '126507448' '41079384' '70987496' '27451349' '27451347' '27451345' '27451317' '27451283' '297615950' '297615941' '264685146' '264685137' '264685134' '264685131' '264685130' '264685113' '264685107' '264685097' '264685080' '264685076' '264685074' '264685044' '264685043' '256041744' '256041733' '256041717' '256041701' '256041627' '256041406' '256041400' '238580183' '199589071' '199589063' '199589059' '198042600' '194595726' '156491116' '156491114' '156491110' '156491106' '156491093' '156491079' '166153871' '164454356' '164454347' '159034132' '159034129' '159034127' '159034126' '159034125' '159034124' '159034122' '159034121' '159034120' '159034119' '159034118' '159034113' '159034112' '159034111' '159034109' '159034108' '159034107' '159034106' '126013610' '126013603' '126013600' '126013585' '126013584' '126013578' '119514371' '85376006' '85375998' '94958748' '94958730' '94958729' '94958728' '94958607' '94958512' '94958474' '37791044' '37791025' '70987580' '50199376' '50199374' '58802544' '58802536' '58802535' '46404157' '46404154' '46404136' '46404135' '46404111' '46404108')
]

{ #category : #samples }
BioNCBITests >> queryBlastp01 [

	^ 'MSHEKNEASGYPEAQSWKSQEAMLGARTEVSRWRAVKNCLYRHLVKVLGEDWIFLLLLGALMALVSWAMD 
FIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEY 
LTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGI 
SCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL'
]

{ #category : #samples }
BioNCBITests >> resultBlastp01 [

	^ '<?xml version="1.0"?>
<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">
<BlastOutput>
  <BlastOutput_program>blastp</BlastOutput_program>
  <BlastOutput_version>BLASTP 2.2.25+</BlastOutput_version>
  <BlastOutput_reference>Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&amp;auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), &quot;Gapped BLAST and PSI-BLAST: a new generation of protein database search programs&quot;, Nucleic Acids Res. 25:3389-3402.</BlastOutput_reference>
  <BlastOutput_db>nr</BlastOutput_db>
  <BlastOutput_query-ID>2798</BlastOutput_query-ID>
  <BlastOutput_query-def>unnamed protein product</BlastOutput_query-def>
  <BlastOutput_query-len>280</BlastOutput_query-len>
  <BlastOutput_param>
    <Parameters>
      <Parameters_matrix>BLOSUM62</Parameters_matrix>
      <Parameters_expect>10</Parameters_expect>
      <Parameters_gap-open>11</Parameters_gap-open>
      <Parameters_gap-extend>1</Parameters_gap-extend>
      <Parameters_filter>F</Parameters_filter>
    </Parameters>
  </BlastOutput_param>
<BlastOutput_iterations>
<Iteration>
  <Iteration_iter-num>1</Iteration_iter-num>
  <Iteration_query-ID>2798</Iteration_query-ID>
  <Iteration_query-def>unnamed protein product</Iteration_query-def>
  <Iteration_query-len>280</Iteration_query-len>
<Iteration_hits>
<Hit>
  <Hit_num>1</Hit_num>
  <Hit_id>gi|116414|sp|P21564.1|CICH_TORMA</Hit_id>
  <Hit_def>RecName: Full=Chloride channel protein; AltName: Full=ClC-0 &gt;gi|64425|emb|CAA40078.1| chloride channel protein [Torpedo marmorata]</Hit_def>
  <Hit_accession>P21564</Hit_accession>
  <Hit_len>805</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>578.556</Hsp_bit-score>
      <Hsp_score>1490</Hsp_score>
      <Hsp_evalue>0</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>280</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>280</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>280</Hsp_identity>
      <Hsp_positive>280</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>280</Hsp_align-len>
      <Hsp_qseq>MSHEKNEASGYPEAQSWKSQEAMLGARTEVSRWRAVKNCLYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_qseq>
      <Hsp_hseq>MSHEKNEASGYPEAQSWKSQEAMLGARTEVSRWRAVKNCLYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_hseq>
      <Hsp_midline>MSHEKNEASGYPEAQSWKSQEAMLGARTEVSRWRAVKNCLYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>2</Hit_num>
  <Hit_id>gi|227369|prf||1702364A</Hit_id>
  <Hit_def>Cl channel</Hit_def>
  <Hit_accession>1702364A</Hit_accession>
  <Hit_len>805</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>571.237</Hsp_bit-score>
      <Hsp_score>1471</Hsp_score>
      <Hsp_evalue>0</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>280</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>280</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>277</Hsp_identity>
      <Hsp_positive>277</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>280</Hsp_align-len>
      <Hsp_qseq>MSHEKNEASGYPEAQSWKSQEAMLGARTEVSRWRAVKNCLYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_qseq>
      <Hsp_hseq>MSHEKNEASGYPEAQSWKSQEAMLGARTEVSRWRAVKNCLYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEQNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAQFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRQFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_hseq>
      <Hsp_midline>MSHEKNEASGYPEAQSWKSQEAMLGARTEVSRWRAVKNCLYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVE NIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSA FPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWR FLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>3</Hit_num>
  <Hit_id>gi|544028|sp|P35522.3|CICH_TORCA</Hit_id>
  <Hit_def>RecName: Full=Chloride channel protein; AltName: Full=ClC-0 &gt;gi|64406|emb|CAA42960.1| Voltage-gated choride channel [Torpedo californica]</Hit_def>
  <Hit_accession>P35522</Hit_accession>
  <Hit_len>810</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>547.354</Hsp_bit-score>
      <Hsp_score>1409</Hsp_score>
      <Hsp_evalue>0</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>280</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>280</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>273</Hsp_identity>
      <Hsp_positive>277</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>280</Hsp_align-len>
      <Hsp_qseq>MSHEKNEASGYPEAQSWKSQEAMLGARTEVSRWRAVKNCLYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_qseq>
      <Hsp_hseq>MSHEKNEASGNPEAQSWKAQEAMLGVKTEVSRWRAVKNCLYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFAMVEGNLGLQYLVWVCYPLILILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_hseq>
      <Hsp_midline>MSHEKNEASG PEAQSWK+QEAMLG +TEVSRWRAVKNCLYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFA+VEGN+GLQYLVWVCYPL LILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>4</Hit_num>
  <Hit_id>gi|118083358|ref|XP_425521.2|</Hit_id>
  <Hit_def>PREDICTED: similar to skeletal muscle chloride channel ClC-1 [Gallus gallus]</Hit_def>
  <Hit_accession>XP_425521</Hit_accession>
  <Hit_len>996</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>344.354</Hsp_bit-score>
      <Hsp_score>882</Hsp_score>
      <Hsp_evalue>5.45833e-109</Hsp_evalue>
      <Hsp_query-from>4</Hsp_query-from>
      <Hsp_query-to>280</Hsp_query-to>
      <Hsp_hit-from>71</Hsp_hit-from>
      <Hsp_hit-to>353</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>167</Hsp_identity>
      <Hsp_positive>210</Hsp_positive>
      <Hsp_gaps>8</Hsp_gaps>
      <Hsp_align-len>284</Hsp_align-len>
      <Hsp_qseq>EKNEASGYPEAQSWKSQEAMLGARTEVS----RWRAVKNC---LYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_qseq>
      <Hsp_hseq>EKEAAKLLNANQAQKNNERPLKRESQVEIKEERYSKCQDCARHLQKYVTRKLGEDWIFLVLLGLVMALVSWGMDYASAKSLQAYKWMYREVHPNVPLQYLVWVTYPLVLILFAAIFCHLVSPQAVGSGIPELKTIMRGVVLKEYLTLQAFVAKVVGLTAGLGSGMPVGKEGPFVHIASICAAVLSKFMSIFCGVYEQPYYY-TDVLTVGCAVGVGCCFGTPLGGVLFSIEVTSTYFAVRNYWRGFFAATFSAFIFRVLAVWNKDAVTITALFRTNFRMDFPFDL</Hsp_hseq>
      <Hsp_midline>EK  A      Q+ K+ E  L   ++V     R+   ++C   L +++ + LGEDWIFL+LLG +MALVSW MD+  ++ L+ YK+++  V  N+ LQYLVWV YPL LILF+++FC +VSPQAVGSGIPELKTI+RG VL EYLTL+ FVAK VGLT  L +G P+GKEGPFVHIASICA +L++ +    G  E+PYY   D+LTVGCA+G+ CCFGTPL GVLFSIEVT ++F VR+YWRGF    FSAFIFRVL+VW KD VT+TALF+TNFR D PFDL</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>5</Hit_num>
  <Hit_id>gi|326912741|ref|XP_003202705.1|</Hit_id>
  <Hit_def>PREDICTED: chloride channel protein 1-like [Meleagris gallopavo]</Hit_def>
  <Hit_accession>XP_003202705</Hit_accession>
  <Hit_len>990</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>343.199</Hsp_bit-score>
      <Hsp_score>879</Hsp_score>
      <Hsp_evalue>1.8257e-108</Hsp_evalue>
      <Hsp_query-from>4</Hsp_query-from>
      <Hsp_query-to>280</Hsp_query-to>
      <Hsp_hit-from>77</Hsp_hit-from>
      <Hsp_hit-to>359</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>165</Hsp_identity>
      <Hsp_positive>210</Hsp_positive>
      <Hsp_gaps>8</Hsp_gaps>
      <Hsp_align-len>284</Hsp_align-len>
      <Hsp_qseq>EKNEASGYPEAQSWKSQEAMLGARTEVS----RWRAVKNC---LYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_qseq>
      <Hsp_hseq>EKEAAKLLDTNQAQKNNERPLKRESQVEIKEERYSKCQDCARRIQKYVTRKLGEDWIFLVLLGLVMALVSWGMDYASAKSLQAYKWMYRELHPNVPLQYLVWVAYPLVLILFAAIFCHLVSPQAVGSGIPELKTIMRGVVLKEYLTLQAFVAKVVGLTAGLGSGMPVGKEGPFVHIASICAAVLSKFMSIFCGVYEQPYYY-TDVLTVGCAVGVGCCFGTPLGGVLFSIEVTSTYFAVRNYWRGFFAATFSAFIFRVLAVWNKDAVTITALFRTNFRMDFPFDL</Hsp_hseq>
      <Hsp_midline>EK  A      Q+ K+ E  L   ++V     R+   ++C   + +++ + LGEDWIFL+LLG +MALVSW MD+  ++ L+ YK+++  +  N+ LQYLVWV YPL LILF+++FC +VSPQAVGSGIPELKTI+RG VL EYLTL+ FVAK VGLT  L +G P+GKEGPFVHIASICA +L++ +    G  E+PYY   D+LTVGCA+G+ CCFGTPL GVLFSIEVT ++F VR+YWRGF    FSAFIFRVL+VW KD VT+TALF+TNFR D PFDL</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>6</Hit_num>
  <Hit_id>gi|348530520|ref|XP_003452759.1|</Hit_id>
  <Hit_def>PREDICTED: chloride channel protein 1 [Oreochromis niloticus]</Hit_def>
  <Hit_accession>XP_003452759</Hit_accession>
  <Hit_len>1030</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>342.043</Hsp_bit-score>
      <Hsp_score>876</Hsp_score>
      <Hsp_evalue>9.54186e-108</Hsp_evalue>
      <Hsp_query-from>2</Hsp_query-from>
      <Hsp_query-to>280</Hsp_query-to>
      <Hsp_hit-from>80</Hsp_hit-from>
      <Hsp_hit-to>363</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>167</Hsp_identity>
      <Hsp_positive>204</Hsp_positive>
      <Hsp_gaps>7</Hsp_gaps>
      <Hsp_align-len>285</Hsp_align-len>
      <Hsp_qseq>SHEKNEASGYPEAQSWKSQEAMLGARTEVSRWRAVKNC------LYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_qseq>
      <Hsp_hseq>SRQRNRRQSNMETDAADEQTAEPDLTSSVKKKRSYSKCRDCIARVQRFLVTRLGEDWIFLVLLGITMALVSWTMDYASAKSLQAYKWIHGELRGNIPLQYLAWVSYPLMFILFSSLFCHLVSPQAIGSGIPELKTILRGVVLKEYLTLKAFIAKVIGLTAALGSGMPVGKEGPFVHIASICAAVLSRFMSFFSGVYQNP-YCYTDILTVGCAVGVGCCFGTPLGGVLFSIEVTSTYFAVRNYWRGYFAATFSAFIFRVLSVFNKDAVTITALFRTNFRMDFPFDL</Hsp_hseq>
      <Hsp_midline>S ++N      E  +   Q A     + V + R+   C      + R LV  LGEDWIFL+LLG  MALVSW MD+  ++ L+ YK++   + GNI LQYL WV YPL  ILFSSLFC +VSPQA+GSGIPELKTI+RG VL EYLTL+ F+AK +GLT AL +G P+GKEGPFVHIASICA +L++ + F SG  + P Y   DILTVGCA+G+ CCFGTPL GVLFSIEVT ++F VR+YWRG+    FSAFIFRVLSV+ KD VT+TALF+TNFR D PFDL</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>7</Hit_num>
  <Hit_id>gi|130498679|ref|NP_001076379.1|</Hit_id>
  <Hit_def>chloride channel 1, skeletal muscle [Danio rerio] &gt;gi|94733984|emb|CAK05174.1| novel protein similar to vertebrate voltage gated chloride channel family [Danio rerio]</Hit_def>
  <Hit_accession>NP_001076379</Hit_accession>
  <Hit_len>945</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>336.65</Hsp_bit-score>
      <Hsp_score>862</Hsp_score>
      <Hsp_evalue>2.01112e-106</Hsp_evalue>
      <Hsp_query-from>13</Hsp_query-from>
      <Hsp_query-to>280</Hsp_query-to>
      <Hsp_hit-from>21</Hsp_hit-from>
      <Hsp_hit-to>287</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>162</Hsp_identity>
      <Hsp_positive>201</Hsp_positive>
      <Hsp_gaps>1</Hsp_gaps>
      <Hsp_align-len>268</Hsp_align-len>
      <Hsp_qseq>EAQSWKSQEAMLGARTEVSRWRAVKNCLYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_qseq>
      <Hsp_hseq>EAEEEQGHTSSFKKRRSYSKCRDCVARVQKFLVSKLGEDWIFLVLLGITMALVSWSMDYASAKSLQAYKWFYGELRGNIPLQYLVWVSYPMVLILFASLFCHLVAPQAIGSGIPEMKTILRGVVLKEYLTLKAFVAKVVGLTAGLGSGMPVGKEGPFVHIASICAAVLSKFMSFFSGVYQSPYGY-TDILTVGCAVGVGCCFGTPLGGVLFSIEVTSTYFAVRNYWRGYFAATFSAFIFRVLSVFNKDAVTITALFRTNFRMDFPFDL</Hsp_hseq>
      <Hsp_midline>EA+  +   +    R   S+ R     + + LV  LGEDWIFL+LLG  MALVSW+MD+  ++ L+ YK+ +  + GNI LQYLVWV YP+ LILF+SLFC +V+PQA+GSGIPE+KTI+RG VL EYLTL+ FVAK VGLT  L +G P+GKEGPFVHIASICA +L++ + F SG  + PY    DILTVGCA+G+ CCFGTPL GVLFSIEVT ++F VR+YWRG+    FSAFIFRVLSV+ KD VT+TALF+TNFR D PFDL</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>8</Hit_num>
  <Hit_id>gi|292622140|ref|XP_695866.3|</Hit_id>
  <Hit_def>PREDICTED: chloride channel protein 1-like [Danio rerio]</Hit_def>
  <Hit_accession>XP_695866</Hit_accession>
  <Hit_len>879</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>333.569</Hsp_bit-score>
      <Hsp_score>854</Hsp_score>
      <Hsp_evalue>8.01893e-106</Hsp_evalue>
      <Hsp_query-from>40</Hsp_query-from>
      <Hsp_query-to>280</Hsp_query-to>
      <Hsp_hit-from>30</Hsp_hit-from>
      <Hsp_hit-to>269</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>152</Hsp_identity>
      <Hsp_positive>195</Hsp_positive>
      <Hsp_gaps>1</Hsp_gaps>
      <Hsp_align-len>241</Hsp_align-len>
      <Hsp_qseq>LYRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_qseq>
      <Hsp_hseq>VQRYIVTKLGEDWIFLVLLGLTMALVSWSMDYASAKSIQAYKWMYGELKGNVALQYLAWVSYPIILVVFASLFCHLVAPQAIGSGIPELKTILRGVVLKEYLTLKAFVAKVIGLTAGLGSGMPIGKEGPFVHIASICAAVLSRVMSIFTGVYENPYGY-TDILTVGCAVGVGCCFGTPLGGVLFSIEVTSTYFAVRNYWRGYFAATFSAFIFRVLSVWNKDSVTITALFRTNFRMDFPFDL</Hsp_hseq>
      <Hsp_midline>+ R++V  LGEDWIFL+LLG  MALVSW+MD+  ++ ++ YK+++  ++GN+ LQYL WV YP+ L++F+SLFC +V+PQA+GSGIPELKTI+RG VL EYLTL+ FVAK +GLT  L +G P+GKEGPFVHIASICA +L++++   +G  E PY    DILTVGCA+G+ CCFGTPL GVLFSIEVT ++F VR+YWRG+    FSAFIFRVLSVW KD+VT+TALF+TNFR D PFDL</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>9</Hit_num>
  <Hit_id>gi|47221590|emb|CAF97855.1|</Hit_id>
  <Hit_def>unnamed protein product [Tetraodon nigroviridis]</Hit_def>
  <Hit_accession>CAF97855</Hit_accession>
  <Hit_len>682</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>328.176</Hsp_bit-score>
      <Hsp_score>840</Hsp_score>
      <Hsp_evalue>1.33409e-105</Hsp_evalue>
      <Hsp_query-from>37</Hsp_query-from>
      <Hsp_query-to>280</Hsp_query-to>
      <Hsp_hit-from>135</Hsp_hit-from>
      <Hsp_hit-to>380</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>152</Hsp_identity>
      <Hsp_positive>194</Hsp_positive>
      <Hsp_gaps>4</Hsp_gaps>
      <Hsp_align-len>247</Hsp_align-len>
      <Hsp_qseq>KNCL---YRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_qseq>
      <Hsp_hseq>RDCLARVRRSIVTKMGEDWIFLVLLGLTMALVSWSMDYASAKSLQAYKWIYGELKGNVPSQYLAWVFYPMILVMFASFFCHLISPQAIGSGIPELKTILRGVVLKEYLTLKAFIAKVIGLTASLGSGMPVGKEGPFVHIASICAAVLSRFMSIFSGAYENPYGY-TDILTVGCAVGVGCCFGTPLGGVLFSIEVTSTYFAVRNYWRGYFAATFSAFIFRVLSVWNKDAVTITALFKTNFRMEFPFDL</Hsp_hseq>
      <Hsp_midline>++CL    R +V  +GEDWIFL+LLG  MALVSW+MD+  ++ L+ YK+++  ++GN+  QYL WV YP+ L++F+S FC ++SPQA+GSGIPELKTI+RG VL EYLTL+ F+AK +GLT +L +G P+GKEGPFVHIASICA +L++ +   SG  E PY    DILTVGCA+G+ CCFGTPL GVLFSIEVT ++F VR+YWRG+    FSAFIFRVLSVW KD VT+TALFKTNFR + PFDL</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
<Hit>
  <Hit_num>10</Hit_num>
  <Hit_id>gi|348526341|ref|XP_003450678.1|</Hit_id>
  <Hit_def>PREDICTED: chloride channel protein 1-like [Oreochromis niloticus]</Hit_def>
  <Hit_accession>XP_003450678</Hit_accession>
  <Hit_len>999</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>333.569</Hsp_bit-score>
      <Hsp_score>854</Hsp_score>
      <Hsp_evalue>7.66657e-105</Hsp_evalue>
      <Hsp_query-from>37</Hsp_query-from>
      <Hsp_query-to>280</Hsp_query-to>
      <Hsp_hit-from>105</Hsp_hit-from>
      <Hsp_hit-to>350</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>156</Hsp_identity>
      <Hsp_positive>194</Hsp_positive>
      <Hsp_gaps>4</Hsp_gaps>
      <Hsp_align-len>247</Hsp_align-len>
      <Hsp_qseq>KNCL---YRHLVKVLGEDWIFLLLLGALMALVSWAMDFIGSRGLRFYKYLFALVEGNIGLQYLVWVCYPLALILFSSLFCQIVSPQAVGSGIPELKTIIRGAVLHEYLTLRTFVAKTVGLTVALSAGFPLGKEGPFVHIASICATLLNQLLCFISGRREEPYYLRADILTVGCALGISCCFGTPLAGVLFSIEVTCSHFGVRSYWRGFLGGAFSAFIFRVLSVWVKDTVTLTALFKTNFRGDIPFDL</Hsp_qseq>
      <Hsp_hseq>QDCLARVRRYIVTKMGEDWIFLVLLGLTMALVSWSMDYASAKSLQAYKWVHGELKGNVPLQYLAWVTYPMILVTFASLFCHLVSPQAIGSGIPELKTILRGVVLKEYLTLKAFIAKVIGLTAGLGSGMPVGKEGPFVHIASICAAVLSRFMSIFSGVYENPYGY-TDILTVGCAVGVGCCFGTPLGGVLFSIEVTSTYFAVRNYWRGYFAATFSAFIFRVLSVWNKDAVTITALFKTNFRMDFPFDL</Hsp_hseq>
      <Hsp_midline>++CL    R++V  +GEDWIFL+LLG  MALVSW+MD+  ++ L+ YK++   ++GN+ LQYL WV YP+ L+ F+SLFC +VSPQA+GSGIPELKTI+RG VL EYLTL+ F+AK +GLT  L +G P+GKEGPFVHIASICA +L++ +   SG  E PY    DILTVGCA+G+ CCFGTPL GVLFSIEVT ++F VR+YWRG+    FSAFIFRVLSVW KD VT+TALFKTNFR D PFDL</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
</Iteration_hits>
  <Iteration_stat>
    <Statistics>
      <Statistics_db-num>15670863</Statistics_db-num>
      <Statistics_db-len>1092787761</Statistics_db-len>
      <Statistics_hsp-len>0</Statistics_hsp-len>
      <Statistics_eff-space>0</Statistics_eff-space>
      <Statistics_kappa>0.041</Statistics_kappa>
      <Statistics_lambda>0.267</Statistics_lambda>
      <Statistics_entropy>0.14</Statistics_entropy>
    </Statistics>
  </Iteration_stat>
</Iteration>
</BlastOutput_iterations>
</BlastOutput>
'
]
