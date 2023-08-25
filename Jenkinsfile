pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-webapp"
        DOCKER_TAG = "v1"
        CONTAINER_NAME = "my-webapp_container"
    }

    stages {
        stage('Checkout') {
            steps {
                // Assuming your code is stored in a version control repository
                // You might need to adjust this step according to your repository setup
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build your Docker image with the specified name and tag
                    sh "docker build -t $DOCKER_IMAGE:$DOCKER_TAG ."
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Stop and remove the existing container (if any)
                    sh "docker stop $CONTAINER_NAME || true"
                    sh "docker rm $CONTAINER_NAME || true"

                    // Run a new container from the newly built image
                    sh "docker run -d -p 80:80 --name $CONTAINER_NAME $DOCKER_IMAGE:$DOCKER_TAG"
                }
            }
        }
    }

    post {
        always {
            // Clean up resources if necessary
            sh "docker stop $CONTAINER_NAME || true"
            sh "docker rm $CONTAINER_NAME || true"
        }
    }
}
