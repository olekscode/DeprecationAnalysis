Extension { #name : #ClioMethod }

{ #category : #'*DeprecationAnalysis' }
ClioMethod >> asDaDeprecation [
	
	deprecation ifNil: [ self error: 'This method is not deprecated' ].

	^ DaDeprecation new
		className: className;
		selector: name;
		message: deprecation message;
		transformationRule: deprecation transformationRule;
		condition: deprecation condition;
		date: deprecation date;
		version: deprecation version.
]