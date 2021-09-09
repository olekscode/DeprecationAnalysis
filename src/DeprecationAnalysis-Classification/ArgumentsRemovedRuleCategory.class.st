Class {
	#name : #ArgumentsRemovedRuleCategory,
	#superclass : #SameReceiverRuleCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #testing }
ArgumentsRemovedRuleCategory >> condition [ 
	^ [ :deprecation |
		| rule antecedentTree consequentTree |
		rule := deprecation transformationRule.
		
		antecedentTree := rule parseAntecedentTree.
		consequentTree := rule parseConsequentTree.
		
		(antecedentTree arguments asSet difference: consequentTree arguments) isNotEmpty and: [
		(consequentTree arguments asSet difference: antecedentTree arguments) isEmpty  ] ]
]

{ #category : #testing }
ArgumentsRemovedRuleCategory >> name [
	^ 'Arguments removed'
]
