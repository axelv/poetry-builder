.PHONE: build

build: 
	gcloud builds submit --config cloudbuild.yaml --substitutions=_POETRY_VERSION=1.3.1 .