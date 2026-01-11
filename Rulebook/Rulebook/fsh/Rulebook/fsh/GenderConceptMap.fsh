Instance: GenderConceptMap
InstanceOf: ConceptMap
Usage: #definition

* id = "gender-conceptmap"
* name = "GenderConceptMap"
* title = "Legacy Gender to FHIR Gender ConceptMap"
* status = #active

* sourceUri = "http://example.org/fhir/CodeSystem/legacy-gender"
* targetUri = "http://hl7.org/fhir/administrative-gender"

* group[0].source = "http://example.org/fhir/CodeSystem/legacy-gender"
* group[0].target = "http://hl7.org/fhir/administrative-gender"

* group[0].element[0].code = #M
* group[0].element[0].target[0].code = #male
* group[0].element[0].target[0].equivalence = #equivalent

* group[0].element[1].code = #F
* group[0].element[1].target[0].code = #female
* group[0].element[1].target[0].equivalence = #equivalent
