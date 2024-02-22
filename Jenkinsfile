#!/usr/bin/env groovy

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
            def files = sh(script: "find . -name '*.json'", returnStdout:true).trim()    
            println ("all files commited:" + files)
            sh "ls"
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
