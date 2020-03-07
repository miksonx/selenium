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
                sh 'mvn -Dmaven.test.failure.ignore=true org.owasp:dependency-check-maven:5.3.0:aggregate -Dformat=XML -DoutputDirectory=target/dependency-check-report.xml package' 
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
        		#docker run -d --name db arminc/clair-db
        		#sleep 15 # wait for db to come up
        		#docker run -p 6060:6060 --link db:postgres -d --name clair arminc/clair-local-scan
        		#sleep 1
        		docker-compose down --volumes
			echo "sleeping 10"
			sleep 10
			docker ps -a
			docker-compose down --volumes
			echo "sleeping 10"
			sleep 10
			docker ps -a


			echo "--------------- working dir -------------------"
			pwd

			# docker must run in background....otherwise the script will hang on the io
			docker-compose up -d
			# wait for all containers to start
			echo "sleeping 60"
			sleep 30
			docker ps -a
			echo "sleeping 5"
			sleep 5
			docker ps -a
			DOCKER_GATEWAY=$(docker network inspect bridge --format "{{range .IPAM.Config}}{{.Gateway}}{{end}}")
        		DOCKER_IP=$(docker inspect --format "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" jenkins)
			wget -qO clair-scanner https://github.com/arminc/clair-scanner/releases/download/v12/clair-scanner_linux_amd64 && chmod +x clair-scanner
		        ./clair-scanner --ip="$DOCKER_IP" --clair=http://"$DOCKER_GATEWAY":6060 "$registry:$BUILD_NUMBER" || exit 0
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

        

