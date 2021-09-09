Class {
	#name : #AddedUnaryMessageRuleCategory,
	#superclass : #OneToManyRuleCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #accessing }
AddedUnaryMessageRuleCategory >> condition [ 
	^ [ :deprecation |
		| rule consequentTree |
		rule := deprecation transformationRule.
		
		consequentTree := rule parseConsequentTree.
		
		consequentTree isMessage and: [
			consequentTree receiver isMessage and: [ 
			(self isUnaryMessageAddedBefore: rule) or: [ 
				self isUnaryMessageAddedAfter: rule ] ] ] ]
]

{ #category : #accessing }
AddedUnaryMessageRuleCategory >> isUnaryMessageAddedAfter: aRule [
	^ aRule parseConsequentTree arguments isEmpty and: [
		aRule parseConsequentTree receiver arguments = aRule parseAntecedentTree arguments ]
]

{ #category : #accessing }
AddedUnaryMessageRuleCategory >> isUnaryMessageAddedBefore: aRule [
	^ aRule parseConsequentTree receiver arguments isEmpty and: [
		aRule parseConsequentTree arguments = aRule parseAntecedentTree arguments ]
]

{ #category : #accessing }
AddedUnaryMessageRuleCategory >> name [ 
	^ 'Added unary message'
]
