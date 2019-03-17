bake:
	cd packer
	packer build packer.json
	cd ..

plan:
	cd terraform
	terraform init
	terraform plan -var-file="default.tfvars" -out=plan.tfplan
	cd ..

apply:
	cd terraform
	terraform init
	terraform apply plan.tfplan
	cd ..