"
Represents a substitution (scoring) matrix for sequence alignment. Instance Variables: name matrix gapOpenPenalty gapExtendPenalty
"
Class {
	#name : 'BioSubstitutionMatrix',
	#superclass : 'Object',
	#instVars : [
		'name',
		'matrix',
		'gapOpenPenalty',
		'gapExtendPenalty'
	],
	#category : 'BioTools-Align',
	#package : 'BioTools',
	#tag : 'Align'
}

{ #category : 'accessing' }
BioSubstitutionMatrix class >> blosum62 [

	^ self new
		  name: 'BLOSUM62';
		  matrix: (Dictionary newFromPairs:
					   { 'AA'. 4. 'AR'. -1. 'AN'. -2. 'AD'. -2. 'AC'. 0. 'AQ'. -1. 'AE'.
					   -1. 'AG'. 0. 'AH'. -2. 'AI'. -1. 'AL'. -1. 'AK'. -1. 'AM'. -1.
					   'AF'. -2. 'AP'. -1. 'AS'. 1. 'AT'. 0. 'AW'. -3. 'AY'. -2. 'AV'.
					   0. 'RA'. -1. 'RR'. 5. 'RN'. 0. 'RD'. -2. 'RC'. -3. 'RQ'. 1. 'RE'.
					   0. 'RG'. -2. 'RH'. 0. 'RI'. -3. 'RL'. -2. 'RK'. 2. 'RM'. -1. 'RF'.
					   -3. 'RP'. -2. 'RS'. -1. 'RT'. -1. 'RW'. -3. 'RY'. -2. 'RV'.
					   -3. 'NA'. -2. 'NR'. 0. 'NN'. 6. 'ND'. 1. 'NC'. -3. 'NQ'. 0. 'NE'.
					   0. 'NG'. 0. 'NH'. 1. 'NI'. -3. 'NL'. -3. 'NK'. 0. 'NM'. -2. 'NF'.
					   -3. 'NP'. -2. 'NS'. 1. 'NT'. 0. 'NW'. -4. 'NY'. -2. 'NV'. -3.
					   'DA'. -2. 'DR'. -2. 'DN'. 1. 'DD'. 6. 'DC'. -3. 'DQ'. 0. 'DE'.
					   2. 'DG'. -1. 'DH'. -1. 'DI'. -3. 'DL'. -4. 'DK'. -1. 'DM'. -3.
					   'DF'. -3. 'DP'. -1. 'DS'. 0. 'DT'. -1. 'DW'. -4. 'DY'. -3. 'DV'.
					   -3. 'CA'. 0. 'CR'. -3. 'CN'. -3. 'CD'. -3. 'CC'. 9. 'CQ'. -3.
					   'CE'. -4. 'CG'. -3. 'CH'. -3. 'CI'. -1. 'CL'. -1. 'CK'. -3. 'CM'.
					   -1. 'CF'. -2. 'CP'. -3. 'CS'. -1. 'CT'. -1. 'CW'. -2. 'CY'.
					   -2. 'CV'. -1. 'QA'. -1. 'QR'. 1. 'QN'. 0. 'QD'. 0. 'QC'. -3. 'QQ'.
					   5. 'QE'. 2. 'QG'. -2. 'QH'. 0. 'QI'. -3. 'QL'. -2. 'QK'. 1. 'QM'.
					   0. 'QF'. -3. 'QP'. -1. 'QS'. 0. 'QT'. -1. 'QW'. -2. 'QY'. -1.
					   'QV'. -2. 'EA'. -1. 'ER'. 0. 'EN'. 0. 'ED'. 2. 'EC'. -4. 'EQ'.
					   2. 'EE'. 5. 'EG'. -2. 'EH'. 0. 'EI'. -3. 'EL'. -3. 'EK'. 1. 'EM'.
					   -2. 'EF'. -3. 'EP'. -1. 'ES'. 0. 'ET'. -1. 'EW'. -3. 'EY'. -2.
					   'EV'. -2. 'GA'. 0. 'GR'. -2. 'GN'. 0. 'GD'. -1. 'GC'. -3. 'GQ'.
					   -2. 'GE'. -2. 'GG'. 6. 'GH'. -2. 'GI'. -4. 'GL'. -4. 'GK'. -2.
					   'GM'. -3. 'GF'. -3. 'GP'. -2. 'GS'. 0. 'GT'. -2. 'GW'. -2. 'GY'.
					   -3. 'GV'. -3. 'HA'. -2. 'HR'. 0. 'HN'. 1. 'HD'. -1. 'HC'. -3.
					   'HQ'. 0. 'HE'. 0. 'HG'. -2. 'HH'. 8. 'HI'. -3. 'HL'. -3. 'HK'.
					   -1. 'HM'. -2. 'HF'. -1. 'HP'. -2. 'HS'. -1. 'HT'. -2. 'HW'.
					   -2. 'HY'. 2. 'HV'. -3. 'IA'. -1. 'IR'. -3. 'IN'. -3. 'ID'. -3.
					   'IC'. -1. 'IQ'. -3. 'IE'. -3. 'IG'. -4. 'IH'. -3. 'II'. 4. 'IL'.
					   2. 'IK'. -3. 'IM'. 1. 'IF'. 0. 'IP'. -3. 'IS'. -2. 'IT'. -1. 'IW'.
					   -3. 'IY'. -1. 'IV'. 3. 'LA'. -1. 'LR'. -2. 'LN'. -3. 'LD'. -4.
					   'LC'. -1. 'LQ'. -2. 'LE'. -3. 'LG'. -4. 'LH'. -3. 'LI'. 2. 'LL'.
					   4. 'LK'. -2. 'LM'. 2. 'LF'. 0. 'LP'. -3. 'LS'. -2. 'LT'. -1. 'LW'.
					   -2. 'LY'. -1. 'LV'. 1. 'KA'. -1. 'KR'. 2. 'KN'. 0. 'KD'. -1. 'KC'.
					   -3. 'KQ'. 1. 'KE'. 1. 'KG'. -2. 'KH'. -1. 'KI'. -3. 'KL'. -2.
					   'KK'. 5. 'KM'. -1. 'KF'. -3. 'KP'. -1. 'KS'. 0. 'KT'. -1. 'KW'.
					   -3. 'KY'. -2. 'KV'. -2. 'MA'. -1. 'MR'. -1. 'MN'. -2. 'MD'.
					   -3. 'MC'. -1. 'MQ'. 0. 'ME'. -2. 'MG'. -3. 'MH'. -2. 'MI'. 1. 'ML'.
					   2. 'MK'. -1. 'MM'. 5. 'MF'. 0. 'MP'. -2. 'MS'. -1. 'MT'. -1. 'MW'.
					   -1. 'MY'. -1. 'MV'. 1. 'FA'. -2. 'FR'. -3. 'FN'. -3. 'FD'. -3.
					   'FC'. -2. 'FQ'. -3. 'FE'. -3. 'FG'. -3. 'FH'. -1. 'FI'. 0. 'FL'.
					   0. 'FK'. -3. 'FM'. 0. 'FF'. 6. 'FP'. -4. 'FS'. -2. 'FT'. -2. 'FW'.
					   1. 'FY'. 3. 'FV'. -1. 'PA'. -1. 'PR'. -2. 'PN'. -2. 'PD'. -1.
					   'PC'. -3. 'PQ'. -1. 'PE'. -1. 'PG'. -2. 'PH'. -2. 'PI'. -3. 'PL'.
					   -3. 'PK'. -1. 'PM'. -2. 'PF'. -4. 'PP'. 7. 'PS'. -1. 'PT'. -1.
					   'PW'. -4. 'PY'. -3. 'PV'. -2. 'SA'. 1. 'SR'. -1. 'SN'. 1. 'SD'.
					   0. 'SC'. -1. 'SQ'. 0. 'SE'. 0. 'SG'. 0. 'SH'. -1. 'SI'. -2. 'SL'.
					   -2. 'SK'. 0. 'SM'. -1. 'SF'. -2. 'SP'. -1. 'SS'. 4. 'ST'. 1. 'SW'.
					   -3. 'SY'. -2. 'SV'. -2. 'TA'. 0. 'TR'. -1. 'TN'. 0. 'TD'. -1.
					   'TC'. -1. 'TQ'. -1. 'TE'. -1. 'TG'. -2. 'TH'. -2. 'TI'. -1. 'TL'.
					   -1. 'TK'. -1. 'TM'. -1. 'TF'. -2. 'TP'. -1. 'TS'. 1. 'TT'. 5. 'TW'.
					   -2. 'TY'. -2. 'TV'. 0. 'WA'. -3. 'WR'. -3. 'WN'. -4. 'WD'. -4.
					   'WC'. -2. 'WQ'. -2. 'WE'. -3. 'WG'. -2. 'WH'. -2. 'WI'. -3. 'WL'.
					   -2. 'WK'. -3. 'WM'. -1. 'WF'. 1. 'WP'. -4. 'WS'. -3. 'WT'. -2.
					   'WW'. 11. 'WY'. 2. 'WV'. -3. 'YA'. -2. 'YR'. -2. 'YN'. -2. 'YD'.
					   -3. 'YC'. -2. 'YQ'. -1. 'YE'. -2. 'YG'. -3. 'YH'. 2. 'YI'. -1.
					   'YL'. -1. 'YK'. -2. 'YM'. -1. 'YF'. 3. 'YP'. -3. 'YS'. -2. 'YT'.
					   -2. 'YW'. 2. 'YY'. 7. 'YV'. -1. 'VA'. 0. 'VR'. -3. 'VN'. -3. 'VD'.
					   -3. 'VC'. -1. 'VQ'. -2. 'VE'. -2. 'VG'. -3. 'VH'. -3. 'VI'.
					   3. 'VL'. 1. 'VK'. -2. 'VM'. 1. 'VF'. -1. 'VP'. -2. 'VS'. -2. 'VT'.
					   0. 'VW'. -3. 'VY'. -1. 'VV'. 4 });
		  gapOpenPenalty: -11;
		  gapExtendPenalty: -1;
		  yourself
]

{ #category : 'accessing' }
BioSubstitutionMatrix class >> nucleotideDefault [

	^ self new
		  name: 'NUCLEOTIDE';
		  matrix: (Dictionary newFromPairs:
					   { 'AA'. 5. 'AC'. -4. 'AG'. -4. 'AT'. -4. 'AN'. -1. 'CA'. -4. 'CC'.
					   5. 'CG'. -4. 'CT'. -4. 'CN'. -1. 'GA'. -4. 'GC'. -4. 'GG'. 5. 'GT'.
					   -4. 'GN'. -1. 'TA'. -4. 'TC'. -4. 'TG'. -4. 'TT'. 5. 'TN'. -1.
					   'NA'. -1. 'NC'. -1. 'NG'. -1. 'NT'. -1. 'NN'. -1 });
		  gapOpenPenalty: -10;
		  gapExtendPenalty: -1;
		  yourself
]

{ #category : 'accessing' }
BioSubstitutionMatrix class >> pam250 [

	^ self new
		  name: 'PAM250';
		  matrix: (Dictionary newFromPairs:
					   { 'AA'. 2. 'AR'. -2. 'AN'. 0. 'AD'. 0. 'AC'. -2. 'AQ'. 0. 'AE'.
					   0. 'AG'. 1. 'AH'. -1. 'AI'. -1. 'AL'. -2. 'AK'. -1. 'AM'. -1.
					   'AF'. -3. 'AP'. 1. 'AS'. 1. 'AT'. 1. 'AW'. -6. 'AY'. -3. 'AV'.
					   0. 'RA'. -2. 'RR'. 6. 'RN'. 0. 'RD'. -1. 'RC'. -4. 'RQ'. 1. 'RE'.
					   -1. 'RG'. -3. 'RH'. 2. 'RI'. -2. 'RL'. -3. 'RK'. 3. 'RM'. 0. 'RF'.
					   -4. 'RP'. 0. 'RS'. 0. 'RT'. -1. 'RW'. 2. 'RY'. -4. 'RV'. -2. 'NA'.
					   0. 'NR'. 0. 'NN'. 2. 'ND'. 2. 'NC'. -4. 'NQ'. 1. 'NE'. 1. 'NG'.
					   0. 'NH'. 2. 'NI'. -2. 'NL'. -3. 'NK'. 1. 'NM'. -2. 'NF'. -3. 'NP'.
					   0. 'NS'. 1. 'NT'. 0. 'NW'. -4. 'NY'. -2. 'NV'. -2. 'DA'. 0. 'DR'.
					   -1. 'DN'. 2. 'DD'. 4. 'DC'. -5. 'DQ'. 2. 'DE'. 3. 'DG'. 1. 'DH'.
					   1. 'DI'. -2. 'DL'. -4. 'DK'. 0. 'DM'. -3. 'DF'. -6. 'DP'. -1.
					   'DS'. 0. 'DT'. 0. 'DW'. -7. 'DY'. -4. 'DV'. -2. 'CA'. -2. 'CR'.
					   -4. 'CN'. -4. 'CD'. -5. 'CC'. 12. 'CQ'. -4. 'CE'. -5. 'CG'.
					   -3. 'CH'. -3. 'CI'. -2. 'CL'. -6. 'CK'. -5. 'CM'. -5. 'CF'.
					   -4. 'CP'. -3. 'CS'. 0. 'CT'. -2. 'CW'. -8. 'CY'. 0. 'CV'. -2.
					   'QA'. 0. 'QR'. 1. 'QN'. 1. 'QD'. 2. 'QC'. -4. 'QQ'. 4. 'QE'.
					   2. 'QG'. -1. 'QH'. 3. 'QI'. -2. 'QL'. -2. 'QK'. 1. 'QM'. -1. 'QF'.
					   -5. 'QP'. 0. 'QS'. -1. 'QT'. -1. 'QW'. -5. 'QY'. -4. 'QV'. -2.
					   'EA'. 0. 'ER'. -1. 'EN'. 1. 'ED'. 3. 'EC'. -5. 'EQ'. 2. 'EE'.
					   4. 'EG'. 0. 'EH'. 1. 'EI'. -2. 'EL'. -3. 'EK'. 0. 'EM'. -2. 'EF'.
					   -5. 'EP'. -1. 'ES'. 0. 'ET'. 0. 'EW'. -7. 'EY'. -3. 'EV'. -2.
					   'GA'. 1. 'GR'. -3. 'GN'. 0. 'GD'. 1. 'GC'. -3. 'GQ'. -1. 'GE'.
					   0. 'GG'. 5. 'GH'. -2. 'GI'. -3. 'GL'. -4. 'GK'. -2. 'GM'. -3.
					   'GF'. -5. 'GP'. 0. 'GS'. 1. 'GT'. 0. 'GW'. -7. 'GY'. -5. 'GV'.
					   -1. 'HA'. -1. 'HR'. 2. 'HN'. 2. 'HD'. 1. 'HC'. -3. 'HQ'. 3. 'HE'.
					   1. 'HG'. -2. 'HH'. 6. 'HI'. -2. 'HL'. -2. 'HK'. 0. 'HM'. -2. 'HF'.
					   0. 'HP'. 0. 'HS'. -1. 'HT'. -1. 'HW'. -3. 'HY'. 0. 'HV'. -2. 'IA'.
					   -1. 'IR'. -2. 'IN'. -2. 'ID'. -2. 'IC'. -2. 'IQ'. -2. 'IE'.
					   -2. 'IG'. -3. 'IH'. -2. 'II'. 5. 'IL'. 2. 'IK'. -2. 'IM'. 2. 'IF'.
					   1. 'IP'. -2. 'IS'. -1. 'IT'. 0. 'IW'. -5. 'IY'. -1. 'IV'. 4. 'LA'.
					   -2. 'LR'. -3. 'LN'. -3. 'LD'. -4. 'LC'. -6. 'LQ'. -2. 'LE'.
					   -3. 'LG'. -4. 'LH'. -2. 'LI'. 2. 'LL'. 6. 'LK'. -3. 'LM'. 4. 'LF'.
					   2. 'LP'. -3. 'LS'. -3. 'LT'. -2. 'LW'. -2. 'LY'. -1. 'LV'. 2. 'KA'.
					   -1. 'KR'. 3. 'KN'. 1. 'KD'. 0. 'KC'. -5. 'KQ'. 1. 'KE'. 0. 'KG'.
					   -2. 'KH'. 0. 'KI'. -2. 'KL'. -3. 'KK'. 5. 'KM'. 0. 'KF'. -5. 'KP'.
					   -1. 'KS'. 0. 'KT'. 0. 'KW'. -3. 'KY'. -3. 'KV'. -2. 'MA'. -1.
					   'MR'. 0. 'MN'. -2. 'MD'. -3. 'MC'. -5. 'MQ'. -1. 'ME'. -2. 'MG'.
					   -3. 'MH'. -2. 'MI'. 2. 'ML'. 4. 'MK'. 0. 'MM'. 6. 'MF'. 0. 'MP'.
					   -2. 'MS'. -2. 'MT'. -1. 'MW'. -4. 'MY'. -2. 'MV'. 2. 'FA'. -3.
					   'FR'. -4. 'FN'. -3. 'FD'. -6. 'FC'. -4. 'FQ'. -5. 'FE'. -5. 'FG'.
					   -5. 'FH'. 0. 'FI'. 1. 'FL'. 2. 'FK'. -5. 'FM'. 0. 'FF'. 9. 'FP'.
					   -5. 'FS'. -3. 'FT'. -3. 'FW'. 0. 'FY'. 7. 'FV'. -1. 'PA'. 1. 'PR'.
					   0. 'PN'. 0. 'PD'. -1. 'PC'. -3. 'PQ'. 0. 'PE'. -1. 'PG'. 0. 'PH'.
					   0. 'PI'. -2. 'PL'. -3. 'PK'. -1. 'PM'. -2. 'PF'. -5. 'PP'. 6. 'PS'.
					   1. 'PT'. 0. 'PW'. -6. 'PY'. -3. 'PV'. -1. 'SA'. 1. 'SR'. 0. 'SN'.
					   1. 'SD'. 0. 'SC'. 0. 'SQ'. -1. 'SE'. 0. 'SG'. 1. 'SH'. -1. 'SI'.
					   -1. 'SL'. -3. 'SK'. 0. 'SM'. -2. 'SF'. -3. 'SP'. 1. 'SS'. 2. 'ST'.
					   1. 'SW'. -2. 'SY'. -3. 'SV'. -1. 'TA'. 1. 'TR'. -1. 'TN'. 0. 'TD'.
					   0. 'TC'. -2. 'TQ'. -1. 'TE'. 0. 'TG'. 0. 'TH'. -1. 'TI'. 0. 'TL'.
					   -2. 'TK'. 0. 'TM'. -1. 'TF'. -3. 'TP'. 0. 'TS'. 1. 'TT'. 3. 'TW'.
					   -5. 'TY'. -3. 'TV'. 0. 'WA'. -6. 'WR'. 2. 'WN'. -4. 'WD'. -7.
					   'WC'. -8. 'WQ'. -5. 'WE'. -7. 'WG'. -7. 'WH'. -3. 'WI'. -5. 'WL'.
					   -2. 'WK'. -3. 'WM'. -4. 'WF'. 0. 'WP'. -6. 'WS'. -2. 'WT'. -5.
					   'WW'. 17. 'WY'. 0. 'WV'. -6. 'YA'. -3. 'YR'. -4. 'YN'. -2. 'YD'.
					   -4. 'YC'. 0. 'YQ'. -4. 'YE'. -3. 'YG'. -5. 'YH'. 0. 'YI'. -1.
					   'YL'. -1. 'YK'. -3. 'YM'. -2. 'YF'. 7. 'YP'. -3. 'YS'. -3. 'YT'.
					   -3. 'YW'. 0. 'YY'. 10. 'YV'. -2. 'VA'. 0. 'VR'. -2. 'VN'. -2.
					   'VD'. -2. 'VC'. -2. 'VQ'. -2. 'VE'. -2. 'VG'. -1. 'VH'. -2. 'VI'.
					   4. 'VL'. 2. 'VK'. -2. 'VM'. 2. 'VF'. -1. 'VP'. -1. 'VS'. -1. 'VT'.
					   0. 'VW'. -6. 'VY'. -2. 'VV'. 4 });
		  gapOpenPenalty: -10;
		  gapExtendPenalty: -2;
		  yourself
]

{ #category : 'accessing' }
BioSubstitutionMatrix >> gapExtendPenalty [

	^ gapExtendPenalty ifNil: [ gapExtendPenalty := -1 ]
]

{ #category : 'accessing' }
BioSubstitutionMatrix >> gapExtendPenalty: aNumber [

	gapExtendPenalty := aNumber
]

{ #category : 'accessing' }
BioSubstitutionMatrix >> gapOpenPenalty [

	^ gapOpenPenalty ifNil: [ gapOpenPenalty := -10 ]
]

{ #category : 'accessing' }
BioSubstitutionMatrix >> gapOpenPenalty: aNumber [

	gapOpenPenalty := aNumber
]

{ #category : 'accessing' }
BioSubstitutionMatrix >> matrix [

	^ matrix
]

{ #category : 'accessing' }
BioSubstitutionMatrix >> matrix: aDictionary [

	matrix := aDictionary
]

{ #category : 'accessing' }
BioSubstitutionMatrix >> name [

	^ name
]

{ #category : 'accessing' }
BioSubstitutionMatrix >> name: aString [

	name := aString
]

{ #category : 'accessing' }
BioSubstitutionMatrix >> score: char1 with: char2 [

	| key |
	key := char1 asUppercase asString , char2 asUppercase asString.
	^ matrix at: key ifAbsent: [ 0 ]
]
