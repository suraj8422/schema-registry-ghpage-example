#!/usr/bin/env groovy

def DOCKER_IMG = 'artifactory.prod.hulu.com/hulu-docker/telemetry/smithy-to-openapi/smithy-to-openapi:main'

node {

    try {
        stage("Checkout") {
            cleanWs()
            checkout scm
        }
        stage("build artifact") {
              //sh "ls -la ${pwd()}"
            def output = sh(
                    script: """
                         docker run --rm --privileged -v ${pwd()}:/spec ${DOCKER_IMG} -o /spec/index.html
                    """,
                    returnStdout: true
            )

            echo "result---${output}"

            //sh "ls -la ${pwd()}"
        }
    }
    catch (e) {
        throw e as java.lang.Throwable
    }
}
