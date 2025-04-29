.PHONE: build

build:
	gcloud builds submit --config cloudbuild.yaml .
