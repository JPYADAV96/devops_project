pipeline {
    agent any

    parameters {
        booleanParam(name: 'PLAN_TERRAFORM', defaultValue: false, description: 'Check to plan Terraform changes')
        booleanParam(name: 'APPLY_TERRAFORM', defaultValue: false, description: 'Check to apply Terraform changes')
        booleanParam(name: 'DESTROY_TERRAFORM', defaultValue: false, description: 'Check to destroy Terraform resources')
    }

    stages {
        stage('Clone Repository') {
            steps {
                deleteDir()  // Clean workspace before cloning (optional)
                git branch: 'main',
                    url: 'https://github.com/JPYADAV96/devops_project.git'
                sh "ls -lart"
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails']]){
                    dir('infra') {
                        sh 'echo "=================Terraform Init=================="'
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    if (params.PLAN_TERRAFORM) {
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails']]){
                            dir('infra') {
                                sh 'echo "=================Terraform Plan=================="'
                                sh "terraform plan -var 'eks_cluster_name=my-eks-cluster' -var 'eks_cluster_version=1.27'"
                            }
                        }
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    if (params.APPLY_TERRAFORM) {
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails']]){
                            dir('infra') {
                                sh 'echo "=================Terraform Apply=================="'
                                sh "terraform apply -var 'eks_cluster_name=my-eks-cluster' -var 'eks_cluster_version=1.27' -auto-approve"
                            }
                        }
                    }
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                script {
                    if (params.DESTROY_TERRAFORM) {
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails']]){
                            dir('infra') {
                                sh 'echo "=================Terraform Destroy=================="'
                                sh "terraform destroy -var 'eks_cluster_name=my-eks-cluster' -var 'eks_cluster_version=1.27' -auto-approve"
                            }
                        }
                    }
                }
            }
        }

        // New Build Stage
        stage('Build') {
            steps {
                git branch: "main"
                    url: 'https://github.com/JPYADAV96/python-mysql-db-proj-1.git'
                    cd: 'python-mysql-db-proj-1.git'
                withDockerRegistry([credentialsId: "dockerlogin", url: ""]) {
                    script {
                        app = docker.build("my-ecr-repo")
                    }
                }
            }
        }

        // New Push Stage
        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://129390742221.dkr.ecr.eu-central-1.amazonaws.com/', 'ecr:eu-central-1:aws-credentials') {
                        app.push("latest")
                    }
                }
            }
        }
    }
}
