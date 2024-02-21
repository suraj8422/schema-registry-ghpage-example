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
        }
          stage("docker-run"){
           docker.image('mysql:8-oracle').withRun('-e "MYSQL_ROOT_PASSWORD=my-secret-pw"') { c ->
               docker.image('mysql:8-oracle').inside("--link ${c.id}:db") {
            /* Wait until mysql service is up */
               sh 'while ! mysqladmin ping -hdb --silent; do sleep 1; done'
           }
            docker.image('oraclelinux:9').inside("--link ${c.id}:db") {
            /*
             * Run some tests that require MySQL, and assume that it is
             * available on the host name `db`
             */
            sh 'make check'
           }
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
