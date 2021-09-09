Class {
	#name : #RenamingRuleCategory,
	#superclass : #SameReceiverRuleCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #testing }
RenamingRuleCategory >> condition [ 
	^ [ :deprecation | deprecation transformationRule parseAntecedentTree arguments = deprecation transformationRule parseConsequentTree arguments ]
]

{ #category : #testing }
RenamingRuleCategory >> name [ 
	^ 'Renaming'
]
