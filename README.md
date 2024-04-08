# Born2BeRoot-Scripts

## Description

This repository contains scripts for the Born2BeRoot project, which aims to introduce users to the world of virtualization and system administration. Born2BeRoot is part of the 42 school curriculum.

## Table of Contents
1. [Introduction](#Introduction)
2. [Mandatory Part](#Mandatory-Part)
3. [Bonus Part](#Bonus-Part)
4. [Submission and Peer-Evaluation](#Submission-and-Peer-Evaluation)
5. [Files](#Files)

## Introduction

The Born2BeRoot project entails the setup of a minimal server environment. The virtual machine (VM) won't have a Graphical User Interface (GUI) except the terminal and will have security measures in place. Participants must adhere to specific rules outlined in the project description. 

## Mandatory Part

The mandatory part of the project involves setting up a VM with specific requirements, including:

* Installing Debian or Rocky on a virtual machine platform (VirtualBox or UTM)
* Setting up encrypted partitions using LVM.
* Configuring SSH service on port 4242.
* Implementing a firewall (UFW for Debian, firewalld for Rocky) allowing only port 4242.
* Implementing a strong password policy
* Implementing sudo user management
* Creating a script (monitoring.sh) that displays system information every 10 minutes after startup time.

## Bonus Part

The bonus part offers additional tasks: setting up partitions correctly, creating a functional WordPress website, and setting up a custom service. Bonus tasks are evaluated only if the mandatory part is completed perfectly.

I chose keyboard-configuration as my custom service, since this package simplifies the process of changing the keyboard layout in case evaluators have different preferences.

## Submission and Peer-Evaluation

Finishing the project requires submitting a repository with only a signature.txt file containing the signature of the virtual machine's virtual disk. This is followed by three 1-hour evaluations where the server is tested and where the examinee needs to explain every step of their setup.

## Files

* monitoring.sh: Script for displaying system information.
* sleep.sh: Script for setting the execution of monitoring.sh to the correct time.
  
With the following cronjob, the monitoring message will then be shown every 10 minutes *after startup*, as required by the subject:

``` */10 * * * * bash /path-to-script/sleep.sh && bash /path-to-script/monitoring.sh```

