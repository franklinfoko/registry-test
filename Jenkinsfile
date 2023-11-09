@Library('my-shared-library') _

pipeline {
    agent any

    stages {

        stage('Git Checkout') {

            steps {

                script {

                    gitCheckout(
                        branch: "develop",
                        url: "https://github.com/franklinfoko/registry-test.git"
                    )
                }
            }
        }

        // Unit Testing
        stage('Unit Test Maven') {

            steps {

                script {

                    mvnTest()
                }
            }
        }
    }
}