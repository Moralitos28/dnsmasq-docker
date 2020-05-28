# Welcome to dnsmasq in Docker!

Hi! This is a fast and simple way to use dnsmasq for your linux-based server, this dockerfile is useful **only linux-based hosts**. Is know for me that in windows or mac, this container presents some errors, specially with networking. 

**Please read all the document**
# What is inside ?

In resume, only is dnsmasq running as "non daemon mode" for logging everything directly to your docker term.
For Running this image you should complete this steps:

 1.  Build the image, this step is optional if you don't want to use the server side pre built container "moralitos28/dnsmasq:latest"
 2. Configure the scope and ".conf" files
 3. Run the image and make a simple test.

# How to build this image ?
If you are extremely un-trustfull of my posted image in docker, first of all you shouldn't even use my container, but I am generous... run this command and you will see what's inside and every setup made.

This command had to be executed inside a folder with all config files.

    docker build ./ --tag user_name/image_name:##.##
  Replace the variables, with whatever fit in for you...

# Settings
Dnsmasq-docker is simple as a dnsmasq running in a container, for this the settings are the same, for further information use this [link](https://wiki.archlinux.org/index.php/dnsmasq).
The basic information is commented in the "./config/" there you have to change **TO YOUR IP AND ALL SETTINGS**.

# How to run ?

Simply clone the repository in your server and run with this command

    sudo docker run  --name dnsmasq -d  --net=host -v /config/:/etc/dnsmasq.d/ moralitos28/dnsmasq:latest
    
This command will create the container and run it, this needs permissions for network usage and will listen in your ip:53 port udp/tcp

Please note that use the flag **-v**, for mounting a volume.

I personally recommend if you will constantly use dnsmasq, instead running the image, use it as a service with docker compose.
## A funny fact.
Curusly when we were running dnsmasq-docker in debug mode there we realize that dnsmasq read form systemd-resolved the file  */etc/hosts*  in the host machine. This fact make dnsmasq a lot more easier to use as a dns server, but this point can be risky and vulnerable so I personal recommend to protect the whole server and system by implementing the common procedures for a standard dns server.
## Logs

This container has multiple ways to log whats happening:

 1.  Cat the log file. 
 `cat ./config/dnsmasq.log `
 
 2. Log the container with 
 `sudo docker logs dnsmasq`

 
## Docker-Compose
If your  intention is to use always as a service, of dhcp, dns .... this could be the best option to is docker-compose.yaml file as described.
For this, you only had to modify the **volume** mounting point **if** you move the folder.

Run this command in the folder where is docker-compose.yaml file:

     sudo docker-compose up -d

# Common Errors

Dnsmasq-docker can be hard to debug if you don't not this common procedures.

## Port 53 busy.

Systemd-resolv can cause this problem, the easiest way to resolv this is disabling the service temporarily or permanently de dns server.

For permanent solution simply run this command that will disable the dns server in your server

    sudo echo "DNSStubListener=no" >> /etc/systemd/resolved.conf
    sudo service systemd-resolved restart

For a temporary solution simply stop the service with
 

    sudo service systemd-resolved stop
  # Useful notes
  Here are some tricks and tips [link.](https://www.linux.com/topic/networking/advanced-dnsmasq-tips-and-tricks/)
  ## Restart Always yo modify something
  Just run :
  
	  sudo docker restart dnsmasq
# References and congrats!
To a sweeden men:
[https://github.com/Storytel/dnsmasq/blob/master/README.md](https://github.com/Storytel/dnsmasq/blob/master/README.md)
To a blog men:
[https://blog.csainty.com/2016/09/running-dnsmasq-in-docker.html](https://blog.csainty.com/2016/09/running-dnsmasq-in-docker.html)

This were some people who's his posts  this update were not possible.
