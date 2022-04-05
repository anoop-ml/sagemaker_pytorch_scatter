DLC_AMI_ID=763104351884
REGION=$(aws configure get region)
account=$(aws sts get-caller-identity --query Account --output text)
aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${DLC_AMI_ID}.dkr.ecr.${REGION}.amazonaws.com

#purge all source files required for files to be in the build context
rm -rf ./source && mkdir ./source
cat ../container-requirements.txt >> ./source/requirements.txt

echo "installing dependencies in the docker image"
echo `cat ./source/requirements.txt`


ECR_REPO="sagemaker-pytorch-scatter"
ECR_URL="${account}.dkr.ecr.${REGION}.amazonaws.com"
image="${ECR_REPO}:sagemaker-training-pytorch-scatter-1.10-gpu-py38"

docker build -t ${image} . --build-arg region=$REGION

aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${ECR_URL}

aws ecr describe-repositories --region ${REGION} --repository-names "${ECR_REPO}" 2>&1 > /dev/null 
if [ $? -ne 0 ]
then
    echo "creating repository $ECR_REPO"
    aws ecr create-repository --region ${REGION} --repository-name "${ECR_REPO}" > /dev/null
fi

docker tag ${image} ${ECR_URL}/${image}
docker push ${ECR_URL}/${image}