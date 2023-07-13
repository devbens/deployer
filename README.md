# GitHub Action for deploying repos to One.com sites

1. Create a `.github/workflows/main.yml` file in your root of your WordPress project/repo, if one doesn't exist already.

2. Add the following to the `main.yml` file, replacing <yourdomainname.com> and the public and private key var names if they were anything other than what is below. Consult "Furthur Reading" on how to setup keys in repo Secrets.

3. Git push your site repo.

```yml
name: Deploy to One.com

on:
  push:
    branches:
        - main

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: GitHub Deploy to One.com
      uses: devbens/deployer@master
      env:
          ONE_DOMAIN_NAME: yourdomainname.com
          ONE_SSH_KEY_PUBLIC: ${{ secrets.PUBLIC_KEY_NAME }}
          ONE_SSH_KEY_PRIVATE: ${{ secrets.PRIVATE_KEY_NAME }}
          TPO_SRC_PATH: ""
          TPO_PATH: ""
```

## Environment Variables & Secrets

### Required

| Name                  | Type                 | Usage                                                                                                 |
| --------------------- | -------------------- | ----------------------------------------------------------------------------------------------------- |
| `ONE_DOMAIN_NAME`     | Environment Variable | Insert the domain name of the One.com site you want to deploy to.                                     |
| `ONE_SSH_KEY_PRIVATE` | Secret               | Private SSH Key for deployment. See below for SSH key usage.                                          |
| `ONE_SSH_KEY_PUBLIC`  | Secret               | Public SSH Key for deployment. See below for SSH key usage and how to add your public key to One.com. |

### Optional

| Name           | Type                                                                                                                                                            | Usage |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----- |
| `TPO_SRC_PATH` | Optional path to specify a theme, plugin, or other directory source to deploy from. Ex. `"wp-content/themes/your-theme-here/"` . Defaults to "." Dir.           |
| `TPO_PATH`     | Optional path to specify a theme, plugin, or other directory destination to deploy to. Ex. `"wp-content/themes/your-theme-here/"` . Defaults to root directory. |

Store your public and private keys in the GitHub repository of your website as new 'Secrets' (under your repository settings) using the names `PRIVATE_KEY_NAME` and `PUBLIC_KEY_NAME` respectively with the name in your specfic files. These can be customized, just remember to change the var in the yml file to call them correctly.

## Add up your public SSH key for your One.com site.

1. `$ mkdir .ssh`.
2. `$ touch authorized_keys`.
3. Paste pub key
