pipeline {
  agent any
  stages {
    stage('send mail') {
      steps {
        mail(subject: 'jenkins', body: 'Build start', to: 'dormoy.guillaume@gmail.com')
      }
    }
    stage('Docker build') {
      steps {
        script {
          docker.build("cicd-project:${env.BUILD_ID}"")
        }
      }
    }
    stage('build') {
      steps {
        script{
          docker.withRegistry("https://264868257155.dkr.ecr.eu-west-3.amazonaws.com/cicd-project", "ecr:eu-west-3:aws") {
            docker.image("cicd-project").push()
          }
        }
      }
    }
    stage('send mail 2') {
      steps {
        mail(subject: 'jenkins', body: 'Build success', to: 'dormoy.guillaume@gmail.com')
      }
    }
  }
}
