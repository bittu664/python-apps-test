node {
  
  stage ('Docker build') {
  docker.build('python-test')
  }
  stage ('Docker push') {
  docker.withRegistry('https://861458561402.dkr.ecr.us-east-2.amazonaws.com/python-test', 'ecr:us-east-2:aws-ecr') {
    docker.image('python-test').push('latest')
  }
}
}
