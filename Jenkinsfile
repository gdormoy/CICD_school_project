pipeline {
  agent any
  stages {
    stage('Docker build') {
      steps {
        script {
          try{
            docker.build("cicd-project:1.0.${env.BUILD_ID}")
          }
          catch(err) {
            mail(subject: 'jenkins', body: 'Build FAILED', to: 'dormoy.guillaume@gmail.com')
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
            mail(subject: 'jenkins', body: 'Build FAILED', to: 'dormoy.guillaume@gmail.com')
          }
        }

      }
    }
    stage('send mail') {
      parallel {
        stage('send mail') {
          steps {
            mail(subject: 'jenkins', body: 'Build END', to: 'dormoy.guillaume@gmail.com')
          }
        }
        stage('send mail2') {
          steps {
            emailext(subject: 'jenkins', body: 'test', attachLog: true, to: 'dormoy.guillaume@gmail.com', from: 'dormoy.guillaume@gmail.com')
          }
        }
      }
    }
  }
}