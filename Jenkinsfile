pipeline {
    
    agent none

    environment {
        COMPOSE_PROJECT_NAME = "${env.JOB_NAME}-${env.BUILD_ID}"
    }
    stages {
      
        stage('Build') {

            agent any            

            when { buildingTag() }

            steps {
                
                sh  '''
                    docker build . --build-arg BASE_TAG=${BRANCH_NAME:-management} -t registry.oragon.io/services/rabbitmq:${BRANCH_NAME:-management}
                '''

            }

        }

        stage('Publish') {

            agent any

            when { buildingTag() }

            steps {
                
                sh  '''

                    docker push registry.oragon.io/services/rabbitmq:${BRANCH_NAME:-management}
               
                '''

            }

        }


 
    }
    post {

        always {
            node('master'){
                
                sh  '''
               
                '''
            }
        }
    }
}