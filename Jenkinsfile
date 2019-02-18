pipeline {
<<<<<<< HEAD
  agent any
  tools {
    maven 'maven 3'
    jdk 'java 8'
=======
  agent {
    docker {
      image 'maven:3-alpine'
      args '-v /root/.m2:/root/.m2'
    }

>>>>>>> 8078c18d5c06368f19bddccc60b66f272725c710
  }
  stages {
    stage ('Initialize') {
      steps {
        sh '''
          echo "PATH = ${PATH}"
          echo "M2_HOME = ${M2_HOME}"
        '''
      }
    }
    stage('Java build') {
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Docker build') {
      steps {
        script {
          docker.build('cicd-project:1.0.${env.BUILD_ID}')
        }

      }
    }
    stage('deployment') {
      steps {
        script {
          docker.withRegistry('https://264868257155.dkr.ecr.eu-west-3.amazonaws.com/cicd-project', 'ecr:eu-west-3:aws') {
            docker.image('cicd-project:1.0.${env.BUILD_ID}').push()
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