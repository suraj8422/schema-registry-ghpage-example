#!/usr/bin/env groovy

def DOCKER_IMG='mysql:latest'
node {

    try {
        stage("checkout-${env.BRANCH_NAME}") {
            cleanWs()
            checkout scm
            echo "first stage pass"
        }
        
        stage("docker-pull"){
            env.docker_img = "${DOCKER_IMG}"
            echo "${env.docker_img}"
            sh "docker pull ${env.docker_img}"
        }
          stage("docker-run"){
            def test = sh "docker pull ${DOCKER_IMG}"
            echo "${test}"
        }

    }
    catch (e) {
        stage("Report failure") {
            echo "Build failed, Exception: ${e}"
        }
        throw e
    }

}
