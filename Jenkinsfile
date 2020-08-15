node {
  stage('Clone repository') {
        git branch: "master", url: "https://github.com/bittu664/python-apps-test.git"
    }
  stage ('Docker build') {
  docker.build('python-test')
  }
  stage ('Docker push') {
  docker.withRegistry('https://861458561402.dkr.ecr.us-east-2.amazonaws.com/python-test', 'ecr:us-east-2:aws-ecr') {
        ImageTag = "${checkout(scm).GIT_COMMIT}"
    
    docker.image('python-test').push("${ImageTag}")
  }
}
}
