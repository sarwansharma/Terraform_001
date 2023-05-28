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
        sh 'mkdir -p $WORKSPACE/terraform'
        dir("$WORKSPACE/terraform") {
          sh 'terraform init -backend=false'
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
//   post {
//     always {
//       cleanWs()
//     }
//   }
}
