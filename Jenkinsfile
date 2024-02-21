#!/usr/bin/env groovy

def DOCKER_IMG='mysql:latest'
node {

    try {
        stage("checkout-${env.BRANCH_NAME}") {
            cleanWs()
            checkout scm
            echo "first stage pass"
        }
        stage("second stage ") {
            echo "second stage pass"
        }
        stage("docker-pull"){
            script{
            env.docker_img = "${DOCKER_IMG}"
            echo "${env.docker_img}"
            "docker pull ${env.docker_img}"
            }
        }

    }
    catch (e) {
        stage("Report failure") {
            echo "Build failed, Exception: ${e}"
        }
        throw e
    }

}
