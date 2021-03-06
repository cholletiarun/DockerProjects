# install AWS SDK
pip install --user awscli
export PATH=$PATH:$HOME/.local/bin

# install necessary dependency for ecs-deploy
add-apt-repository ppa:eugenesan/ppa
apt-get update
apt-get install jq -y

# install ecs-deploy
curl https://raw.githubusercontent.com/silinternational/ecs-deploy/master/ecs-deploy | \
sudo tee -a /usr/bin/ecs-deploy
sudo chmod +x /usr/bin/ecs-deploy

# login AWS ECR
eval $(aws ecr get-login --region us-east-2 --no-include-email)

#push docker image
docker tag dodkerdemorepo:latest 708079046448.dkr.ecr.us-east-2.amazonaws.com/dodkerdemorepo:latest
docker push 708079046448.dkr.ecr.us-east-2.amazonaws.com/dodkerdemorepo:latest


# update an AWS ECS service with the new imagesaa
ecs-deploy -c sagwmcluster -n sagwmservice -i 708079046448.dkr.ecr.us-east-2.amazonaws.com/dodkerdemorepo:latest
