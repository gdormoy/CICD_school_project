pipeline {
  agent any
  stages {
    stage('send mail') {
      steps {
        mail(subject: 'jenkins', body: 'jenkins build', to: 'dormoy.guillaume@gmail.com')
      }
    }
  }
}