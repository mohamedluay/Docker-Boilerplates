#!/usr/bin/env bash
set -o nounset

image_name="docker-test"

function build_test {
    docker-compose up --build test
}

function run_test {
    test_type="$1"
    if [ -z "$test_type" ]; then
        docker-compose up test
    elif [ "$test_type" = "-w" ]; then
        docker-compose run test npm run test:watch
    elif [ "$test_type" = "-c" ]; then
        docker-compose run test npm run test:coverage
    else
        docker-compose up test
    fi
}

function build_dev {    
    docker-compose up --build dev
}

function run_dev {
     docker-compose up dev
}

function build_production {    
    docker-compose down     
    docker-compose up -d --build production
    docker ps
}

function run_production {
     docker-compose down     
     docker-compose up -d production
     docker ps
}

function remove_container {
    container="$1"
    docker-compose rm $container
}

cmd="${1-}"
subcmd="${2-}"
if [ -z "$cmd" ]; then
    echo "
Availble Commands        
        - test **                   To run project tests
        - dev *                     To run project on development settings
        - prod *                    To run project on staging settings
        - rm [container_name]       To remove a specific container
        - prune                     Cleaning Unused Docker Resources
        - running                   List running containers 
        * append --build to any command in order to build the container before running it
        (e.g) dev --build, staging --build
        ** append --build to build the container before running it, -w for test watch, or -c for test coverage     
    "
else        
    if [ "$cmd" = "test" ]; then    
        if [ "$subcmd" = "--build" ]; then
            build_test
        else
            run_test "$subcmd"
        fi        
    elif [ "$cmd" = "dev" ]; then    
        if [ "$subcmd" = "--build" ]; then
            build_dev
        else
            run_dev
        fi                        
    elif [ "$cmd" = "prod" ]; then    
        if [ "$subcmd" = "--build" ]; then
            build_production
        else
            run_production
        fi        
    elif [ "$cmd" = "running" ]; then    
        docker ps
    elif [ "$cmd" = "prune" ]; then            
        docker system prune      
    elif [ "$cmd" = "rm" ]; then  
        remove_container "$subcmd"                   
    fi
    
fi