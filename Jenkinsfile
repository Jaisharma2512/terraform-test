pipeline {
    agent any

    environment {
        Gcloudcreds = credentials('gcp-creds')  // Secret file credential in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Jaisharma2512/terraform-test.git'
            }
        }

        stage('Initialize') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform plan -var="credentials_file=$Gcloudcreds" -var-file="terraform.tfvars"'
            }
        }

        stage('Apply') {
            when {
                branch 'main'
            }
            steps {
                sh 'terraform apply -auto-approve -var="credentials_file=$Gcloudcreds" -var-file="terraform.tfvars"'
            }
        }

        stage('Output') {
            steps {
                sh 'terraform output'
            }
        }
    }
}
