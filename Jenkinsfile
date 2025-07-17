pipeline{
    agent any
    environment{
        Gcloudcreds= credentials('gcp-creds')
    }
    stages{
                stage('Checkout'){
                                    steps{
                                        git branch: 'main' , url: 'https://github.com/Jaisharma2512/terraform-test.git'
                                    }
                }
                stage('Initialize'){
                                        steps{
                                            script{
                                        sh 'terraform init'
                                        }
                                        }
                                }
                stage('Plan'){
                        steps{

                           script{
                               sh 'terraform plan -var="credentials_file=$Gcloudcreds"'                      

                           }

                        }
                            }
                stage('Apply'){
                         steps{
                               when {
                                 branch 'main'
                                    }
                            script{
                                sh 'terraform apply -auto-approve -var="credentials_file=$Gcloudcreds"' 
                            }
                         }



                            }        
    }
}