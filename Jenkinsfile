#!/usr/bin/env groovy

node {

    try {
        stage("Code checkout-"${env.BRANCH_NAME}) {
            cleanWs()
            checkout scm
        }
        stage("Build and publish artifact") {
            echo "${env.JENKINS_HOME}"

            withCredentials([usernamePassword(credentialsId: 'github-admin-readonly', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                sh 'GITHUB_TOKEN="${GIT_USERNAME}:${GIT_PASSWORD}" ./scripts/publish-site.sh'
            }
        }
    }
    catch (e) {
        throw e as java.lang.Throwable
    }
}
