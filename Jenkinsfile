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
          docker.build("cicd-project:1.0.${env.BUILD_ID}")
          echo currentBuild.previousBuild.result
          if(currentBuild.previousBuild.result == 'SUCCESS'){
            mail(subject: 'jenkins', body: 'Build SUCCESS', to: 'dormoy.guillaume@gmail.com')
          }
          else{
            mail(subject: 'jenkins', body: 'Build FAILED', to: 'dormoy.guillaume@gmail.com')
          }
        }
      }
    }
    stage('deployment') {
      steps {
        script{
          docker.withRegistry("https://264868257155.dkr.ecr.eu-west-3.amazonaws.com/cicd-project", "ecr:eu-west-3:aws") {
            docker.image("cicd-project:1.0.${env.BUILD_ID}").push()
          }
        }
      }
    }
  }
}
