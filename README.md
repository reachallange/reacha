# reacha
This is the implementation of dpeloyment of the 'hello world' aplicaiton as described by the REA challenge


### Usage
There are 2 ways to run this project

1. A simple clone onto a machine
    - ssh to a CentOS-7 vanilla machine
 ```sh
$ sudo su - 
$ yum install -y git
$ git clone https://github.com/reachallange/reacha.git
$ cd reacha
$ ./launch
```

2. The project contains a Vagrantfile. This will allow you to use vagrant to start a CentOS7 machine to run the project on.
    - clone the project into your computer
    - cd into the root folder reacha
    - Start the vagrant machine (vagrant up)
    - ssh into the vagrant machine (vagrant ssh)
```sh
$ sudo su - 
$ cd /home/vagrant/sync
$ ./launch
```

NOTE: it is assumed that you computer has vagrant and a VM provider installed (such as VirtualBox). This Readme does not cover the setup of vagrant


### Tech
The solution uses:
- bash scripts
- ruby
- rake
- puppet
- git



### Output
- install some prequisites onto the machine: puppet, git and so on...
- install some required puppet modules from puppet forge
- install apache as well as apache mod passenger 
- clone the https://github.com/tnh/simple-sinatra-app repo
- install the "hello world" app onto passenger and serve it via apache


### NOTES
- to save time, since this is a demo, I've used the root user to do the installation,  against best practices (also bundler should not be run with root).

- Some of the puppetforge modules I'm using seems to have some depricated functionality in them (might be old dependencies, probably an improvement for the future)

- This project has been tested on the Vagrant machine option. The Machine is pre-configured to have tunneling between port 80 of the vagrant machine and port 8080 of the host running it. To test the app once the vagrant machine is up and the launch script has been run point your browser to: http://localhost:8080

- for security reasons most of the default mods in puppetforge apache have been disabled. Moreover, apache has it's own user to run under.

- it is assumed that the machine on which this project is run has access to the internet
