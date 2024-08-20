pipeline {
    agent any



    stages {
        stage('Clone Repository') {
            steps {
                deleteDir()  // Clean workspace before cloning (optional)
                git branch: 'main', url: 'https://github.com/JPYADAV96/python-mysql-db-proj-1.git'

            }
        }

        stage('Debug Docker') {
            steps {
                sh 'which docker'
                sh 'docker --version'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    dir('python-mysql-db-proj-1') {
                        sh 'docker build -t my-ecr-repo:latest .'
                    }
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    docker.withRegistry('https://129390742221.dkr.ecr.eu-central-1.amazonaws.com', 'ecr:eu-central-1:aws-credentials') {
                        sh 'docker push 129390742221.dkr.ecr.eu-central-1.amazonaws.com/my-ecr-repo:latest'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean up workspace after the pipeline finishes
        }
    }
}
