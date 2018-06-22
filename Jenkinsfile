def label = "gradle-${UUID.randomUUID().toString()}"
podTemplate(label: label,
        containers: [
            containerTemplate(name: 'docker', image: 'docker:17.12.1-ce-dind', args: 'cat', command: '/bin/sh -c', ttyEnabled: true)
            ],
        volumes: [
                hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
            ]
        ) {
    node(label) {
        container("docker") {
            stage("docker") {
                withCredentials([usernamePassword(credentialsId: 'dockerhubstu', passwordVariable: 'PASSWORD', usernameVariable: 'USER')]) {
                    sh '''
                    cd upr-reporter
                    docker login -p ${PASSWORD} -u ${USER} 
                    docker version
                    docker build . -t stuartcbrown:latest
                    docker push
                '''
                }
            }
        }
    }
}

