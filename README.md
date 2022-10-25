# spring-boot-stackpath-terraform

Get a Spring Boot image, deployed to StackPath, using Terraform.

## Quick Start

```bash
#clone the repository
git clone https://github.com/dashaun/spring-boot-stackpath-terraform
cd spring-boot-stackpath-terraform
# configure Terraform with your credentials
export STACKPATH_STACK_ID= stacks -> My Default Stack -> SLUG
export STACKPATH_CLIENT_ID=
export STACKPATH_CLIENT_SECRET=
#Initialize Terraform to pull down the provider
terraform init
# Validate your credentials config by using the plan
terraform plan
# Apply the Terraform, ETC < 5 seconds
terraform apply -auto-approve
# Access the Spring Boot application using the newly created server
curl $(terraform output -raw ip_address_0):8080/actuator/health | jq .
```

### Notes

We setup a new account on stackpath.com
- billing info required
- I couldn't find a free tier or discount code, but I didn't look very hard

We noticed:
`plan` and `apply` are super fast, appears to be async
terraform refresh to get outputs
turnaround time for each iteration is super quick

I spent a bunch of time, not realizing that I needed the stackpath_compute_network_policy.
Ports are not exposed to the public, by default.

STACKPATH_STACK_ID is the `stack` `slug`
STACKPATH_CLIENT_ID and STACKPATH_CLIENT_SECRET are created via the `DASHBOARD` and `API ACCESS`

This example feels a little bit more secure than the previous, simply because
public access isn't allowed by default.
Additionally, the container doesn't have remote access enabled.