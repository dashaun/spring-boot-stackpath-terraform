# spring-boot-stackpath-terraform

Get a Spring Boot image, deployed to StackPath, using Terraform.

## Quick Start

```bash
#clone the repository
git clone https://github.com/dashaun/spring-boot-stackpath-terraform
cd spring-boot-stackpath-terraform
# configure Terraform with your credentials
export STACKPATH_STACK_ID=
export STACKPATH_CLIENT_ID=
export STACKPATH_CLIENT_SECRET=
#Initialize Terraform to pull down the provider
terraform init
# Validate your credentials config by using the plan
terraform plan
# Apply the Terraform, ETC < 5 seconds
terraform apply -auto-approve
```

[![asciicast](https://asciinema.org/a/JqexvsUYphyGVpSuEOADpfbnM.png)](https://asciinema.org/a/JqexvsUYphyGVpSuEOADpfbnM?autoplay=1&startAt=03)

```bash
# Refresh to see the status
terraform refresh
```

[![asciicast](https://asciinema.org/a/jUlDDHoeox4SXBpfFHzPPPD37.png)](https://asciinema.org/a/jUlDDHoeox4SXBpfFHzPPPD37?autoplay=1)

```bash
# Access the Spring Boot application using the newly created workload
curl $(terraform output -raw ip_address_0):8080/actuator/health | jq .
```

[![asciicast](https://asciinema.org/a/LHmJDSfJXSG9WTRDOXoYtDBc9.png)](https://asciinema.org/a/LHmJDSfJXSG9WTRDOXoYtDBc9?autoplay=1&startAt=2)

## Cleanup

```
terraform destroy -auto-approve
```

[![asciicast](https://asciinema.org/a/dK1ARCkLHZNp2UQaPozfFgNo0.png)](https://asciinema.org/a/dK1ARCkLHZNp2UQaPozfFgNo0)

## Links

- [Blog Post](https://dashaun.com/posts/spring-boot-stackpath-terraform)
- [YouTube Video](https://youtu.be/kWVv0U1Bvq0)
- [Javagrunt on Twitch](https://twitch.tv/javagrunt)