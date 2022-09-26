# 2022-aid-mac-m1

This repository is provided as an auxiliary guide to run all the software used in the AID 2022 Course @ Tecnico on Apple Silicon Macs when needed. If you are using x86-64 you are better off using the [Virtual Machine AID_2022](http://groups.tecnico.ulisboa.pt/aid-meic/virtualbox/) you can **STOP reading here!**

# If you are using Apple Silicon Macs M1/M2+

In one hand, this guide will help you run MySQL server using Docker to keep it somewhat independent of any other software you have installed on your system.

On the other hand, the current version of this guide recommends the installation of Pentaho server and client-tools in your chosen directory.

Note: The lab guides were not updated to reflect this setup. The provided VM is still the recommended setup for this course. 

## Clone this repository

1. ```$ git clone https://github.com/flaviomartins/2022-aid.git```

If you are missing ```git``` you can [Download](https://github.com/flaviomartins/2022-aid/archive/refs/heads/main.zip) 

## Install MySQL

1. [Install Docker Desktop](https://docs.docker.com/desktop/install/mac-install/)

2. Open Terminal and move into this repo ```$ cd yourpath/2022-aid/```

3. Run ```$ docker-compose up``` on a Terminal window.

4. Keep the Terminal window open whenever you need access to the db.

## Install Java JDK 11

### Using Homebrew (recommended)

1. https://formulae.brew.sh/formula/openjdk@11


## Install the Pentaho 9.3

0. Consult the [Software List](http://groups.tecnico.ulisboa.pt/aid-meic/virtualbox/)

1. Download [Pentaho server](https://sourceforge.net/projects/pentaho/files/Pentaho-9.3/server/)

2. Download the necessary [Pentaho client-tools](https://sourceforge.net/projects/pentaho/files/Pentaho-9.3/client-tools/)

If you can help improve this guide send me a pull request!

Good luck!

Flávio