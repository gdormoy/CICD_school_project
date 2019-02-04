pipeline {
  agent any
  stages {
    stage('send mail') {
      steps {
        mail(subject: 'jenkins', body: 'jenkins build', to: 'dormoy.guillaume@gmail.com')
      }
    }
    stage('Docker build') {
      steps {
        script {
          docker.build('cicd-project','--no-cache=true dockerbuild')
        }

      }
    }
  }
}