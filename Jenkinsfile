#!/usr/bin/env groovy

def DOCKER_IMG='artifactory.prod.hulu.com/hulu-docker/telemetry/tlmt-utils-cli/tlmt-utils-cli'
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
            env.docker_img = "${DOCKER_IMG}:${DOCKER_IMG_NAME}"
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