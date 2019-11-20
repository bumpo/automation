# AWS Audit Script

## Pre Reqs

Ensure you have AWS Cli Installed: [Install Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

Ensure you have Programmatic access: [set up guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_cliwpsapi)


## How to run

Calling the script with no arguments will execute the audit on all regions within your default profile. 
You can call additional profiles by passing the profile name in your ~/.aws/config file as an argument: 

```./audit.sh myProfileName```
