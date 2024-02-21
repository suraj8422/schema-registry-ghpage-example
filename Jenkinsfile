#!/usr/bin/env groovy

def DOCKER_IMG='mysql:latest'
def DOCKER_IMG_NAME= 'main';
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
            env.docker_img = "${DOCKER_IMG}"
            echo "${env.docker_img}"
            sh "docker pull ${env.docker_img}"
        }

    }
    catch (e) {
        stage("Report failure") {
            echo "Build failed, Exception: ${e}"
        }
        throw e
    }

}
