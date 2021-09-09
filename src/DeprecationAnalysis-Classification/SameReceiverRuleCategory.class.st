Class {
	#name : #SameReceiverRuleCategory,
	#superclass : #OneToOneRuleCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #testing }
SameReceiverRuleCategory >> condition [ 
	^ [ :deprecation | deprecation transformationRule parseAntecedentTree receiver = deprecation transformationRule parseConsequentTree receiver ]
]

{ #category : #testing }
SameReceiverRuleCategory >> name [ 
	^ 'Same receiver'
]
