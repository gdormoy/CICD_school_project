pipeline {
  agent any
  stages {
    stage('Docker build') {
      steps {
        script {
          try{
            docker.build("cicd-project:1.0.${env.BUILD_ID}")
          }
          finally {
            mail(subject: 'jenkins', body: 'Build FAILED', to: 'dormoy.guillaume@gmail.com')
          }
        }
      }
    }
    stage('deployment') {
      steps {
        script{
          try{
            docker.withRegistry("https://264868257155.dkr.ecr.eu-west-3.amazonaws.com/cicd-project", "ecr:eu-west-3:aws") {
              docker.image("cicd-project:1.0.${env.BUILD_ID}").push()
            }
          }
          finally {
            mail(subject: 'jenkins', body: 'Build FAILED', to: 'dormoy.guillaume@gmail.com')
          }
        }
      }
    }
    stage('send mail') {
      steps {
        mail(subject: 'jenkins', body: 'Build SUCCESS', to: 'dormoy.guillaume@gmail.com')
      }
    }
  }
}
