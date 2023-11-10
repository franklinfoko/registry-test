@Library('my-shared-library') _

pipeline {
    agent any

    parameters {

        choice(name: 'action', choices: 'create\ndelete', description: 'Choose Create/Destroy')
    }

    stages {

        stage('Git Checkout') {

            when { expression { params.action == 'create' } }

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

            when { expression { params.action == 'create' } }

            steps {

                script {

                    mvnTest()
                }
            }
        }

        stage('Integration Test Maven') {

            when { expression { params.action == 'create' } }

            steps {

                script {

                    mvnIntegrationTest()
                }
            }
        }

        stage('Static Code Analysis: SonarQube') {

            when { expression { params.action == 'create' } }

            steps {

                script {
                    
                    def SonarQubecredentialsId = 'sonarqube_token'
                    staticCodeAnalysis(SonarQubecredentialsId)
                }
            }
        }

        stage('Quality Gate Status Check: SonarQube') {

            when { expression { params.action == 'create' } }

            steps {

                script {
                    
                    def SonarQubecredentialsId = 'sonarqube_token'
                    QualityGateStatus(SonarQubecredentialsId)
                }
            }
        }

        stage('Maven Build: Maven') {

            when { expression { params.action == 'create' } }

            steps {

                script {

                    mvnBuild()
                }
            }
        }
    }
}