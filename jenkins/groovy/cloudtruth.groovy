pipeline {
    environment {
        CLOUDTRUTH_API_KEY = credentials('CLOUDTRUTH_API_KEY')
        CLOUDTRUTH_PARAMETER = sh(script:'cloudtruth --project Demo --env default parameters get pill', returnStdout: true).trim()

    }
    agent any

    stages {
        stage('CloudTruth') {
            steps {
                echo "Retrieve Parameter from CloudTruth: ${env.CLOUDTRUTH_PARAMETER}"
                sh "cloudtruth --project Demo parameters ls -v -s"
                }
            }
        }
    }
