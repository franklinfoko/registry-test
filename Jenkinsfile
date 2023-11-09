@Library('my-shared-library') _

pipeline {
    agent any

    stages {

        stage('Git Checkout') {

            steps {

                script {

                    gitCheckout(
                        branch: "main",
                        url: "https://github.com/franklinfoko/registry-test.git"
                    )
                }
            }
        }

        stage('Unit Test Maven') {

            steps {

                script {

                    mvnTest()
                }
            }
        }

        stage('Integration Test Maven') {

            steps {

                script {

                    mvnIntegrationTest()
                }
            }
        }
    }
}