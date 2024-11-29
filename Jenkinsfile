// pipeline {
//     agent any
//         parameters {
//         string(name: 'action', defaultValue: 'plan', description: 'Specify Terraform action (plan or apply)')
//     }


//     stages {
//         stage('Checkout') {
//             steps {
//             checkout scm
//             }
//         }
        
//         stage ("terraform init") {
//             steps {
//                 sh ('terraform init -reconfigure') 
//             }
//         }
//         stage ("terraform plan") {
//             steps {
//                 sh ('terraform plan -out=tfplan') 
//             }
//         }
                
//         stage ("terraform Action") {
//             steps {
//                 echo "Terraform action is --> ${action}"
//                 sh ('terraform ${action} --auto-approve') 
//            }
//         }
//     }
// }

//  pipeline {
//     agent any
//     parameters {
//         string(name: 'action', defaultValue: 'plan', description: 'Specify Terraform action (plan or apply)')
//     }

//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scm
//             }
//         }

//         stage('terraform init') {
//             steps {
//                 sh 'terraform init -reconfigure'
//             }
//         }

//         stage('terraform plan') {
//             steps {
//                 sh 'terraform plan -out=tfplan'  // Saves the plan as "tfplan"
//             }
//         }

//         stage('terraform Action') {
//             steps {
//                 echo "Terraform action is --> ${params.action}"
//                 script {
//                     if (params.action == 'apply') {
//                         sh 'terraform apply --auto-approve '  // Uses saved plan for apply
//                     } else if (params.action == 'plan') {
//                         sh 'terraform plan'
//                     } else {
//                         error "Invalid action: ${params.action}. Only 'plan' or 'apply' are allowed."
//                     }
//                 }
//             }
//         }
//     }
// }

pipeline {
    agent any
    parameters {
        string(name: 'action', defaultValue: 'plan', description: 'Specify Terraform action (plan, apply, or destroy)')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('terraform init') {
            steps {
                sh 'terraform init -reconfigure'
            }
        }

        stage('terraform plan') {
            when {
                expression { params.action == 'plan' || params.action == 'apply' }
            }
            steps {
                sh 'terraform plan -out=tfplan' // Saves the plan as "tfplan"
            }
        }

        stage('terraform Action') {
            steps {
                echo "Terraform action is --> ${params.action}"
                script {
                    if (params.action == 'apply') {
                        sh 'terraform apply "tfplan"' // Applies the saved plan
                    } else if (params.action == 'destroy') {
                        input message: 'Are you sure you want to destroy resources?', ok: 'Yes'
                        sh 'terraform destroy -auto-approve'
                    } else if (params.action != 'plan') {
                        error "Invalid action: ${params.action}. Only 'plan', 'apply', or 'destroy' are allowed."
                    }
                }
            }
        }
    }
}

