# Docker Boilerplates 

## Table of Contents

1. [Overview](#1-overview)
2. [Structure And Usage](#2-structure-and-usage)
3. [Prerequisites](#3-prerequisites)
    - [3.1. Install Docker App to your machine](#31-install-docker-app-to-your-machine)
    - [3.2. Install docker-compose to your machine](#32-install-docker-compose-to-your-machine)    
4. [Contribution](#4-contribution)
5. [License](#5-license)

## 1. Overview
The goal of this repo is to host docker boilerplates (Or at least a reference for now) for different widely used technologies these days. The current status of this repo is:  
- [Javascript](./javascript) ✅  
- Python 🏗  
- PHP ⛔️  
- Java ⛔️  
- .Net ⛔️  
- Go ⛔️  
- Ruby ⛔️  
- Scala ⛔️  
- Elixir ⛔️  

(✅ ready, 🏗 in progress, ⛔️ not yet).

Once we have a reliable docker configuration for each platform, we can implement a CLI that can automatically install the boilerplate inside the project.

## 2. Structure And Usage
The project will have one folder dedicated for each technology, for example, if you want to dockerize a javascript base application, then you should check the [javascript](./javascript) directory. Each directory will have: 
  - Dockerfile
  - docker-compose.yml
  - docker-script<span></span>.sh (For running the boilerplate's scripts).
  - README<span></span>.md (For technology specific documentation).
## 3. Prerequisites 
### **3\.1\. Install Docker App to your machine**
You can install docker from [this link](https://docs.docker.com/install/).
### **3\.2\. Install docker-compose to your machine**
You can install docker-compose from [this link](https://docs.docker.com/compose/install/) 
## 4. Contribution
If you want to contribute to this project either by fixing/adding to an available technology or adding new technology to the repo, then please have a look at this [contribution guide](./CONTRIBUTING.md). 

## 5. License
This project is using Apache License, visit [this link](./LICENSE) in order to know more about the license. 