pipeline {
  agent any
  stages {
    stage('send mail') {
      steps {
        mail(subject: 'jenkins', body: 'jenkins start build', to: 'dormoy.guillaume@gmail.com')
      }
    }
    stage('Docker build') {
      steps {
        script {
          docker.build('cicd-project')
        }
      }
    }
  }
}
