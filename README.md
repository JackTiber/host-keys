# Public SSH Keys

Simple bash script to pull down and add the public SSH keys for a group of GitHub accounts. Can be used when provisioning / comissioning hosts in a network, or as a cronjob to ensure the latest public keys are available on each host.

## Items to Add

- See if GitHub allows checking of an Organization for it's members to automate populating the USERS array
- Check if possible to use with other Git source control solutions like GitLab