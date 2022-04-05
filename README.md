#  Draft

Sample to bootstrap [PyTorch Scatter](https://github.com/rusty1s/pytorch_scatter) in SageMaker

To Run

- Prepare machine to enable GPU access during build (this repo was run in a SageMaker notebook on ml.p3.2xlarge)
  - You need to [enable GPU access during docker build](https://github.com/NVIDIA/nvidia-docker/wiki/Advanced-topics#default-runtime)
  - Run `cd utils;sh setup.sh`
- Create a Custom Container image to be used in SageMaker Training
  - Run `cd container; sh build_and_push.sh`
- Run the notebook to trigger SageMaker Training
- Tested on SageMaker notebook and us-east-1