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
  docker.withRegistry('https://861458561402.dkr.ecr.us-east-2.amazonaws.com/python-test', 'ecr:us-east-2:aws-keys') {
        ImageTag = "${checkout(scm).GIT_COMMIT}"
    
    docker.image('python-test').push("${ImageTag}")
  }
}
  stage('Deploying HELM Chart in Kubernetes') {
    withKubeConfig([credentialsId: 'my-kubernetes', serverUrl: 'https://F16428A6A98F68A4E809DCE9C3CD1D98.gr7.us-east-2.eks.amazonaws.com']) {
      sh 'helm install my-cherry-chart python-helm-apps/ --set image.tag="{{.ImageTag}}" --values python-helm-apps/values.yaml'
      sh 'kubectl get pods'
    }
  }
}
