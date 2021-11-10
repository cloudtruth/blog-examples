pipeline {
    environment {
        CLOUDTRUTH_API_KEY = credentials('CLOUDTRUTH_API_KEY')
        CLOUDTRUTH_PARAMETER = sh(script:'cloudtruth --project MyFirstProject --env default parameters get jenkins', returnStdout: true).trim()

    }
    agent any

    stages {
        stage('CloudTruth') {
            steps {
                echo "Retrieve Parameter from CloudTruth: ${env.CLOUDTRUTH_PARAMETER}"
                }
            }
        }
    }