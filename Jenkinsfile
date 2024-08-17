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
                    url: 'https://github.com/JPYADAV96/python-mysql-db-proj-1.git'
                sh "ls -lart"
            }
        }


        // New Build Stage
        stage('Build') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/JPYADAV96/python-mysql-db-proj-1.git'
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
