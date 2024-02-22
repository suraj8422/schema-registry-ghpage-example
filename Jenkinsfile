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
            def job_path = "${new File(files).parent}"
            echo "${job_path}"
            echo "${context.WORKSPACE}"
   
           // echo "${files[0].path}"
            
            //for (def i=0; i<files.length; i++) {
                jsonFilePath = "${files[1].path}"
                echo jsonFilePath
                jsonPath = "${env.WORKSPACE}" + "/" + jsonFilePath
                echo jsonPath
            //}
          
            sh 'docker run --rm redocly/cli build-docs ./schema-registry-tlmt-viewport.json -o index.html'
            sh 'git add index.html'
            sh git diff-index --quiet HEAD || git commit -m 'updated gh-pages [ci skip]'
            git push origin gh-pages
         
        }
    }
    catch (e) {
        throw e
    }
}
