pipeline {
  agent { label 'linux'}
  options {
    skipDefaultCheckout(false)
  }
  stages {
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
        sh 'terraform init'
      }
    }
    stage('Terraform Deployment') {
      steps {
        sh 'terraform apply -auto-approve -no-color'
      }
    }
  }
  post {
    always {
      cleanWs()
      archiveArtifacts artifacts: 'terraform.tfstate', fingerprint: true
    }
  }
}
