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
    stage('build') {
      docker.withRegistry("https://264868257155.dkr.ecr.eu-west-3.amazonaws.com/cicd-project", "ecr:eu-west-3:aws") {
        docker.image("cicd-test").push()
      }
  }
}
