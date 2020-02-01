# Contributing to Docker Boilerplates

## Table of Contents

1. [Understand The Context](#1-understand-the-context)
2. [Practices to keep in mind](#2-practices-to-keep-in-mind)
3. [Contribution Types](#3-contribution-types)
    - [3.1. Contributing to an existing technology boilerplate](#31-contributing-to-an-existing-technology-boilerplate)
    - [3.2. Adding a new technology boilerplate](#32-adding-a-new-technology-boilerplate)
    - [3.3. Contributing to the core practices we are following here](#33-contributing-to-the-core-practices-we-are-following-here)
4. [License](#4-license)
   


## 1. Understand The Context
Before start contributing to this project, please have a quick look at one of biolerplates that is already out there in this repo. By doing this you will get an idea on the ethos we are following in this project. Please refer back to the project documentation and have a look at any technology you like from there.

## 2. Practices to keep in mind
Keep in mind those practices while you are contributing to this project 👇.
```
- Use relatively small images (Alpine, slim, distroless).
- Use a specific version for your dependencies instead of the latest.
- use .dockerignore to ignore big irrelevant directories to reduce image size.
- Don't copy the whole project in one command.
- Use a Multi-Stage Docker build. 
```
## 3. Contribution Types
### **3\.1\. Contributing to an existing technology boilerplate**
You are free to add anything to any existing technology boilerplate. as long as it follow those concepts:
```
- It is not violating the practices mentioned above 👆.
- It is not considered under point 3.3 **Contributing to the core practices we are following here** 👇.
- Make sure that you mention the reason behind this change in your pull request. Also consider updating the documentation if necessary.
```
### **3\.2\. Adding a new technology boilerplate**
When adding a new boilerplate, make sure that your having all the items in this checklist:
```
- A Dockerfile ☑️
- A docker-compose file with version '3.7' ☑️
- Make sure that your docker-compose file have at least three services (dev, production and test) ☑️
- README.md file with the proper documentation ☑️
- Copy the docker-script.sh file from any working boilerplate and make sure that it runs with your one ️️☑️
```
### **3\.3\. Contributing to the core practices we are following here**
Well, this one needs to be discussed first. Hence please DM me through [twitter](https://twitter.com/_mluay) in order to discuss your recommendation and how can we move this forward. 

## 4. License
By contributing, you agree that your contributions will be licensed under its Apache License.
