#!/usr/bin/env groovy

def DOCKER_IMG = 'artifactory.prod.hulu.com/hulu-docker/telemetry/smithy-to-openapi/smithy-to-openapi:main'

node {

    try {
        stage("Checkout") {
            cleanWs()
            checkout scm
        }
        stage("build artifact") {
              sh "ls -la ${pwd()}"
            def output = sh(
                    script: """
                         docker run --rm --privileged -v ${pwd()}:/spec ${DOCKER_IMG} -o /spec/index.html
                    """,
                    returnStdout: true
            )

            echo "result---${output}

            sh "ls -la ${pwd()}"
  
            withCredentials([usernamePassword(credentialsId: 'github-admin-readonly', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                //sh 'git checkout -b gh-pages'
                //sh 'git remote set-url origin https://${GIT_USERNAME}:${GIT_PASSWORD}@github.prod.hulu.com/suraj-bhan/jenkins-pipeline-test.git'
                //https://github.prod.hulu.com/suraj-bhan/jenkins-pipeline-test.git
                //sh 'git fetch origin gh-pages:refs/remotes/origin/gh-pages'
                //sh 'git fetch --all'
                sh 'git checkout -b gh-pages'
                sh 'git branch'
                sh 'git pull --rebase origin gh-pages'
                //sh "git pull origin gh-pages"
                sh "git add ."
                sh "git diff-index --quiet HEAD || git commit -m 'updated index.html into github repo'"
                //sh "git push origin gh-pages"
                sh 'git push origin gh-pages'
            }
        }
    }
    catch (e) {
        throw e as java.lang.Throwable
    }
}
