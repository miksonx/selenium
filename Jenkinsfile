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
                sh 'mvn -Dmaven.test.failure.ignore=true org.owasp:dependency-check-maven:5.3.0:aggregate -Dformat=XML -DoutputDirectory=target/dependency-check-report.xml cobertura:cobertura -Dcobertura.aggregate=true -Dcobertura.report.format=xml package' 
            }
		}
        stage('SonarQube analysis') {
        	steps {
    			withSonarQubeEnv(credentialsId: 'sonar', installationName: 'sonar') { // You can override the credential to be used
      				sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar -Dsonar.dependencyCheck.reportPath=target/dependency-check-report.xml '
    			}
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
		stage("Docker scan image"){
      		steps {
      			sh '''
        		docker run -d --name db arminc/clair-db
        		sleep 15 # wait for db to come up
        		docker run -p 6060:6060 --link db:postgres -d --name clair arminc/clair-local-scan
        		sleep 1
        		DOCKER_GATEWAY=$(docker network inspect bridge --format "{{range .IPAM.Config}}{{.Gateway}}{{end}}")
        		wget -qO clair-scanner https://github.com/arminc/clair-scanner/releases/download/v12/clair-scanner_linux_amd64 && chmod +x clair-scanner
		        ./clair-scanner --ip="$DOCKER_GATEWAY" $dockerImage || exit 0
      			'''
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

        

