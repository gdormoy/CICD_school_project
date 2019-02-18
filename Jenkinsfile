pipeline {
  agent any
  stages {
    stage('Java build') {
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Docker build') {
      steps {
        script {
          docker.build("cicd-project:1.0.${env.BUILD_ID}")
        }

      }
    }
    stage('deployment') {
      steps {
        script {
          docker.withRegistry("https://264868257155.dkr.ecr.eu-west-3.amazonaws.com/cicd-project", "ecr:eu-west-3:aws") {
            docker.image("cicd-project:1.0.${env.BUILD_ID}").push()
          }
        }

      }
    }
    stage('send mail') {
      steps {
        script {
          mail(subject: 'jenkins', body: 'Build SUCCESS', to: 'dormoy.guillaume@gmail.com')
        }

      }
    }
  }
}
