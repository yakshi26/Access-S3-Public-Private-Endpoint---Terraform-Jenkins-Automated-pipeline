pipeline {
    agent any

    environment {
        // Ensure this matches the correct Jenkins credential ID for GitHub
        GIT_CREDENTIALS_ID = '619' // Update this if needed
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    echo 'Checking out code from GitHub...'
                    // Checkout the GitHub repository using Jenkins Git credentials
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
                // Initialize Terraform - assumes terraform is already installed on Jenkins agent
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo 'Running Terraform Plan...'
                // Plan the Terraform deployment
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                echo 'Applying Terraform changes...'
                // Apply the Terraform plan created in the previous step
                sh 'terraform apply -auto-approve'
            }
        }

        stage('Terraform Destroy') {
            steps {
                echo 'Destroying Terraform resources...'
                // Destroy the resources created by Terraform
                sh 'terraform destroy -auto-approve'
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Pipeline execution completed! Cleaning up...'
                // Any cleanup tasks can be added here
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished. Cleaning up workspace...'
            // Clean up workspace after pipeline execution
        }
    }
}
