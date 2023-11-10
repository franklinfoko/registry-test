@Library('my-shared-library') _

pipeline {
    agent any

    parameters {

        choice(name: 'action', choices: 'create\ndelete', description: 'Choose Create/Destroy')
        string(name: 'imageRepoName', description: 'name of image repository on ECR', defaultValue: 'abc-registry')
        string(name: 'awsAccountId', description: 'ID of aws account to deploy on it', defaultValue: '989481297723')
        string(name: 'imageTag', description: 'tag of image', defaultValue: 'develop')
        string(name: 'awsDefaultregion', description: 'the default aws region where we work', defaultValue: 'us-east-1')
    
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

        stage('Docker Image Build') {

            when { expression { params.action == 'create' } }

            steps {

                script {

                    dockerBuild("${params.imageRepoName}", "${params.awsAccountId}", "${params.imageTag}", "${params.awsDefaultregion}")
                }
            }
        }
    }
}