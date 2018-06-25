pipeline {
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
        stage ('Checkout') {
            steps {
                checkout scm
            }
        }
        stage ('Build') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true install' 
            }
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml' 
                    // Permission to execute
                    sh "chmod +x -R ${env.WORKSPACE}/startup.sh"

                    // Call SH
                    sh "${env.WORKSPACE}/startup.sh stop"
                    sh "sleep 15"
                    sh "${env.WORKSPACE}/startup.sh start"
                    //sh 'startup.sh stop'
                    //sh 'sleep 15'
                    //sh 'startup.sh start'
                } 
            }
        }
    }
}

        
