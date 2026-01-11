# Source to Target Mapping (STM)

| Legacy CSV Column | Description | FHIR Resource | FHIR Element |
|------------------|-------------|---------------|--------------|
| patient_id | Legacy patient identifier | Patient | Patient.id |
| first_name | First name | Patient | Patient.name.given |
| last_name | Last name | Patient | Patient.name.family |
| gender | M/F values | Patient | Patient.gender |
| dob | Date of birth | Patient | Patient.birthDate |
| obs_code | Observation code | Observation | Observation.code.text |
| obs_value | Observation value | Observation | Observation.valueQuantity |
| obs_date | Observation date | Observation | Observation.effectiveDateTime |
