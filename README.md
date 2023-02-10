# 42_born2beroot
Creating your own virtual machine, and setting up your own operating system while implementing strict rules.

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
    - [What is the difference between apt and aptitude?](#11)

<a name="0"></a>
# Introduction

<a name="1"></a>
### What is a virtual machine? 
> A virtual machine runs on a host machine using its own software.
- Virtual machines are also referred to as guest machines.
- It provides software resources (CPU, storage, network, etc).
- A virtual machine behaves just as a physical device. 
- It reduces physical architecture.

<a name="2"></a>
### What is a host machine?
> A host machine provides facilities to other computers and their users.
- It provides hardware resources to host virtual machines.
- Multiple virtual machines with various operating systems may be hosted on one host machine.

<a name="3"></a>
### What is a hypervisor?
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
- It provides a x86-processor, and therefore only suitable operating systems with the same processor architecture are supported.
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
- It emulates various processors:
   - ARM64
   - ARM32
   - MIPS
   - PPC
   - RISC-V
   
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
### What are the three concepts that LVM manages?
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
- It is a high-level tool (frontend), and it uses dpkg.
- It allows to administer an installed Debian system to retrieve and resolve package dependencies. 
- It is used to install .deb programs easily and without worrying about dependencies. 
- Further command-line programs are:
   - apt-get: installs and removes packages 
   - apt-cache: is used for searching packages and displaying package information 


aptitude = command line which offers a graphical interface, and allows the user to choose between different dependencies when installing a program 

 
SSH (Secure Shell) 

 Network communication protocol 

Secure and encrypted remote login  

Alternative to non-protected login protocols like telnet 

Cryptographic key pair = SSH keys (private and public) 

Configure the public key on a server to authorize access and grant anyone who has a copy of the private key access to the server 

Install openssh-server 

 Sudo apt install openssh-server 

 

Crontab  

File which contains the schedule of cron entries to be run and at specified times 

Mount points 

A directory on a file system that is logically linked to another file system 

Used to make the data on a different physical storage drive easily available in a folder structure 

 

Mount point for this partition (lsblk) 

/ 

 The root file system 

/boot 

 Static files of the boot loader 

/home 

 User home directories 

/tmp 

 Temporary files 

/usr 

 Static data 

/var 

 Variable data 

/srv 

Data for services provided by this system 

/opt 

 Add-on application software packages 

/usr/local 

Local hierarchy 

 

Commands 

sudo ufw status 

sudo addgroup user42 

sudo adduser lspohle user42 

getent group user42 

(sudo adduser test) 

passwd user (for current user) 

sudo crontab –u root (show crontab/file 

sudo crontab –u root –e (edit time)  
