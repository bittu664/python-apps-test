node {
  
  stage ('Docker build') {
  docker.build('nodejs-test')
  }
  stage ('Docker push') {
  docker.withRegistry('https://861458561402.dkr.ecr.us-east-2.amazonaws.com/nodejs-test', 'ecr:us-east-2:aws-ecr') {
    docker.image('nodejs-test').push('latest')
  }
}
}
