pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh 'docker build -t waitalpine:latest .'
      }
    }
    stage('Tag') {
      steps {
        sh 'docker tag waitalpine:latest bambr19/waitalpine:${BUILD_NUMBER}'
        sh 'docker images'
      }
    }
    stage('Publish') {
      steps {
        withCredentials([[$class: 'UsernamePasswordMultipleBinding'
          credentialId: 'do22dockerhub',
          usernameVariable: 'USERNAME',
          passwordVariable: 'PASSWORD']]) {
          sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
          sh 'docker push bambr19/waitalpine:${BUILD_NUMBER}- '
          sh 'docker images'
        }
      }
    }
  }
}

