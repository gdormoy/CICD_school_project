pipeline {
  environment {
    BUILD_STATUS = "SUCCESS"
  }
  agent any
  stages {
    stage('Docker build') {
      steps {
        script {
          try{
            docker.build("cicd-project:1.0.${env.BUILD_ID}")
          }
          catch(err) {
            BUILD_STATUS = "FAILED"
          }
        }

      }
    }
    stage('deployment') {
      steps {
        script {
          try{
            docker.withRegistry("https://264868257155.dkr.ecr.eu-west-3.amazonaws.com/cicd-project", "ecr:eu-west-3:aws") {
              docker.image("cicd-project:1.0.${env.BUILD_ID}").push()
            }
          }
          catch(err) {
            BUILD_STATUS = "FAILED"
          }
        }

      }
    }
    stage('send mail') {
      steps {
        script{
          if(BUILD_STATUS == "SUCCESS"){
            mail(subject: 'jenkins', body: 'Build SUCCESS', to: 'dormoy.guillaume@gmail.com')
          }
          else{
            mail(subject: 'jenkins', body: 'Build FAILED', to: 'dormoy.guillaume@gmail.com')
          }
        }
      }
    }
  }
}
