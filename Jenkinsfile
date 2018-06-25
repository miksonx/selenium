node {

    checkout scm

    stage "Build"
    
        sh 'mvn clean install'
    
    stage "Run"
sh "startup.sh stop"
sh "sleep 15"
sh "startup.sh start"
}
