pipeline {
    agent any

    environment {
        GIT_CREDENTIALS_ID = '619'  // Your GitHub credentials
        AWS_CREDENTIALS_ID = 'aws-credentials'  // AWS credentials in Jenkins
        AWS_REGION = 'us-east-1'  // Your AWS region
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    echo 'Checking out code from GitHub...'
                    checkout([$class: 'GitSCM', 
                              branches: [[name: '*/main']], 
                              userRemoteConfigs: [[url: 'https://github.com/sarathkumar0619/Access-S3-Public-Private-Endpoint---Terraform-Jenkins-Automated-pipeline.git', credentialsId: GIT_CREDENTIALS_ID]]
                    ])
                }
            }
        }

        stage('Terraform Init') {
            steps {
                echo 'Initializing Terraform...'
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS_ID]]) {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                echo 'Running Terraform Plan...'
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS_ID]]) {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                echo 'Applying Terraform changes...'
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS_ID]]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                echo 'Destroying Terraform resources...'
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS_ID]]) {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Pipeline execution completed! Cleaning up...'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished. Cleaning up workspace...'
        }
    }
}
