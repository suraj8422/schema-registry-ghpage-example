#!/usr/bin/env groovy

import jenkins.model.*
import hudson.model.*

node {

    try {
        stage("checkout") {
            cleanWs()
            checkout scm
            echo "first stage pass"
        }
        stage("docker-pull") {
            def imgName = docker.image("mysql:latest")
            echo "imgName---${imgName}"
        }
        stage("build artifact and publish to github pages") {
      
            sh 'docker build -f Dockerfile -t redoc .'
            String files = sh(script: "find . -name '*.json'", returnStdout:true).trim()    
            println ("all files:" + files)
            //sh "ls"
            sh 'docker run --rm redocly/cli build-docs ./schema-registry-tlmt-viewport.json -o index.html'
        }
    }
    catch (e) {
        throw e
    }
}
