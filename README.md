# 2022-aid-mac-m1

This repository is provided as an auxiliary guide to run all the software used in the AID 2022 Course @ Tecnico on Apple Silicon Macs when needed. If you are using x86-64 you are better off using the [Virtual Machine AID_2022](http://groups.tecnico.ulisboa.pt/aid-meic/virtualbox/) you can **STOP reading here!**

# If you are using Apple Silicon Macs M1/M2+

In one hand, this guide will help you run MySQL server using Docker to keep it somewhat independent of any other software you have installed on your system.

On the other hand, the current version of this guide recommends the installation of Pentaho server and client-tools in your chosen directory.

Note: The lab guides were not updated to reflect this setup. The provided VM is still the recommended setup for this course. 

## Clone this repository

0. Open a Terminal window and move to your directory of choice

1. ```$ git clone https://github.com/flaviomartins/2022-aid.git```

If you are missing ```git``` you can [Download](https://github.com/flaviomartins/2022-aid/archive/refs/heads/main.zip) 

## Install MySQL

1. [Install Docker Desktop](https://docs.docker.com/desktop/install/mac-install/)

2. Open a Terminal window and move into this repo

3. ```$ cd yourpath/2022-aid/```

4. ```$ docker-compose up```

4. Keep the Terminal window open whenever you need access to the db.

5. Open another Terminal window to run mysql client after moving to the data directory.

6. ```docker-compose exec db bash -c "cd /tmp/data/ && mysql -u aid -p"```

7. Enter the the password: aid

8. Lets try to list the data/ files. Run ```mysql> system ls -l``` to list the files.

## Alternatives to MySQL Workbench

### Adminer

1. Visit the [Adminer page](http://localhost:8080) (Included)

2. Enter the credentials

### Install Sequel Ace

1. https://apps.apple.com/us/app/sequel-ace/id1518036000?mt=12

2. Open Sequel Ace

3. Enter the credentials


## Install Java JDK 11

### Using Homebrew (recommended)

1. [Install Homebrew](https://brew.sh/)

2. ```brew install openjdk@11```


## Install Rosetta 2

Rosetta 2 enables a Mac with Apple silicon to use apps built for a Mac with an Intel processor.

1. Run ```$ softwareupdate --install-rosetta``` in a Terminal window.

Here is how you can force the shell to run in Intel mode so that you can continue working in this little command-line Rosetta Island while waiting for native ARM64 support.

1. Open the Terminal app.

2. Open the Terminal app’s Preferences.

3. Click on the Profiles tab.

4. Select a profile, click on the ellipsis at the bottom of the profile list and then select Duplicate Profile.

5. Click on the new profile and give it a good name. I named mine as “Terminal (Intel)”.

6. Also in the new profile, click on the Window tab. In the Title, put a name to indicate that this is for running Intel-based apps. I put “Terminal (Intel)” on mine.

7. Click on the Shell tab and use the following as its Run Command to force the shell run under Rosetta: ```env /usr/bin/arch -x86_64 /bin/zsh --login```

Untick the Run inside shell checkbox. Clearing the checkbox would prevent running the shell twice, which could bloat your environment variables since `~/.zshrc` gets run twice.


## Install the Pentaho 9.3 (Work in Progress on aarch64)

0. Consult the [Software List](http://groups.tecnico.ulisboa.pt/aid-meic/virtualbox/)

1. Download the necessary [Pentaho client-tools](https://sourceforge.net/projects/pentaho/files/Pentaho-9.3/client-tools/)

2. Create a home directory `~/Pentaho/` to install the tools.

3. Most tools seem to run if launched from the `Terminal (Intel)` profile with the exception of PDI. Lets fix that.

### Pentaho Data Integration 

1. The PDI tool should be installed at `~/Pentaho/data-integration/`.

2. To run on Apple Silicon we need to replace the bundled version of SWT at `~/Pentaho/data-integration/libswt/osx64/swt.jar` with the `swt.jar` for `aarch64` inside this zip [swt-4.26M1-cocoa-macosx-aarch64.zip](https://download.eclipse.org/eclipse/downloads/drops4/S-4.26M1-202209281800/swt-4.26M1-cocoa-macosx-aarch64.zip)

3. Now open a Terminal window and switch to the `Terminal (Intel)` profile and move into the directory of PDI ```$ cd ~/Pentaho/data-integration/```.

4. You can now run PDI with ```$ ./spoon.sh```.


-- 
If you can help improve this guide send me a pull request!

Good luck!

Flávio
