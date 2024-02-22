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
         script{
            "docker build -f Dockerfile -t redoc ."
            "docker run --rm -v $PWD:/spec redoc redocly build-docs /spec/schema-registry-tlmt-viewport.json -o /spec/index.html"
            'git add index.html'
            git diff-index --quiet HEAD || git commit -m 'updated gh-pages [ci skip]'
            git push origin gh-pages
         }
        }
    }
    catch (e) {
        throw e
    }
}
