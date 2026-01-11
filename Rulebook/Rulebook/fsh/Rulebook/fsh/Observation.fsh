Profile: RMHCObservation
Parent: Observation
Id: rmhc-observation
Title: "RMHC Observation Profile"
Description: "Observation profile for clinical measurements migrated from RMHC legacy data."

* status 1..1

* category 1..*
* category.coding.system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category.coding.code 1..1

* code 1..1
* code.text 1..1

* subject 1..1
* subject only Reference(RMHCPatient)

* effective[x] 1..1

* value[x] 1..1
