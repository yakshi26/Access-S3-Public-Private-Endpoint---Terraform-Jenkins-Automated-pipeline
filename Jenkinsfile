pipeline {
    agent any

    environment {
        GIT_CREDENTIALS_ID = 'github-credentials' // Your GitHub credentials ID
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    // Checkout the GitHub repository
                    checkout([$class: 'GitSCM', 
                              branches: [[name: '*/main']], 
                              userRemoteConfigs: [[url: 'https://github.com/username/repo-name.git', credentialsId: GIT_CREDENTIALS_ID]]
                    ])
                }
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Plan the Terraform deployment
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply the Terraform changes
                sh 'terraform apply tfplan'
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Pipeline execution completed!'
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
