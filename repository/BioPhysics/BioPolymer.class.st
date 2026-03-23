"
BioPolymer extends BioSequence with physical chemistry, thermodynamic, and structure-oriented analyses for proteins, nucleic acids, and specialized biopolymers.
"
Class {
	#name : 'BioPolymer',
	#superclass : 'BioSequence',
	#instVars : [
		'monomerMasses',
		'pkaTable',
		'modifications',
		'enzymeCleavageRules',
		'branchingData'
	],
	#category : 'BioPhysics',
	#package : 'BioPhysics'
}

{ #category : 'tables' }
BioPolymer class >> defaultPkaValues [
	^ Dictionary newFromPairs: {
		$D . 3.9.
		$E . 4.1.
		$C . 8.3.
		$Y . 10.1.
		$H . 6.0.
		$K . 10.5.
		$R . 12.5.
		#nTerm . 9.69.
		#cTerm . 2.34 }
]

{ #category : 'tables' }
BioPolymer class >> instabilityWeights [
	"Complete 400-entry Guruprasad table should live here.
	This compact version includes common values and defaults missing pairs to 0.0 in callers."
	^ Dictionary newFromPairs: {
		'AA' . 1.0. 'AC' . 1.2. 'AD' . -1.0. 'AE' . -1.0. 'AF' . -2.0. 'AG' . -0.4. 'AH' . -1.3. 'AI' . -1.8. 'AK' . -1.5. 'AL' . -1.8.
		'AM' . -1.3. 'AN' . -0.8. 'AP' . 0.3. 'AQ' . -0.7. 'AR' . -1.2. 'AS' . 0.6. 'AT' . 0.4. 'AV' . 0.5. 'AW' . -2.1. 'AY' . -1.9.
		'CA' . -0.2. 'CC' . 0.1. 'CD' . -1.4. 'CE' . -1.3. 'CF' . -1.6. 'CG' . -0.7. 'CH' . -1.1. 'CI' . -1.4. 'CK' . -1.0. 'CL' . -1.5.
		'CM' . -1.0. 'CN' . -0.8. 'CP' . 0.2. 'CQ' . -0.7. 'CR' . -1.0. 'CS' . 0.5. 'CT' . 0.3. 'CV' . 0.4. 'CW' . -1.8. 'CY' . -1.5.
		'GA' . 0.8. 'GV' . 0.9. 'VV' . 1.1. 'LL' . 1.1. 'FW' . 1.3. 'WY' . 1.2. 'KR' . 0.9. 'RK' . 0.9 }
]

{ #category : 'tables' }
BioPolymer class >> kyteDoolittleScale [
	^ Dictionary newFromPairs: {
		$A . 1.8. $R . -4.5. $N . -3.5. $D . -3.5. $C . 2.5.
		$Q . -3.5. $E . -3.5. $G . -0.4. $H . -3.2. $I . 4.5.
		$L . 3.8. $K . -3.9. $M . 1.9. $F . 2.8. $P . -1.6.
		$S . -0.8. $T . -0.7. $W . -0.9. $Y . -1.3. $V . 4.2 }
]

{ #category : 'tables' }
BioPolymer class >> maxAccessibleSurfaceByResidue [
	^ Dictionary newFromPairs: {
		$A . 121.0. $R . 265.0. $N . 187.0. $D . 187.0. $C . 148.0.
		$Q . 214.0. $E . 214.0. $G . 97.0. $H . 216.0. $I . 195.0.
		$L . 191.0. $K . 230.0. $M . 203.0. $F . 228.0. $P . 154.0.
		$S . 143.0. $T . 163.0. $W . 264.0. $Y . 255.0. $V . 165.0 }
]

{ #category : 'as yet unclassified' }
BioPolymer class >> nearestNeighborInitiationFor: aSequenceString [
	| first last atEnds gcEnds |
	aSequenceString isEmpty ifTrue: [ ^ #(0.0 0.0) ].
	first := aSequenceString first.
	last := aSequenceString last.
	atEnds := ((first = $A or: [ first = $T or: [ first = $U ] ]) ifTrue: [ 1 ] ifFalse: [ 0 ])
		+ ((last = $A or: [ last = $T or: [ last = $U ] ]) ifTrue: [ 1 ] ifFalse: [ 0 ]).
	gcEnds := 2 - atEnds.
	^ { (2.3 * atEnds) + (0.1 * gcEnds). ((4.1 * atEnds) - (2.8 * gcEnds)) }
]

{ #category : 'as yet unclassified' }
BioPolymer class >> nearestNeighborThermoTable [
	"ΔH (kcal/mol), ΔS (cal/mol/K) for DNA NN dimers (approx SantaLucia set)."
	^ Dictionary newFromPairs: {
		'AA' . #(-7.9 -22.2). 'TT' . #(-7.9 -22.2).
		'AT' . #(-7.2 -20.4). 'TA' . #(-7.2 -21.3).
		'CA' . #(-8.5 -22.7). 'TG' . #(-8.5 -22.7).
		'GT' . #(-8.4 -22.4). 'AC' . #(-8.4 -22.4).
		'CT' . #(-7.8 -21.0). 'AG' . #(-7.8 -21.0).
		'GA' . #(-8.2 -22.2). 'TC' . #(-8.2 -22.2).
		'CG' . #(-10.6 -27.2).
		'GC' . #(-9.8 -24.4).
		'GG' . #(-8.0 -19.9). 'CC' . #(-8.0 -19.9) }
]

{ #category : 'tables' }
BioPolymer class >> nucleotideExtinctionCoefficients [
	"Nearest-neighbor is more accurate; these are practical single-base coefficients."
	^ Dictionary newFromPairs: {
		$A . 15400.
		$C . 7400.
		$G . 11500.
		$T . 8700.
		$U . 9900.
		$N . 0 }
]

{ #category : 'physical-thermodynamics' }
BioPolymer >> aliphaticIndex [
	"Answer the relative volume occupied by aliphatic side chains (Alanine, Valine, Isoleucine, and Leucine)."
	| counts total a v i l |
	total := self size asFloat.
	total = 0 ifTrue: [ ^ 0.0 ].
	counts := self monomerCounts.
	a := (counts at: $A ifAbsent: [ 0 ]) asFloat.
	v := (counts at: $V ifAbsent: [ 0 ]) asFloat.
	i := (counts at: $I ifAbsent: [ 0 ]) asFloat.
	l := (counts at: $L ifAbsent: [ 0 ]) asFloat.
	^ ((a / total) * 100.0)
		+ ((v / total) * 100.0 * 2.9)
		+ (((i + l) / total) * 100.0 * 3.9)
]

{ #category : 'specialized-interactions' }
BioPolymer >> branchingFactor [
	"Simple branching score for glycans/polymers with explicit branching metadata.
	Returns 0 when no branching information is available."
	branchingData ifNil: [ ^ 0.0 ].
	(branchingData includesKey: #branches) ifFalse: [ ^ 0.0 ].
	(self size = 0) ifTrue: [ ^ 0.0 ].
	^ ((branchingData at: #branches) asFloat / self size asFloat)
]

{ #category : 'physical-thermodynamics' }
BioPolymer >> chargeAtPh: ph [
	| pka net counts nTerm cTerm |
	self isProteinSequence 
		ifFalse: [ ^ 0.0 ].
	counts := self monomerCounts.
	pka := self pkaValues.
	nTerm := pka at: #nTerm.
	cTerm := pka at: #cTerm.
	net := 0.0.

	"Termini"
	net := net + (1.0 / (1.0 + (10.0 raisedTo: (ph - nTerm)))).
	net := net - (1.0 / (1.0 + (10.0 raisedTo: (cTerm - ph)))).

	"Basic side chains"
	net := net
		+ ((counts at: $K ifAbsent: [ 0 ]) asFloat * (1.0 / (1.0 + (10.0 raisedTo: (ph - (pka at: $K))))))
		+ ((counts at: $R ifAbsent: [ 0 ]) asFloat * (1.0 / (1.0 + (10.0 raisedTo: (ph - (pka at: $R))))))
		+ ((counts at: $H ifAbsent: [ 0 ]) asFloat * (1.0 / (1.0 + (10.0 raisedTo: (ph - (pka at: $H)))))).

	"Acidic side chains"
	net := net
		- ((counts at: $D ifAbsent: [ 0 ]) asFloat * (1.0 / (1.0 + (10.0 raisedTo: ((pka at: $D) - ph)))))
		- ((counts at: $E ifAbsent: [ 0 ]) asFloat * (1.0 / (1.0 + (10.0 raisedTo: ((pka at: $E) - ph)))))
		- ((counts at: $C ifAbsent: [ 0 ]) asFloat * (1.0 / (1.0 + (10.0 raisedTo: ((pka at: $C) - ph)))))
		- ((counts at: $Y ifAbsent: [ 0 ]) asFloat * (1.0 / (1.0 + (10.0 raisedTo: ((pka at: $Y) - ph))))).
	^ net
]

{ #category : 'structural-geometric' }
BioPolymer >> contactMap [
	"Generates a matrix representing which monomers are within a specific distance of each other in 3D space"
	^ self contactMapWithin: 8.0
]

{ #category : 'structural-geometric' }
BioPolymer >> contactMapWithin: cutoff [
	| pts n map cutoff2 |
	pts := self coordinates.
	n := pts size.
	n = 0 ifTrue: [ ^ #() ].
	map := Array new: n.
	1 to: n do: [ :i | map at: i put: (ByteArray new: n withAll: 0) ].
	cutoff2 := cutoff * cutoff.
	1 to: n do: [ :i |
		i to: n do: [ :j |
			| pi pj d2 contact |
			pi := pts at: i.
			pj := pts at: j.
			d2 := (pi x - pj x) squared + (pi y - pj y) squared + (pi z - pj z) squared.
			contact := d2 <= cutoff2 ifTrue: [ 1 ] ifFalse: [ 0 ].
			(map at: i) at: j put: contact.
			(map at: j) at: i put: contact ] ].
	^ map
]

{ #category : 'specialized-interactions' }
BioPolymer >> effectivePkaValues [
	^ pkaTable ifNil: [ self class defaultPkaValues copy ]
]

{ #category : 'physical-thermodynamics' }
BioPolymer >> extinctionCoefficient [
	self isProteinSequence ifTrue: [ ^ self proteinExtinctionCoefficient ].
	(self isDNASequence) ifTrue: [ ^ self nucleicAcidExtinctionCoefficient ].
	^ 0
]

{ #category : 'chemical-compositional' }
BioPolymer >> gravy [
	"(Grand Average of Hydropathy) Calculates the sum of hydropathy values of all amino acids divided by the sequence length."
	| scale total len |
	self isProteinSequence 
		ifFalse: [ ^ 0.0 ].
	scale := self class kyteDoolittleScale.
	total := 0.0.
	len := 0.
	self sequence do: [ :ch |
		| aa |
		aa := ch asUppercase.
		(scale includesKey: aa)
			ifTrue: [
				total := total + (scale at: aa).
				len := len + 1 ] ].
	len = 0 ifTrue: [ ^ 0.0 ].
	^ total / len asFloat
]

{ #category : 'coordinates' }
BioPolymer >> importCoordinatesFrom: aStructureLikeObject [
	"Adapter hook for structure objects.
	Expected protocol (best effort):
	- #alphaCarbonCoordinates
	- or #coordinates
	Coordinates should answer #x #y #z."
	(aStructureLikeObject respondsTo: #alphaCarbonCoordinates)
		ifTrue: [ ^ self coordinates: (aStructureLikeObject perform: #alphaCarbonCoordinates) ].
	(aStructureLikeObject respondsTo: #coordinates)
		ifTrue: [ ^ self coordinates: (aStructureLikeObject perform: #coordinates) ].
	self error: 'Object does not expose recognizable coordinate protocol'
]

{ #category : 'chemical-compositional' }
BioPolymer >> instabilityIndex [
	"Predicts the stability of a protein in a test tube (values $>40$ usually indicate instability)."
	| dipeptideWeights sum len |
	self isProteinSequence 
		ifFalse: [ ^ 0.0 ].
	len := self size.
	len < 2 ifTrue: [ ^ 0.0 ].
	dipeptideWeights := self class instabilityWeights.
	sum := 0.0.
	1 to: len - 1 do: [ :i |
		| pair |
		pair := ((self sequence at: i) asUppercase asString), ((self sequence at: i + 1) asUppercase asString).
		sum := sum + (dipeptideWeights at: pair ifAbsent: [ 0.0 ]) ].
	^ (10.0 * sum) / len asFloat
]

{ #category : 'physical-thermodynamics' }
BioPolymer >> isoelectricPoint [
	| low high mid charge iter |
	self isProteinSequence ifFalse: [ ^ 7.0 ].
	low := 0.0.
	high := 14.0.
	iter := 0.
	[ (high - low) > 1e-4 and: [ iter < 256 ] ] whileTrue: [
		mid := (low + high) / 2.0.
		charge := self chargeAtPh: mid.
		charge > 0
			ifTrue: [ low := mid ]
			ifFalse: [ high := mid ].
		iter := iter + 1 ].
	^ (low + high) / 2.0
]

{ #category : 'physical-thermodynamics' }
BioPolymer >> meltingTemp [
	"Nearest-neighbor melting temperature (SantaLucia-style approximation).
	Fallback to Wallace for very short oligos.
	Assumptions:
	- self is single strand sequence represented 5'->3'
	- default total strand concentration = 250 nM
	- monovalent salt concentration = 50 mM
	Returns temperature in Celsius."
	| len dH dS nnTable initiation entropySaltCorrection r gasConstant ct tmKelvin |
	self isDNASequence ifFalse: [ ^ 0.0 ].
	seq := self sequence asUppercase.
	len := seq size.
	len = 0 ifTrue: [ ^ 0.0 ].
	len < 8 ifTrue: [
		| counts a t g c |
		counts := self monomerCounts.
		a := counts at: $A ifAbsent: [ 0 ].
		t := (counts at: $T ifAbsent: [ 0 ]) + (counts at: $U ifAbsent: [ 0 ]).
		g := counts at: $G ifAbsent: [ 0 ].
		c := counts at: $C ifAbsent: [ 0 ].
		^ ((2 * (a + t)) + (4 * (g + c))) asFloat ].

	nnTable := self class nearestNeighborThermoTable.
	dH := 0.0.
	dS := 0.0.
	1 to: len - 1 do: [ :i |
		| pair thermo |
		pair := (seq copyFrom: i to: i + 1).
		thermo := nnTable at: pair ifAbsent: [ #(0.0 0.0) ].
		dH := dH + thermo first.
		dS := dS + thermo second ].

	"Initiation correction"
	initiation := self class nearestNeighborInitiationFor: seq.
	dH := dH + initiation first.
	dS := dS + initiation second.

	"Salt correction on entropy"
	r := 0.05. "[Na+] M"
	entropySaltCorrection := 0.368 * (len - 1) * (r ln).
	dS := dS + entropySaltCorrection.

	"Tm = (1000*ΔH)/(ΔS + R ln(Ct/4)) - 273.15"
	gasConstant := 1.987. "cal/(K mol)"
	ct := 2.5e-7. "M"
	tmKelvin := ((1000.0 * dH) / (dS + (gasConstant * (ct / 4.0) ln))).
	^ tmKelvin - 273.15
]

{ #category : 'physical-thermodynamics' }
BioPolymer >> meltingTemp2 [
	"Nucleic acid Tm with Wallace for short oligos and salt-adjusted GC% formula for longer sequences."
	| len counts a t g c salt wallace |
	self isDNASequence ifFalse: [ ^ 0.0 ].
	len := self size.
	len = 0 ifTrue: [ ^ 0.0 ].
	counts := self monomerCounts.
	a := counts at: $A ifAbsent: [ 0 ].
	t := (counts at: $T ifAbsent: [ 0 ]) + (counts at: $U ifAbsent: [ 0 ]).
	g := counts at: $G ifAbsent: [ 0 ].
	c := counts at: $C ifAbsent: [ 0 ].
	len < 14 ifTrue: [
		wallace := (2 * (a + t)) + (4 * (g + c)).
		^ wallace asFloat ].
	salt := 50e-3.
	^ 81.5 + (16.6 * (salt log / 10.0)) + (0.41 * ((g + c) asFloat / len asFloat * 100.0)) - (500.0 / len asFloat)
]

{ #category : 'chemical-compositional' }
BioPolymer >> molarAbsorption [
	"Specifically for DNA, calculates the absorbance at $260nm$ for a given concentration."
	| epsilon |
	self isDNASequence ifFalse: [ ^ 0.0 ].
	epsilon := self extinctionCoefficient asFloat.
	epsilon = 0.0 ifTrue: [ ^ 0.0 ].
	"Default concentration 1 M and path length 1 cm -> A = εcl"
	^ epsilon
]

{ #category : 'chemical-compositional' }
BioPolymer >> monomerCounts [
	| counts |
	counts := Dictionary new.
	self sequence do: [ :ch |
		| c |
		c := ch asUppercase.
		counts at: c put: ((counts at: c ifAbsent: [ 0 ]) + 1) ].
	^ counts
]

{ #category : 'chemical-compositional' }
BioPolymer >> monomerFrequencies [
	"Returns a dictionary/map of the percentage occurrence of each monomer (e.g., Amino Acid or Nucleotide distribution)."
	| counts total frequencies |
	total := self size asFloat.
	total = 0 ifTrue: [ ^ Dictionary new ].
	counts := self monomerCounts.
	frequencies := Dictionary new: counts size.
	counts keysAndValuesDo: [ :k :v |
		frequencies at: k put: (v asFloat / total) ].
	^ frequencies
]

{ #category : 'physical-thermodynamics' }
BioPolymer >> nucleicAcidExtinctionCoefficient [
	| coeffs total |
	coeffs := self class nucleotideExtinctionCoefficients.
	total := 0.
	self sequence do: [ :ch |
		total := total + (coeffs at: ch asUppercase ifAbsent: [ 0 ]) ].
	^ total
]

{ #category : 'specialized-interactions' }
BioPolymer >> pkaValues [
	"Returns effective pKa table for current polymer context.
	Base values can be overridden with instance-level pkaTable.
	Terminal corrections are exposed as symbolic entries."
	| values |
	values := self effectivePkaValues.
	values at: #nTerm put: (values at: #nTerm ifAbsent: [ 9.69 ]).
	values at: #cTerm put: (values at: #cTerm ifAbsent: [ 2.34 ]).
	^ values copy
]

{ #category : 'specialized-interactions' }
BioPolymer >> postTranslationalModifications [
	"(For Proteins) Tracks phosphorylation, glycosylation, or methylation sites."
	modifications ifNil: [ ^ OrderedCollection new ].
	^ modifications copy
]

{ #category : 'physical-thermodynamics' }
BioPolymer >> proteinExtinctionCoefficient [
	| counts trp tyr cys |
	counts := self monomerCounts.
	trp := counts at: $W ifAbsent: [ 0 ].
	tyr := counts at: $Y ifAbsent: [ 0 ].
	cys := counts at: $C ifAbsent: [ 0 ].
	^ (trp * 5500) + (tyr * 1490) + ((cys // 2) * 125)
]

{ #category : 'specialized-interactions' }
BioPolymer >> proteolysisSites: anEnzyme [
	| enzymeName sites |
	self isProteinSequence ifFalse: [ ^ #() ].
	seq := self sequence asUppercase.
	enzymeName := anEnzyme asString asLowercase.
	sites := OrderedCollection new.
	enzymeName = 'trypsin' ifTrue: [
		1 to: seq size - 1 do: [ :i |
			| aa next |
			aa := seq at: i.
			next := seq at: i + 1.
			((aa = $K or: [ aa = $R ]) and: [ next ~= $P ]) ifTrue: [ sites add: i ] ].
		(seq notEmpty and: [ (seq last = $K) or: [ seq last = $R ] ]) ifTrue: [ sites add: seq size ].
		^ sites asArray ].
	enzymeName = 'pepsin' ifTrue: [
		1 to: seq size - 1 do: [ :i |
			| aa |
			aa := seq at: i.
			(#($F $L $W $Y) includes: aa) ifTrue: [ sites add: i ] ].
		^ sites asArray ].
	^ #()
]

{ #category : 'structural-geometric' }
BioPolymer >> radiusOfGyration [
	"Measures the compactness of the polymer chain."
	| pts n cx cy cz sum |
	pts := self coordinates.
	n := pts size asFloat.
	n = 0 ifTrue: [ ^ 0.0 ].
	cx := (pts sum: [ :p | p x ]) / n.
	cy := (pts sum: [ :p | p y ]) / n.
	cz := (pts sum: [ :p | p z ]) / n.
	sum := pts sum: [ :p | ((p x - cx) squared + (p y - cy) squared + (p z - cz) squared) ].
	^ (sum / n) sqrt
]

{ #category : 'structural-geometric' }
BioPolymer >> secondaryStructure [
	"Very lightweight sequence-based secondary structure propensity assignment.
	Returns a String of same length with symbols:
	- H: helix-prone
	- E: strand-prone
	- T: turn/coil-prone
	
	This is a heuristic fallback when no experimental structure is available."
	| helixSet sheetSet turnSet out |
	self isProteinSequence ifFalse: [ ^ String new: self size withAll: $T ].

	helixSet := Set withAll: #($A $L $M $E $K $Q $R $H).
	sheetSet := Set withAll: #($V $I $Y $F $W $T $C).
	turnSet := Set withAll: #($G $N $P $S $D).

	out := String new: self size.
	1 to: self size do: [ :i |
		| aa state |
		aa := (self sequence at: i) asUppercase.
		state := (helixSet includes: aa)
			ifTrue: [ $H ]
			ifFalse: [
				(sheetSet includes: aa)
					ifTrue: [ $E ]
					ifFalse: [ $T ] ].
		out at: i put: state ].
	^ out
]

{ #category : 'structural-geometric' }
BioPolymer >> secondaryStructureFraction [
	"Returns the percentage of the sequence predicted or observed to be in Helix, Sheet, or Turn states."
	| ss total helix sheet turn |
	(self respondsTo: #secondaryStructure)
		ifFalse: [ ^ Dictionary newFromPairs: { #helix . 0.0 . #sheet . 0.0 . #turn . 0.0 } ].
	ss := self secondaryStructure.
	total := ss size asFloat.
	total = 0 ifTrue: [ ^ Dictionary newFromPairs: { #helix . 0.0 . #sheet . 0.0 . #turn . 0.0 } ].
	helix := (ss count: [ :c | c = $H ]) asFloat / total.
	sheet := (ss count: [ :c | c = $E ]) asFloat / total.
	turn := (ss count: [ :c | c = $T ]) asFloat / total.
	^ Dictionary newFromPairs: { #helix . helix . #sheet . sheet . #turn . turn }
]

{ #category : 'structural-geometric' }
BioPolymer >> solventAccessibleSurfaceArea [
	"Approximate SASA using per-residue maximal accessible area fractions.
	If no structure/relative accessibility is present, returns theoretical maximum."
	| maxAsa total |
	self isProteinSequence ifFalse: [ ^ 0.0 ].
	maxAsa := self class maxAccessibleSurfaceByResidue.
	total := 0.0.
	self sequence do: [ :ch |
		total := total + (maxAsa at: ch asUppercase ifAbsent: [ 0.0 ]) ].
	^ total
]
