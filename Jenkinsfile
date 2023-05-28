pipeline {
  agent { label 'linux'}
  options {
    skipDefaultCheckout(true)
  }
  stages{
    stage('Clean Workspace') {
      steps {
        cleanWs()
      }
    }
    stage('Checkout SCM') {
      steps {
        checkout scm
      }
    }
    stage('Terraform Plugin Check') {
      steps {
        sh 'chmod +x trigger.sh' // Set executable permission
        sh './trigger.sh'
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
