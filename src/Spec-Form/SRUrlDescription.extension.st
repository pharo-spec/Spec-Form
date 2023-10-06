Extension { #name : #SRUrlDescription }

{ #category : #'*Spec-Form' }
SRUrlDescription >> urlLabel [

	^ self propertyAt: #urlLabel ifAbsent: [ nil ]
]

{ #category : #'*Spec-Form' }
SRUrlDescription >> urlLabel: aString [

	^ self propertyAt: #urlLabel put: aString
]
