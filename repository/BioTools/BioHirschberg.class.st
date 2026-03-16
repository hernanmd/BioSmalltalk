"
Hirschberg's algorithm is a more space-efficient modification of the Needleman-Wunsch algorithm, designed for optimal sequence alignment. It uses a divide-and-conquer approach to achieve linear space complexity while maintaining the same time complexity as Needleman-Wunsch.

This implementation reduces space complexity from O(nm) to O(min(n,m)) while maintaining O(nm) time complexity.
"
Class {
	#name : 'BioHirschberg',
	#superclass : 'ALNeedlemanWunsch',
	#category : 'BioTools-Align',
	#package : 'BioTools',
	#tag : 'Align'
}

{ #category : 'initialization' }
BioHirschberg >> align: sequence1 with: sequence2 [

	| aligned |
	self
		firstSequence: sequence1;
		secondSequence: sequence2.

	(sequence1 isEmpty and: [ sequence2 isEmpty ]) ifTrue: [ ^ self ].

	aligned := self recursiveAlignment: sequence1 with: sequence2.
	self finalize: aligned first reversed with: aligned second reversed.
	^ self
]

{ #category : 'accessing' }
BioHirschberg >> alignmentScoreOf: alignedA with: alignedB using: aligner [

	| score |
	score := 0.
	1 to: alignedA size do: [ :i |
			score := score
			         +
			         (aligner
				          matchScore: (alignedA at: i)
				          with: (alignedB at: i)) ].
	^ score
]

{ #category : 'transforming' }
BioHirschberg >> backwardPass: aSeq with: bSeq [
	"R[j] = score of aligning reverse(aSeq) with reverse(bSeq[1..j]) mapped back"

	^ (self forwardPass: aSeq reversed with: bSeq reversed) reversed
]

{ #category : 'transforming' }
BioHirschberg >> forwardPass: aSeq with: bSeq [

	| current previous diagonal up left |
	current := Array new: bSeq size + 1.
	0 to: bSeq size do: [ :j |
	current at: j + 1 put: j * self gapPenalty ].

	aSeq doWithIndex: [ :charA :i |
			previous := current copy.
			current at: 1 put: i * self gapPenalty.
			1 to: bSeq size do: [ :j |
					diagonal := (previous at: j)
					            + (self matchScore: charA with: (bSeq at: j)).
					up := (previous at: j + 1) + self gapPenalty.
					left := (current at: j) + self gapPenalty.
					current at: j + 1 put: ((diagonal max: up) max: left) ] ].
	^ current
]

{ #category : 'initialization' }
BioHirschberg >> initialize [

	super initialize.
	gapCharacter := $-
]

{ #category : 'transforming' }
BioHirschberg >> needlemanWunschForSmallCases: aSeq with: bSeq [

	| nw |
	nw := self class superclass new.
	nw
		matchAward: self matchAward;
		mismatchPenalty: self mismatchPenalty;
		gapPenalty: self gapPenalty;
		gapCharacter: self gapCharacter;
		align: aSeq with: bSeq.
	^ {
		  nw firstSequence.
		  nw secondSequence }
]

{ #category : 'transforming' }
BioHirschberg >> recursiveAlignment: aSeq with: bSeq [

	| n m mid leftA rightA scoreL scoreR split leftPart rightPart |
	n := aSeq size.
	m := bSeq size.

	n = 0 ifTrue: [
			^ {
				  (String new: m withAll: self gapCharacter).
				  bSeq } ].

	m = 0 ifTrue: [
			^ {
				  aSeq.
				  (String new: n withAll: self gapCharacter) } ].

	(n = 1 or: [ m = 1 ]) ifTrue: [
		^ self needlemanWunschForSmallCases: aSeq with: bSeq ].

	mid := n // 2.
	leftA := aSeq copyFrom: 1 to: mid.
	rightA := aSeq copyFrom: mid + 1 to: n.

	scoreL := self forwardPass: leftA with: bSeq.
	scoreR := self backwardPass: rightA with: bSeq.
	split := self splitIndexFromForward: scoreL backward: scoreR.

	leftPart := self
		            recursiveAlignment: leftA
		            with: (bSeq copyFrom: 1 to: split).
	rightPart := self
		             recursiveAlignment: rightA
		             with: (bSeq copyFrom: split + 1 to: m).

	^ {
		  (leftPart first , rightPart first).
		  (leftPart second , rightPart second) }
]

{ #category : 'transforming' }
BioHirschberg >> splitIndexFromForward: scoreL backward: scoreR [

	| m bestIndex bestScore candidate |
	m := scoreL size - 1.
	bestIndex := 0.
	bestScore := SmallInteger minVal.
	0 to: m do: [ :j |
			candidate := (scoreL at: j + 1) + (scoreR at: m - j + 1).
			candidate > bestScore ifTrue: [
					bestScore := candidate.
					bestIndex := j ] ].
	^ bestIndex
]
