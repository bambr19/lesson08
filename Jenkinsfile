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
      }
    }
    stage('Publish') {
      steps {
        sh 'docker push bambr19/waitalpine:${BUILD_NUMBER}'
      }
    }
  }
}

