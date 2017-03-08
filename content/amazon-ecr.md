+++
title = "amazon ecr"
draft = true
date = "2017-03-08T15:00:14+09:00"

+++

# for the first time
see [Amazon EC2 Container Service First Run](https://console.aws.amazon.com/ecs/home?region=us-east-1#/firstRun)

# install aws client

curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"  
sudo python get-pip.py  
rm get-pip.py  
sudo pip install awscli  

## configure aws client

### prepare aws key

create IAM role and prepare access key and secret key

### set keys to awsclient

$ aws configure

```
AWS Access Key ID [None]: xxxxxxxxxxxxxxxxxxxx
AWS Secret Access Key [None]: ........................................
Default region name [None]: us-east-1
Default output format [None]:
```

# create ecr

region: us-east-1  

access https://console.aws.amazon.com/ecs/home?region=us-east-1#/repositories  
and create a repository  

# push a docker image

## connect local to aws

retrieve a docker login command  
$ aws ecr get-login --region us-east-1  

```
docker login -u AWS -p xxxxxx -e none https://xxxxxxx.dkr.ecr.us-east-1.amazonaws.com
```

run the docker login above  

## prepare docker image

# docker build -t sample .

## tag a docker image

make tag name same as ecr name  
e.g. xxxxxxx.dkr.ecr.us-east-1.amazonaws.com/freks-repository  

docker tag sample xxxxxxx.dkr.ecr.us-east-1.amazonaws.com/freks-repository:image-tag-sample  

## upload images

docker push xxxxxxx.dkr.ecr.us-east-1.amazonaws.com/freks-repository:image-tag-sample  



