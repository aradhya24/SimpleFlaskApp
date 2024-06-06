pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/aradhya24/SimpleFlaskApp.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip3 install -r requirements.txt --break-system-packages'
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                sudo nginx -t
                '''
            }
        }

        stage('Deploy to EC2') {
            steps {
                    sh '''
                    cd /home/ubuntu/SimpleFlaskApp
                    git pull origin feature/devops-intern
                    sudo systemctl restart flaskapp.service
                    sudo systemctl restart nginx
                    '''
            }
        }

        stage('Update S3 Bucket') {
            steps {
                sh 'aws s3 sync ./ s3://devops-intern-assignment-aradhya-dange --profile jenkins'
            }
        }
    }
}
