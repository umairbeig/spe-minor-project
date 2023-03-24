pipeline {
    agent any
     environment {
    DOCKERHUB_CREDENTIALS = credentials('docker-hub')
    image1=""
  }
    stages {
        stage('Git pull') {
            steps {
                git branch: 'main', url: 'https://github.com/umairbeig/spe-minor-project.git'
            }
        }
        stage('maven Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('build docker image') {
            steps {
                script{
                image1=docker.build "umairbeig/junit-devops:latest"
                  }
                
            }
        }
        stage('push docker image') {
            steps {
                script{
                    docker.withRegistry('','docker-hub'){
                        image1.push()
                    }
                  }
                
            }
        }
         stage(' ansible  deploy jar') {
            steps {
              ansiblePlaybook becomeUser: null, colorized: true, installation: 'ansible', inventory: 'inventory', playbook: 'playbook.yml', sudoUser: null
            }
        }
    }
}
