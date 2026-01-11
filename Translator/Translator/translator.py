import csv
import uuid
import json

def create_patient(row, patient_uuid):
    return {
        "fullUrl": f"urn:uuid:{patient_uuid}",
        "resource": {
            "resourceType": "Patient",
            "id": patient_uuid,
            "identifier": [{"value": row["patient_id"]}],
            "name": [{"text": row["name"]}],
            "gender": "male" if row["gender"] == "M" else "female",
            "birthDate": row["dob"]
        },
        "request": {
            "method": "POST",
            "url": "Patient"
        }
    }

def create_observation(row, patient_uuid):
    return {
        "resource": {
            "resourceType": "Observation",
            "status": "final",
            "code": {"text": row["observation_code"]},
            "subject": {
                "reference": f"urn:uuid:{patient_uuid}"
            },
            "effectiveDateTime": row["observation_date"],
            "valueString": row["observation_value"]
        },
        "request": {
            "method": "POST",
            "url": "Observation"
        }
    }

def build_transaction_bundle(csv_file):
    bundle = {
        "resourceType": "Bundle",
        "type": "transaction",
        "entry": []
    }

    with open(csv_file, newline='') as file:
        reader = csv.DictReader(file)
        for row in reader:
            patient_uuid = str(uuid.uuid4())
            bundle["entry"].append(create_patient(row, patient_uuid))
            bundle["entry"].append(create_observation(row, patient_uuid))

    return bundle

if __name__ == "__main__":
    bundle = build_transaction_bundle("sample-data.csv")
    print(json.dumps(bundle, indent=2))
