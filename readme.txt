Apply Terraform locally

cd infra/environments/dev
terraform init
terraform apply -auto-approve

for git hub actions when it repo exist already
git add .
git commit -m " message description "
git push -u origin main or master depends on which you can need