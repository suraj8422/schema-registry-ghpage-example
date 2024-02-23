#!/usr/bin/env groovy

def DOCKER_IMG = 'artifactory.prod.hulu.com/hulu-docker/telemetry/smithy-to-openapi/smithy-to-openapi:main'

node {

    try {
        stage("Checkout") {
            cleanWs()
            checkout scm
        }
         stage("docker -pull") {
            def res = sh(
                    script: """
                         docker pull ${DOCKER_IMG}
                    """,
                    returnStdout: true
            )
        }
        
        stage("build artifact") {

            def output = sh(
                    script: """
                         docker run --rm --privileged -v ${pwd()}:/spec ${DOCKER_IMG} -o /spec/index.html
                    """,
                    returnStdout: true
            )

            echo "result---${output}"

            sh "git add index.html"

            sh "git diff-index --quiet HEAD || git commit -m 'updated index.html into github repo'"
            sh "git push origin main"
        }
    }
    catch (e) {
        throw e as java.lang.Throwable
    }
}
