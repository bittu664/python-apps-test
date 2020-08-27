node {
  
  environment{
      ImageTag = "${checkout(scm).GIT_COMMIT}"
  }
  stage('Clone repository') {
        git branch: "master", url: "https://github.com/bittu664/python-apps-test.git"
    }
  stage ('Docker build') {
  docker.build('python-test')
  }
  stage ('Docker push') {
  docker.withRegistry('https://1234567890.dkr.ecr.us-east-2.amazonaws.com/python-test', 'ecr:us-east-2:aws-keys') {
        ImageTag = "${checkout(scm).GIT_COMMIT}"
    
    docker.image('python-test').push("${ImageTag}")
  }
}
  stage('Deploying HELM Chart in Kubernetes') {
    withKubeConfig([credentialsId: 'rancher-k88', serverUrl: 'https://A2B63349548A1EA7CECC4581DDEA6EEB.gr7.us-east-2.eks.amazonaws.com']) {
      sh 'helm install my-cherry-chart python-helm-apps/ --set image.tag=3c9956e60a52a10d71b98502e93f97dd56ceaaef --values python-helm-apps/values.yaml'
      sh 'kubectl get pods'
    }
  }
}
