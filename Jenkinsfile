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
            script{
            env.docker_img = "${DOCKER_IMG}"
            echo "${env.docker_img}"
            "docker pull ${env.docker_img}"
            }
        }
        stage('Publish') {
            git.withCredentials([
                usernamePassword(credentialsId: 'github-creds-schemareg', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_PASSWORD')]) {
                  sh 'GITHUB_TOKEN="${GIT_USER}:${GIT_PASSWORD}"'
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
