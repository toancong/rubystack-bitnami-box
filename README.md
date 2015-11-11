# A Virtual Machine for Ruby on Rails Development

## Introduction

This project automates the setup of a development environment for working on Ruby on Rails using Bitnami installer. 

>
Bitnami native installers automate the setup of a Bitnami application stack on Windows, OS X or Linux. Each installer includes all of the software necessary to run out of the box (the stack).
https://bitnami.com/stack/ruby/installer

## Requirements

  - [VirtualBox](https://www.virtualbox.org/)
  - [Vagrant](http://vagrantup.com/)

## What's In The Box

Bitnami Ruby Stack 2.2.3-2 Dev (64-bit) ships with the following:
  - Ruby 2.2.3
  - RubyGems 1.8.12
  - Rails 4.2.4
  - ImageMagick 6.7.5
  - Subversion 1.8.13
  - SQLite 3.7.15.1
  - MySQL 5.5.45
  - Apache 2.4.16
  - PHP 5.5.30
  - phpMyAdmin 4.4.13.1
  - Git 2.6.1
  - Nginx 1.8.0
  - Sphinx 2.0.4
  - AWS SDK for Ruby 2.1.1
  - RVM 1.19.6 (Linux and OS X only)

## How To Build

Building the virtual machine is easy:
```
host $ git clone https://github.com/toancong/rubystack-bitnami-box
host $ cd rubystack-bitnami-box
host $ vagrant up
```

## How To Run

### Access the virtual machine
After the installation has finished, you can access the virtual machine with `vagrant ssh`
```
host $ vagrant ssh
Welcome to Ubuntu 14.04.3 LTS (GNU/Linux 3.13.0-67-generic x86_64)
...
vagrant@localhost:~$
```

### Check versions:
```
vagrant@localhost:~# ruby -v
ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-linux]
vagrant@localhost:~# gem -v
2.4.5.1
vagrant@localhost:~# rails -v
Rails 4.2.4
```

### Example rails app
```
vagrant@localhost:~$ rails new app
...<installing...>
vagrant@localhost:~$ cd app
vagrant@localhost:~/app$ rails server -b 0.0.0.0
=> Booting WEBrick
=> Rails 4.2.4 application starting in development on http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
[2015-11-11 03:27:21] INFO  WEBrick 1.3.1
[2015-11-11 03:27:21] INFO  ruby 2.2.3 (2015-08-18) [x86_64-linux]
[2015-11-11 03:27:21] INFO  WEBrick::HTTPServer#start: pid=21530 port=3000
```
In your browser, go to http://127.0.0.1:300 to see example site from Ruby on Rails.

Port 3000 in the host computer is forwarded to port 3000 in the virtual machine. Thus, applications running in the virtual machine can be accessed via localhost:3000 in the host computer. Be sure the web server is bound to the IP 0.0.0.0, instead of 127.0.0.1, so it can access all interfaces:
```
rails server -b 0.0.0.0
```

## License

Released under the MIT License, Copyright (c) 2015 Pham Cong Toan.
