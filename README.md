# 42_born2beroot
In Born2BeRoot you create your own virtual machine in VirtualBox or UTM, and set up your own operating system while implementing strict rules.

# Table of content

1. [Introduction](#0)

    - [What is a virtual machine?](#1)
    - [What is a host machine?](#2)
    - [What is a hypervisor?](#3)
    - [What is VirtualBox?](#4)
    - [What is UTM?](#5)
    - [What is AppArmor?](#6)
    - [What is the difference between the following mandatory access control systems?](#7)
    - [What are the three concepts that LVM manages?](#8)
    - [What is dpkg?](#9)
    - [What is apt?](#10)
    - [What distinguishes apt from aptitude?](#11)
    - [What is SSH?](#12)
    - [What is crontab?](#13)
    - [What are mount points?](#14)
    
2. [SUDO](#15)

    - [Installing sudo](#16)
    - [Verifying sudo](#17)
    - [Granting sudo priviliges to an existing user](#18)
    - [Configuring sudo](#19)
    
3. [SSH](#20)

    - [Installing SSH](#21)
    - [Configuring SSH](#22)
    - [Verifying SSH](#23)

3. [UFW](#24)

    - [Installing ufw](#25)
    - [Configuring ufw](#26)
    - [Verifying ufw](#27)
    - [Connecting to a server via SSH](#28)

4. [Password policy](#29)

    - [Setting up a strict password policy](#30)

5. [User](#)

    - [Creating a new user](#)
    - [Creating a new group](#)
    - [Adding a user to a group](#)
    - [Removing a user from a group](#)
    - [Deleting a user](#)
    - [Deleting a group](#)
    
6. [Defense](#)

    - [The operating system - Debian](#)
      - [What is AppArmor?](#6)
      - [What is the difference between the following mandatory access control systems?](#7)
      - [What is apt?](#10)
      - [What distinguishes apt from aptitude?](#11)
    - [SSH](#)
      - [Verifying SSH](#23)
      - [Creating a new user](#)
      - [Adding a user to a group](#)
      - [Connecting to a server via SSH](#28)
    - [UFW](#)
      - [Verifying ufw](#27)
    - [Hostname](#)
      - [Modifying the hostname](#)
    - [Monitoring.sh](#)
      - Explaination
      - Interruption without modification
    - [Bonus](#)
      - Justifying the service of choice - FTP
    
<a name="0"></a>
# Introduction

<a name="1"></a>
### What is a [virtual machine](https://www.vmware.com/topics/glossary/content/virtual-machine.html)? 
> A virtual machine runs on a host machine using its own software.
- Virtual machines are also referred to as guest machines.
- A virtual machine behaves just as a physical device. 
- It reduces physical architecture.

<a name="2"></a>
### What is a [host machine](https://www.geeksforgeeks.org/difference-between-host-and-guest-operating-system/)?
> A host machine provides facilities to other computers and their users.
- It provides hardware resources to host virtual machines.
- Multiple virtual machines with various operating systems may be hosted on one host machine.

<a name="3"></a>
### What is a [hypervisor](https://www.vmware.com/topics/glossary/content/hypervisor.html)?
> A hypervisor is a type of computer software, firmware or hardware to create and run virtual machines.
- It presents the guest operating systems with a virtual operating platform.
- It manages the execution of the guest operating systems.
- It uses parts of the host machine’s CPU to distribute it to the VM. 
- Multiple operating systems may share the virtualized hardware resources. 
- Different types of hypervisors
   - Type 1 = native hypervisor 
   - Type 2 = hosted hypervisor 

<a name="4"></a>
### What is [VirtualBox](https://www.virtualbox.org)?
> VirtualBox is a hypervisor. A software program to create and run virtual machines.
- It provides support for pysical devices with x86 and AMD64/Intel64 architecture.
- It is developed by Oracle Corporation.
- It is freely available as Open Source Software under the terms of the GNU General Public License.
- Those are the supported operating systems of host machines: 
   - Windows
   - Linux
   - macOS
   - Solaris 
- Those are the supported operating systems of guest machines: 
   - Windows (NT 4.0, 2000, XP, Server 2003, Vista, Windows 7, Windows 8, Windows 10)
   - DOS/Windows 3.x
   - Linux (2.4, 2.6, 3.x and 4.x)
   - Solaris and OpenSolaris
   - OS/2
   - OpenBSD 
 
<a name="5"></a>
### What is [UTM](https://mac.getutm.app)?
> UTM is Apple's hypervisor. A software program to create and run virtual machines.
- It was created for macOS and only for Apple platforms.
-  Those are the supported architecures of operating systems of guest machines: 
   - ARM64 (MacBook Pro, for instance)
   - x86/x64 (Intel Macs, for instance)
   
<a name="6"></a>
### What is [Debian](https://www.debian.org)?
> It is an operating system based on the Linux kernel like Ubuntu, for instance.
 
<a name="6"></a>
### What is [AppArmor](https://apparmor.net)?
> AppArmor is a Linux application security system.
- It provides Mandatory Access Control (MAC).
- It allows the system administrator to restrict the actions that processes can perform. 
- Each process can have its own security profile.
- Those profiles can work in different modes:
   - complain-mode: only reports policy violation attempts
   - enforce-mode: all violations are stopped and rules are enforced

<a name="7"></a>
### What is the difference between the following mandatory access control systems?
|[AppArmor](https://apparmor.net)|[SELinux](https://www.redhat.com/en/topics/linux/what-is-selinux)|
|--------|-------|
|Uses security profiles based on paths|Uses security policies based on file labels|
|Firstly, granting access|Firstly, restricting access to all applications by default|
|Secondly, applying restrictions|Secondly, granting access only to users that present proper certifications|

<a name="7"></a>
### What is [LVM](https://wiki.ubuntuusers.de/Logical_Volume_Manager/)?
> The Logical Volume Management is an abstraction layer between a storage device and a file system.
- It manages Logical Volumes, or filesystems.
- It is much more advanced and flexible than the traditional method of partitioning a disk into one or more segments and formatting that partition with a filesystem.
- Those are the mejor benefits of LVM:
   - It uses free space anywhere in the Volume Group, even on another disk. 
   - It allows you to freeze an existing Logical Volume in time (you can later return to that state if you mess things up).
   - It can manage Logical Volumes while the Linux system is running. There is no need to reboot the system to make kernel aware of newly-created partitions.  

<a name="8"></a>
### What are the [three concepts](https://www.digitalocean.com/community/tutorials/an-introduction-to-lvm-concepts-terminology-and-operations) that LVM manages?
- Volume Groups  
   - They are a collection of physical and logical volumes.
   - A typical systems only need one Volume Group (recommendation: name after the name of the machine).
- Physical Volumes 
   - They correspond to disks.
   - They block devices that provide the space to store logical volumes. 
- Logical Volumes 
   - They correspond to partitions (“dynamic partitions”). 
   - They hold a filesystem.
   - Unlike partitions: Logical Volumes get names rather than numbers, they can span across multiple disks, and do not have to be physically contiguous. 

<a name="9"></a>
### What is [dpkg](https://debian-handbook.info/browse/de-DE/stable/sect.manipulating-packages-with-dpkg.html)?
> dpkg is a default package manager.
- It is a low-level tool (backend).
- It is the software at the base of the package management system in Debian. 
- It is used to install, remove, and provide information about .deb packages. 

<a name="10"></a>
### What is [apt](https://en.wikipedia.org/wiki/APT_(software))?
> apt is an advanced packaging tool to install all necessary dependencies when installing a program.
- It uses dpkg.
- It allows to administer an installed Debian system to retrieve and resolve package dependencies. 
- It is used to install .deb programs easily and without worrying about dependencies. 
- Further command-line programs are:
   - apt-get: installs and removes packages 
   - apt-cache: is used for searching packages and displaying package information 

<a name="11"></a>
### What distinguishes apt from [aptitude](https://wiki.ubuntuusers.de/aptitude/)?
> aptitude is a higher-level package manager frontend that happens to have a command-line interface that resembles apt-get.
- It provides a graphical interface, whereas apt-get does not. [Here](https://unix.stackexchange.com/questions/767/what-is-the-real-difference-between-apt-get-and-aptitude-how-about-wajig) are more information. 
- It contains the functionalities of apt-get, apt-mark, and apt-cache. [Here](https://www.fosslinux.com/43884/apt-vs-aptitude.htm) are more information.

<a name="12"></a>
### What is [SSH](https://en.wikipedia.org/wiki/Secure_Shell)?
> Secure Shell is a network communication protocol.
- It ensures secure and encrypted remote login.
- It is an alternative to non-protected login protocols like telnet. 
- It consistes of a cryptographic key pair ([SSH keys](https://www.ssh.com/academy/ssh/public-key-authentication)).
   - private
   - public 
- Configure the public key on a server to authorize access and grant anyone who has a copy of the private key access to the server. 

<a name="13"></a>
### What is [crontab](https://man7.org/linux/man-pages/man5/crontab.5.html)?
> A file used to schedule the execution of programs.
- It contains the schedule of cron entries to be run and at specified times.

<a name="14"></a>
### What are [mount points](https://linuxhint.com/mount-point-linux/)? 
> Mount points are directories on a file system that are logically linked to another file system. 
- They are used to make the data on a different physical storage drive easily available in a folder structure.

### Mount point for the sda5 partition of Born2BeRoot

|Mount points|Descriptions|
|--------|-------|
|/ |The root file system|
|/boot|Static files of the boot loader|
|/home|User home directories|
|/tmp|Temporary files|
|/usr|Static data|
|/var|Variable data|
|/srv|Data for services provided by this system | 
|/opt|Add-on application software packages|
|/usr/local|Local hierarchy| 

<a name="15"></a>
# SUDO

<a name="16"></a>
### 1. Installing sudo

- Log in as super user, and verify your login with the root password.

      su 
- Install sudo as a super user. 

      apt install sudo

<a name="17"></a>
### 2. Verifying sudo
- Verify that sudo is installed.
    
      sudo -V
      
<a name="18"></a>
### 2. Granting sudo priviliges to an existing user

- Add the user to the group of sudoers.

      sudo adduser <user> sudo
- Verify that the user is added to the group of sudoers.
    
      getent group sudo
- Reboot your VM. In doing so the changes you made will take effect, and therefore the aforementioned user gains sudo privileges.
    
      reboot
      
<a name="19"></a>
### 3. Configuring sudo

- Configure sudo with nano or vim.

      sudo nano /etc/sudoers.d/<filename>
- Limit authentication using sudo to 3 attempts in the event of an incorrect password.
    
      Defaults  passwd_tries=3
- Customize a message of your choice that has to be displayed if an error due to a wrong password occurs when using sudo.

      Defaults  badpass_message="your_desired_message"
- Archive each action using sudo, both inputs and outputs. The log file has to be saved in the /var/log/sudo/ folder.

      Defaults  logfile="/var/log/sudo/sudo.log"
      Defaults  log_input,log_output 
      Defaults  iolog_dir="/var/log/sudo" 
- Enable the TTY (TeleTYpewriter) mode for security reasons.

      Defaults  requiretty
- Restrict the paths that can be used by sudo for security reasons.

      Defaults  secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
      
<a name="20"></a>
# SSH

<a name="21"></a>
### 1. Installing SSH

- Install the [OpenSSH server application](https://ubuntu.com/server/docs/service-openssh), and related support files, use this command at a terminal prompt.

      sudo apt install openssh-server

<a name="22"></a>
### 2. Configuring SSH

- Configure SSH with nano or vim. Change the default [Port 22](https://www.ssh.com/academy/ssh/port) for SSH to 4242.

      sudo nano /etc/ssh/sshd_config
- Disable connecting using SSH as root for security reasons.

      PermitRootLogin no

<a name="23"></a>
### 3. Verifying SSH

- Verify the status of SSH.

      sudo systemctl status ssh
  or
  
      sudo service ssh status
      
<a name="24"></a>
# UFW

<a name="25"></a>
### 1. Installing ufw

- Install ufw (uncomplicated firewall).

      sudo apt install ufw
      
<a name="26"></a>
### 2. Configuring ufw
- Enable the firewall.

      sudo ufw enable
- Allow incoming SSH connections using Port 4242.

      sudo ufw allow 4242

<a name="27"></a>
### 3. Verifying ufw

- Verify the status of ufw.

      sudo ufw status
  or
  
      sudo ufw status numbered
  or
  
      sudo service ufw status 
      
<a name="28"></a>
### 4. Connecting to a server via SSH

- Display the IPv4 address of your VM.

      hostname -I
  or
  
      ip a
- Connect to your VM via SSH.

      ssh <username>@<ipv4-address> -p <port> 
- Disconnect from your VM.

      logout
  or
  
      exit
- Shut down your VM.

      sudo shutdown now
  or
  
      sudo shutdown

<a name="29"></a>
# Password policy

- Install libpam-pwquality package.

      sudo apt install libpam-pwquality
- Edit the following file.

      retry=3 minlen=10 ucredit=-1 dcredit=-1 lcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root
      
<a name=""></a>
# User management

<a name=""></a>
### 1. Creating a new user

    sudo adduser <user>
      
<a name=""></a>
### 2. Creating a new group
    
    sudo addgroup <group>

<a name=""></a>
### 3. Adding a user to a group
    
    sudo adduser <user> <group>

<a name=""></a>
### 4. Removing a user from a group

    sudo deluser <user> <group>
    
<a name=""></a>
### 5. Deleting a user
- Delete a user.

      sudo deluser <user>
- Remove a user and its home directory.

      sudo deluser --remove-home <user>
- Remove all files associated with a user.

      sudo deluser --remove-all-files <user>

<a name=""></a>
### 6. Deleting a group
- Delete a group.

      sudo delgroup <group>

<a name=""></a>
# Defense

<a name=""></a>
### Modifying the hostname
- Display the current hostname.

      hostname
- [Modify the hostname of a Debian Linux 11/10](https://www.cyberciti.biz/faq/how-to-change-hostname-on-debian-10-linux/).

      sudo hostnamectl set-hostname <your_desired_hostname>
- Edit the following file by replacing all references from the former name with the newly created hostname.
      
      sudo nano /etc/hosts
