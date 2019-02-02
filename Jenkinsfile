pipeline {
  agent any
  stages {
    stage('send mail') {
      steps {
        mail(subject: 'jenkins', body: 'jenkins build', to: 'dormoy.guillaume@gmail.com')
      }
    }
    stage('') {
      steps {
        sh '''aws ecr get-login --no-include-email --region eu-west-3
docker build -t cicd-project .
docker tag cicd-project:latest 264868257155.dkr.ecr.eu-west-3.amazonaws.com/cicd-project:latest
docker push 264868257155.dkr.ecr.eu-west-3.amazonaws.com/cicd-project:latest'''
      }
    }
  }
}