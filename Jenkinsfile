pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh 'docker build -t bambr19/waitalpine:${BUILD_NUMBER} .'
      }
    }
    stage('Test') {
      steps {
        sh 'docker images'
      }
    }
    stage('Publish') {
      steps {
        withCredentials( [usernamePassword (
          credentialsId: 'do22dockerhub',
          usernameVariable: 'USERNAME',
          passwordVariable: 'PASSWORD') ]) {
          sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
          sh 'docker push bambr19/waitalpine:${BUILD_NUMBER} '
        }
      }
    }
    stage('Clean up') {
      steps {
        sh 'docker rmi bambr19/waitalpine:${BUILD_NUMBER}'
        sh 'docker images'
      }
    }
  }
}

