# Terraform training

Infrastructure as Code with Terraform and AWS.
Created by Metadev.

Last revision 2021.03.12
## Prerequisites

1. [Git](https://git-scm.com/downloads)
2. Bash Shell
3. Editor. Recomended [Visual Studio Code](https://code.visualstudio.com) + Extension for Terraform
4. SSH Client (For example: [putty.exe](https://www.putty.org/) on windows)
5. [Terraform](https://www.terraform.io/) Add it to your PATH
6. [aws-cli](https://aws.amazon.com/cli/)

## To test the examples

1. Clone the repository to local machine

    ```bash
    git clone git@github.com:metadevpro/terraform-aws-training.git
    ```

2. Enter into each folder for exercices

3. Configure your own AWS credentials exporting enviromental variables for `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` or, alternatively set `AWS_PROFILE`.

4. Init with `terraform init`

5. Validate with `terraform validate`

6. Deploy with `terraform apply`

7. Destroy with `terraform destroy`

## SSH Keys

AWS requires to setup a pair of SSH keys to access the machines.
To do it go to [https://eu-west-3.console.aws.amazon.com/ec2/v2/home?region=eu-west-3#KeyPairs:](https://eu-west-3.console.aws.amazon.com/ec2/v2/home?region=eu-west-3#KeyPairs:) and create a key pair.
The keys must be created for an specific AWS region. In this example using Paris = `eu-west-3`.

- The public key will be retained by AWS.
- The private key is the one you are downloading. (Use the PEM format.)
- You need to place it under a `keys/` folder for running examples 1, 2 and 4.

For Windows users using Putty: Putty needs the key in an special format: PPK.
To convert the PEM file into a PPK use `puttygen.exe` to convert the key:

1. Load the PEM file
2. Save the private key as PPK file.

## Key Permissions

When using *.pem files for SSH (especially on Mac OS and Linux) ensure key file has read persmissions for the user only with the command:

```bash
chmod 600 <file>.pem
```

## Examples

1. Create a AWS EC2 virtual machine.
2. Deploy a complete static website in S3.
3. Create a AWS EC2 virtual machine + docker containers.
4. Create a complete CI Server: Teamcity with EC2 and docker.

## Disclaimer

Using samples in AWS accounts will incurr in small charges. Remember always to destroy your resources after finalizing the training if not in use.

## License

Licensed under CC BY [![CC BY](https://i.creativecommons.org/l/by/4.0/80x15.png)](http://creativecommons.org/licenses/by/4.0/)
(c) [Metadev](https://metadev.pro) 2021.
