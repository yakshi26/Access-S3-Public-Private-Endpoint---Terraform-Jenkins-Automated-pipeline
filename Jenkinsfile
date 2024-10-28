pipeline {
    agent any

    environment {
        AWS_CREDENTIALS_ID = 'aws-credentials'  // Replace this with your actual credentials ID
        AWS_REGION = 'us-east-1'  // Your AWS region
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage("Terraform Init") {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS_ID]]) {
                    sh 'terraform init -reconfigure'
                }
            }
        }

        stage("Terraform Plan") {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS_ID]]) {
                    sh 'terraform plan'
                }
            }
        }

        stage("Terraform Action") {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS_ID]]) {
                    echo "Terraform action is --> ${action}"
                    sh "terraform ${action} --auto-approve"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished. Cleaning up workspace...'
        }
    }
}
