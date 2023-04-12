pipeline {
    agent any
    stages {
        stage ('Clone Repo'){
            steps {
                //This step is to clone repo from github
                git url: 'https://github.com/satishkamuju/ClaireUTILS.git',
                    branch: 'main',
                    credentialsId: 'GITHUB_CREDS'
            }
        }
        stage ('Compile Repo'){
            steps {
                sh 'make clean'
                sh 'make'
            }
        }
        stage ('Copy artifacts'){
            steps {
                sh 'cp -r bin /Users/satishkamuju/.jenkins/artifacts/'
                sh 'ls -la /Users/satishkamuju/.jenkins/artifacts/bin'
            }
        }
        stage ('Clean workspace'){
            steps {
                sh 'rm -rf *'
                sh 'rm -rf .git'
                sh 'rm -rf .gitignore'
            }
        }
    }
}
