#!/usr/bin/env groovy

node {

    try {
        stage("Code checkout") {
            cleanWs()
            checkout scm
        }
        stage("Build and publish artifact") {

            def schemaNames = ["schema-registry-tlmt-pq", "schema-registry-tlmt-viewport"]
            /*for (int i = 0; i < schemaNames; i++) {
                echo "${schemaNames[i]}"
            }*/

            withCredentials([gitUsernamePassword(credentialsId: 'c8c127e3-7a9a-415f-8e4f-76448b0301ca', gitToolName: 'Default')]) {
                sh ' ./scripts/publish-site.sh'
            }
        }
    } catch (e) {
        throw e as java.lang.Throwable
    }
}
