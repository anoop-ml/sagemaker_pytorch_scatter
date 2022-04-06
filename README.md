Sample to bootstrap [PyTorch Scatter](https://github.com/rusty1s/pytorch_scatter) in SageMaker

Pre-reqs

- Setup Machine to build the SageMaker Training container (make sure your drive has enough space for docker images)
  - Option 1 [easy to setup] - Launch a SageMaker notebook on ml.p3.2xlarge and use terminal in JupyterLab
  - Option 2 - Launch a EC2 instance on p3.2xlarge with Deep Learning AMI (Amazon Linux 2) (tested against Version 51.0, [ami-021c79f126312c652](https://us-east-1.console.aws.amazon.com/ec2/v2/home?region=us-east-1#ImageDetails:))

To Run

- Prepare machine to enable GPU access during build (this repo was run in a SageMaker notebook on ml.p3.2xlarge)
  - You need to [enable GPU access during docker build](https://github.com/NVIDIA/nvidia-docker/wiki/Advanced-topics#default-runtime)
  - Run `cd utils;sh setup.sh`
- Create a Custom Container image to be used in SageMaker Training
  - Run `cd container; sh build_and_push.sh`
- Run the notebook to trigger SageMaker Training



**Tested on SageMaker notebook on ml.p3.2xlarge and us-east-1**

