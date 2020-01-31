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
        stage ('Build application') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true package' 
            }
		}
        stage ('Test application') {
            steps {
                sh 'cd $WORKSPACE/myassistant/testing/src/test/resources/bamboo/' 
                sh './ci_main_script.sh'
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

        
