# homebrew-security

Homebrew Tap Maintained by HashiCorp Security

Allows for private packages to be easily distributed to employee laptops

## Requirements

[Homebrew](https://brew.sh/)

## Usage / Installation

`$ brew tap hashicorp/security git@github.com:hashicorp/homebrew-security.git`

## Available Formulas

### [heisler](https://github.com/hashicorp/heisler)

Test binary named after a movie prop beer brand.  Flavors in shell, python, and golang.

`$ brew install hashicorp/security/heisler`


### [doormat-cli](https://github.com/hashicorp/doormat-cli)

CLI tool for [doormat](https://doormat.hashicorp.services/)

`$ brew install hashicorp/security/doormat-cli`

### [signore](https://github.com/hashicorp/signore)

CLI tool for the [signore](https://github.com/hashicorp/signore) signing service

`$ brew install hashicorp/security/signore`

### [scan](https://github.com/hashicorp/security-scanner)

CLI tool for the [security-scanner](https://github.com/hashicorp/security-scanner)

`$ brew install hashicorp/security/scan`

## FAQ

_Q. Can I clone this with an https-style repo reference, using a Personal Access Token?_

The formulas pulling from private repos are setup to use the SSH-based `git@github.com:` style repo references.  The easiest work-around if your flow is to clone from github via `https://github.com/`-prefixed references is to setup an additional local configuration to force all github repos to use that:

```
$ git config --global url."https://github.com/".insteadOf git@github.com:
```

(Thanks Joshua Bradley for the tip!)
