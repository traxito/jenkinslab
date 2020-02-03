// comment
pipeline {
 agent any
 stages {
        stage('Checkout-git'){
               steps{
		git poll: true, url: 'git@github.com:videocursoscloud/test-jenkins-1.git'
               }
        }
        stage('CreateVirtualEnv') {
            steps {
				sh '''
					bash -c "virtualenv --python=python3 entornovirtual && source entornovirtual/bin/activate"
				'''

            }
        }
        stage('InstallRequirements') {
            steps {
            	sh '''
            		bash -c "source ${WORKSPACE}/entornovirtual/bin/activate && ${WORKSPACE}/entornovirtual/bin/python ${WORKSPACE}/entornovirtual/bin/pip install -r requirements.txt"
                '''
            }
        }   
        stage('TestApp') {
            steps {
            	sh '''
            		bash -c "source ${WORKSPACE}/entornovirtual/bin/activate &&  cd src && ${WORKSPACE}/entornovirtual/bin/python ${WORKSPACE}/entornovirtual/bin/pytest && cd .."
                '''
            }
        }  
        stage('RunApp') {
            steps {
            	sh '''
            		bash -c "source entornovirtual/bin/activate ; ${WORKSPACE}/entornovirtual/bin/python pruebapython main.py &"
                '''
            }
        } 
        stage('BuildDocker') {
            steps {
            	sh '''
            		docker build -t jenkinsdockertest:latest .
                '''
            }
        } 
    stage('PushDockerImage') {
            steps {
            	sh ''
					 docker tag jenkinsdockertest:latest traxito/jenkinsdockertest:latest
                                         docker push traxito/jenkinsdockertest:latest
                '''
            }
        } 
  }
}
