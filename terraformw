pipeline {
  agent { label 'linux'}
  options {
    skipDefaultCheckout(true)
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
        dir("$WORKSPACE/terraform") {
          sh 'terraform init'
        }
      }
    }
    stage('Terraform Deployment') {
      steps {
        dir("$WORKSPACE/terraform") {
          sh 'terraform apply -auto-approve -no-color'
        }
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
