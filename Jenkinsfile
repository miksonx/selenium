pipeline {
	environment {
    	registry = "miksonx/myassistant"
    	registryCredential = 'dockerhub'
    	dockerImage = ''
  	}
    agent any
    tools { 
        maven 'Maven 3.5.4' 
        jdk 'jdk8' 
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
        stage ('Checkout GIT') {
            steps {
                git 'https://github.com/miksonx/selenium.git'
            }
        }
        stage('SonarQube analysis') {
    		withSonarQubeEnv(credentialsId: 'sonar', installationName: 'sonar') { // You can override the credential to be used
      			sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar'
    		}
  		}
        stage ('Build application') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true package' 
            }
		}
        stage ('Test application') {
            steps {
                sh '$WORKSPACE/testing/src/test/resources/bamboo/ci_main_script.sh'
            }
		}
        stage ('Build') {
            steps {
               	script {
          			dockerImage = docker.build registry + ":$BUILD_NUMBER"
       			}
            }
		}
        stage('Deploy Image') {
  			steps{
    			script {
      				docker.withRegistry( '', registryCredential ) {
        			dockerImage.push()
      				}
    			}
  			}
		}
    }
}

        
