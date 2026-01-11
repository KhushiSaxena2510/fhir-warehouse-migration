Profile: RMHCPatient
Parent: Patient
Id: rmhc-patient
Title: "RMHC Patient Profile"
Description: "Patient profile for RMHC legacy data migrated into the FHIR warehouse."

* identifier 1..*
* identifier.value 1..

* name 1..*
* name.text 1..

* gender 1..1
* gender from http://hl7.org/fhir/ValueSet/administrative-gender (required)

* birthDate 1..1
