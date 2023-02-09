# 42_born2beroot
Creating your own virtual machine, and setting up your own operating system while implementing strict rules.

### What is a host machine? 
- It provides hardware resources to host virtual machines.
- Multiple virtual machines with various operating systems may be hosted on one host machine.

### What is a guest machine? 
- Virtual machines are also referred to as guest machines.
- It provides software resources (CPU, storage, network, etc).
- A virtual machine behaves just as a physical device. 
- It reduces physical architecture.

### What is a hypervisor?
- It is a type of computer software, firmware or hardware to create and run virtual machines.
- It presents the guest operating systems with a virtual operating platform.
- It manages the execution of the guest operating systems.
- It uses parts of the host machine’s CPU to distribute it to the VM. 
- Multiple operating systems may share the virtualized hardware resources. 
- Type 1 = native hypervisor 
- Type 2 = hosted hypervisor 

Oracle VM VirtualBox 

 Hypervisor 

A type-2 hypervisor for x86 and AMD64/Intel64 virtualization 

Developed by Oracle Corporation 

Freely available as Open Source Software under the terms of the GNU General Public License 

Runs on Windows, Linux, macOS, and Solaris 

Hosts guest operating systems including Windows (NT 4.0, 2000, XP, Server 2003, Vista, Windows 7, Windows 8, Windows 10), DOS/Windows 3.x, Linux (2.4, 2.6, 3.x and 4.x), Solaris and OpenSolaris, OS/2, and OpenBSD 
 

Debian GNU/Linux 

 Operating system based on the Linux kernel 

One of the oldest operating systems based on the Linux kernel 

Allows the system administrator to restrict the actions that processes can perform 

 

AppArmor 

Linux kernel security module 

Provides Mandatory Access Control (MAC)  

Restrict capabilities of processes running on the host operating system 

Each process can have its own security profile 

Profiles can work in complain-mode (only reports policy violation attempts) or in enforce-mode (all violations are stopped and rules are enforced) 

Comparison between mandatory access control systems 

AppArmor 

Uses security profiles based on paths 

First: Granting access 

Then: Applying restrictions 

SELinux 

Uses security policies based on file labels 

First: Restricting access to all applications by default 

Then: Granting access only to users that present proper certifications 

 

 

 

LVM (Logical Volume Manager) 

 Abstraction layer between a storage device and a file system 

Manages logical volumes, or filesystems 

Much more advanced and flexible than the traditional method of partitioning a disk into one or more segments and formatting that partition with a filesystem 

Uses free space anywhere in the Volume Group, even on another disk 

Allows you to freeze an existing Logical Volume in time (you can later return to that state if you mess things up) 

Can manage Logical Volumes while the Linux system is running (no need to reboot the system to make kernel aware of newly-created partitions)  

Three concepts that LVM manages: 

Volume Groups  

Collection of physical and logical volumes 

Typical systems only need one Volume Group (recommendation: name after the name of the machine) 

Physical Volumes 

Correspond to disks 

Block devices that provide the space to store logical volumes 

Logical Volumes 

Correspond to partitions (“dynamic partitions”) 

Hold a filesystem 

Unlike partitions: logical volumes get names rather than numbers, they can span across multiple disks, and do not have to be physically contiguous 

DPKG 

 Default package manager  

A low-level tool 

The software at the base of the package management system in Debian 

dpkg is used to install, remove, and provide information about .deb packages 

 

APT (Advanced Packaging Tool) 

 Tool to install all necessary dependencies when installing a program 

A high-level tool 

A tool that uses dpkg 

Allows administering an installed Debian system to retrieve and resolve package dependencies 

Tool to install all the necessary dependencies when installing a program 

Install .deb programs easily and without worrying about dependencies 

apt-get = installs and removes packages 

apt-cache = is used for searching packages and displaying package information 

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
