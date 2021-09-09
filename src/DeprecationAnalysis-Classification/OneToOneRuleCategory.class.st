Class {
	#name : #OneToOneRuleCategory,
	#superclass : #ValidRuleCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #testing }
OneToOneRuleCategory >> condition [
	^ [ :deprecation |
		| rule consequentTree |
		rule := deprecation transformationRule.
		
		consequentTree := rule parseConsequentTree.
		
		consequentTree isMessage and: [
			consequentTree receiver isMessage not and: [
			(consequentTree arguments allSatisfy: [ :each |
				each class = RBPatternVariableNode ]) ] ] ]
]

{ #category : #accessing }
OneToOneRuleCategory >> name [ 
	^ 'One to one'
]
