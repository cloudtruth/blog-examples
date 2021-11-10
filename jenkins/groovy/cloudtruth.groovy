pipeline {
    environment {
        CLOUDTRUTH_API_KEY = credentials('CLOUDTRUTH_API_KEY')
    }
    agent any

    stages {
        stage('CloudTruth') {
            steps {
            script{
                CLOUDTRUTH_SECRET = sh(script:'cloudtruth --project MyFirstProject --env default parameters get secret', returnStdout: true).trim()
                wrap([$class: 'MaskPasswordsBuildWrapper', varPasswordPairs: [[password: CLOUDTRUTH_SECRET]]]) {  
                  withEnv(["SECRET=${CLOUDTRUTH_SECRET}"]){
                  sh 'echo Retrieve Secret from CloudTruth: $SECRET'
                  sh 'printenv'
            }
          }
        }
      }
    }
  }
}