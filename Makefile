lint:
	tflint

tf-init:
	terraform init -upgrade

tf-plan: tf-init
	terraform plan -out tfplan

tf-apply:
	terraform apply tfplan