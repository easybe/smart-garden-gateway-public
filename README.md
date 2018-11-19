# Obtaining the Source Code #

The source code of this project is maintained with git.

```
git clone --recurse-submodules <repository>
cd smart-garden-gateway-public
```
# Prerequisites #

* The Yocto build host packages need [to be installed](https://www.yoctoproject.org/docs/2.5.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html#brief-build-system-packages)

# Build Instructions #

* Set TEMPLATECONF ```export TEMPLATECONF=${PWD}/yocto/meta-distribution/conf```
* Initiate build directory ```source yocto/openembedded-core/oe-init-build-env build-gardena```
* Run ```bitbake gardena-image-opensource-prod```

# Repository Layout #

This repository is a container, which contains our documentation and
build script, as well as submodules in the following structure

* ```/yocto```
    * ```/yocto/bitbake``` – the Bitbake build tool
    * ```/yocto/openembedded-core``` – OpenEmbedded core layer
    * ```/yocto/meta-mediatek``` – the MediaTek Board Support Package (BSP)
    * ```/yocto/meta-distribution``` – our own distribution (specifies packages to install)
    * ```/yocto/meta-gardena``` – our own code (testing, WiFi provisioning, etc.)
      communication between radio module and Seluxit OpenAPI
    * ```/yocto/meta-openembedded``` – Collection of layers for the OE-core universe
    * ```/yocto/meta-readonly-rootfs-overlay``` – Writable rootfs overlay on top of a read-only rootfs
    * ```/yocto/meta-swupdate``` – Update mechanism software


The script ```init_repo.sh``` can be used to initialize all submodules.
