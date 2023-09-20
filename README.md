# exegol-docker-builder-custom
This repository hosts Dockerfiles and resources for building Exegol docker images

# Exegol usage to build custom images

## Conguration

Basically, the system is ready-to-go and can build docker images for exegol to use. But depending on your needs, you can wish to customise what is included in the image.

The dockerfiles are all quite the same, mostly specifying the base OS to use (docker image), and then calling the script "bootstrap-ansible.sh" to prepare and launch ansible playbook.

The ansible playbook ("playbook-base.yml") is the main configuration piece where you can select what is included in the image.

If you wish to create your own customization, duplicate the basic "playbook-base.yml", rename it (ex: "playbook-custom.yml"), and customize it.

Then, duplicate the dockerfile and rename it (ex: "custom.dockerfile"). In that custom docker file, update the call for your playbook : `./bootstrap-ansible.sh playbook-custom.yml`

## Build the docker image

Open a shell in exegol folder, then launch the build of "my-image-name" (name it as you want) :

```shell
exegol install my-image-name
```

or, to see the ansible output :

```shell
exegol install my-image-name -vv
```

Exegol wrapper will ask a few questions :

- `Do you want to download exegol resources? (~1G) [Y/n]:` : `n` not for me, but as you wish 😉
- `Do you want to build locally a custom image? [y/N]:` : `y` YES this is what we are doing

Exegol will then prompt you for which image to build :

```text
🐶 Profile
┌───────────┐
│ full      │
│ blackarch │
│ kali      │
└───────────┘

[?] Select a build profile (full):
```

Select the docker file-name to use, for example "blackarch" for the file "blackarch.dockerfile"

Now take a coffe whil the image is building. This will depend on your internet connection speed, and your CPU/drive configuration...

# Custom image usage

There is no distinction between official or custom images. You can use it as usual:

```shell
exegol start htb --disable-shared-network --vpn my_vpn_config.ovpn
```

# Removing

You can remove the image with :

```shell
exegol uninstall my-image-name
```

