# 2022-aid-mac-m1

This repository is provided as an auxiliary guide to run all the software used in the AID 2022 Course @ Tecnico on Apple Silicon Macs when needed. If you are using x86-64 you are better off using the [Virtual Machine AID_2022](http://groups.tecnico.ulisboa.pt/aid-meic/virtualbox/) you can **STOP reading here!**

# If you are using Apple Silicon Macs M1/M2+

In one hand, this guide will help you run MySQL server using Docker to keep it somewhat independent of any other software you have installed on your system.

On the other hand, the current version of this guide recommends the installation of Pentaho server and client-tools in your chosen directory.

Note: The lab guides were not updated to reflect this setup. The provided VM is still the recommended setup for this course. 


## Homebrew (recommended)

You should have Homebrew installed on your system before following this guide.

1. Follow the instructions here: [Install Homebrew](https://brew.sh/)

2. Install your first package ```$ brew install git```


## Clone this repository

0. Open a Terminal window and move to your directory of choice

1. ```$ git clone https://github.com/flaviomartins/2022-aid.git```


## Install MySQL (Docker)

1. [Install Docker Desktop](https://docs.docker.com/desktop/install/mac-install/)

2. Open a Terminal window and move into this repo

3. ```$ cd yourpath/2022-aid/```

4. ```$ docker-compose up```

4. Keep the Terminal window open whenever you need access to the db.

5. Open another Terminal window to run mysql client after moving to the data directory.

6. ```docker-compose exec db bash -c "cd /tmp/data/ && mysql -u aid -p"```

7. Enter the the password: aid

8. Lets try to list the data/ files. Run ```mysql> system ls -l``` to list the files.


## MyCLI

MyCLI is a command line interface for MySQL, MariaDB, and Percona with auto-completion and syntax highlighting.

You can opt to run MyCLI instead of `mysql` client for the improvements in ease of use.

1.  ```$ docker-compose run mycli -h db -u aid -p aid```


## MySQL Workbench Alternatives

MySQL Workbench is crashing on the Apple Silicon Macs.

### Adminer (Web App on port 8000)

1. Visit the [Adminer page](http://localhost:8000)

2. Enter the credentials

### Install Sequel Ace (Native App)

1. https://apps.apple.com/us/app/sequel-ace/id1518036000?mt=12

2. Open Sequel Ace

3. Enter the credentials


## Install Java JDK 11

### Install OpenJDK 11

1. ```brew install openjdk@11```

2. ```sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk```

### Install JEnv to set OpenJDK 11 as the default JDK

1. ```brew install jenv```

2. To activate jenv, add the following to your `~/.zshrc`:
    ```
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
    ```

On a new Terminal window the command `jenv` is available 

1. ```$ jenv add /Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home/```

2. ```$ jenv global 11.0```

3. ```$ jenv shell 11.0```

4. ```$ java -version``` should display something like the following:
    ```
    openjdk version "11.0.16.1" 2022-08-12
    OpenJDK Runtime Environment Homebrew (build 11.0.16.1+0)
    OpenJDK 64-Bit Server VM Homebrew (build 11.0.16.1+0, mixed mode)
    ```


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

8. Untick the Run inside shell checkbox. Clearing the checkbox would prevent running the shell twice, which could bloat your environment variables since `~/.zshrc` gets run twice.


## Install the Pentaho 9.3 (Work in Progress on aarch64)

0. Consult the [Software List](http://groups.tecnico.ulisboa.pt/aid-meic/virtualbox/)

1. Download the necessary [Pentaho client-tools](https://sourceforge.net/projects/pentaho/files/Pentaho-9.3/client-tools/)

2. Create a home directory `~/Pentaho/` to install the tools.

3. Most tools seem to run if launched from the `Terminal (Intel)` profile with the exception of PDI. Lets fix that next.


### Pentaho Data Integration 

1. The PDI tool should be installed at `~/Pentaho/data-integration/`.

2. To run on Apple Silicon we need to replace the bundled version of SWT at `~/Pentaho/data-integration/libswt/osx64/swt.jar` with the `swt.jar` for `aarch64` inside this zip [swt-4.26M1-cocoa-macosx-aarch64.zip](https://download.eclipse.org/eclipse/downloads/drops4/S-4.26M1-202209281800/swt-4.26M1-cocoa-macosx-aarch64.zip)

3. Now open a Terminal window and switch to the `Terminal (Intel)` profile and move into the directory of PDI ```$ cd ~/Pentaho/data-integration/```.

4. You can now run PDI with ```$ ./spoon.sh```.

5. Do not forget to install the [mysql-connector-java](https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.30.zip) driver. Copy the `.jar` file inside the ZIP to the `~/Pentaho/data-integration/lib/` directory. When adding a new Database connection select MySQL and then JDBC (native).

### Pentaho Schema Workbench

We just need to add the JDBC MySQL Connector Driver to the Schema Workbench `lib/` directory and use a different class name. Just follow the instructions here.

1. Do not forget to install the [mysql-connector-java](https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.30.zip) driver. Copy the `.jar` file inside the ZIP to the `~/Pentaho/schema-workbench/lib/` directory.

2. Create a new `Database connection` in `Options -> Connection...` and enter the desired name.

3. For the `Connection type` select `Generic database` and `JDBC (native)`.

4. For the `Custom connection URL` enter `jdbc:mysql://localhost/mydatabase`.

5. For the `Custom driver class name` enter `com.mysql.cj.jdbc.Driver`.

6. Enter the username `aid` and password `aid` as per usual.

6. Click `Test` to check if a connection is made.

## Install DataCleaner

1. Download latest [DataCleaner (Community Edition)](https://datacleaner.github.io/downloads)

2. Unzip it into `~/Pentaho/` and it will create the `~/Pentaho/DataCleaner/` directory.

3. `$ cd ~/Pentaho/DataCleaner/`

4. `$ ./datacleaner.sh`

5. [Installing database drivers in DataCleaner desktop](https://datacleaner.github.io/docs/5.7.0/html/ch13s01.html) is done in the application itself while it is running.


### Pentaho Server and Saiku

1. Download the necessary [Pentaho server](https://sourceforge.net/projects/pentaho/files/Pentaho-9.3/server/)

2. The Pentaho Server should be installed at `~/Pentaho/pentaho-server/`

3. Add `export PENTAHO_JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home"` to `~/.zshrc` to force OpenJDK 11.

4. Also, add a line with `export JAVA_HOME` before `sh startup.sh` on the `start-pentaho.sh` script so the `startup.sh` script picks the variable up: 

```bash
  export JDK_JAVA_OPTIONS

  JAVA_HOME=$_PENTAHO_JAVA_HOME
  export JAVA_HOME

  sh startup.sh
fi
```

5. Install [Saiku Analytics with fix for Pentaho 9](https://github.com/ambientelivre/saiku-fix)


6. Open a new Terminal window move to `cd ~/Pentaho/pentaho-server/` and run `./start-pentaho.sh`.


--- 


Submit and issue if you have one for me. Also, if you can help me improve this guide send a pull request!


Good luck!

Flávio
