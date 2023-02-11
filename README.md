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
    - [What distinguishes apt from aptitude?](#11)
    - [What is SSH?](#12)
    - [What is crontab?](#13)
    - [What are mount points?](#14)

<a name="0"></a>
# Introduction

<a name="1"></a>
### What is a [virtual machine](https://www.vmware.com/topics/glossary/content/virtual-machine.html)? 
> A virtual machine runs on a host machine using its own software.
- Virtual machines are also referred to as guest machines.
- It provides software resources (CPU, storage, network, etc).
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
