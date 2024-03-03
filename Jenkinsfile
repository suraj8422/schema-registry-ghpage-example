#!/usr/bin/env groovy

node {

    try {
        stage("Code checkout") {
            cleanWs()
            checkout scm
        }
        stage("Build and publish artifact") {
            echo "${env.JENKINS_HOME}"

            def schemaNames = ["schema-registry-tlmt-pq","schema-registry-tlmt-viewport"]
            print schemaNames
            echo "${schemaNames}"
            print $schemaNames

            withCredentials([gitUsernamePassword(credentialsId: 'github-user', gitToolName: 'Default')]) {
                sh 'SCHEMAS="${schemaNames}" $schemaNames ./scripts/publish-site.sh'
            }

          /*  withCredentials([usernamePassword(credentialsId: 'c8c127e3-7a9a-415f-8e4f-76448b0301ca', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                sh 'GITHUB_TOKEN="bhansuraj196@gmail.com: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" ./scripts/publish-site.sh'
            }*/
        }
    }
    catch (e) {
        throw e as java.lang.Throwable
    }
}
