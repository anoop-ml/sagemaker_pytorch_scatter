import argparse
import os
import sys
import time

import torch
from torch_scatter import scatter_max


def train(args):

    print('torch cuda is_available', torch.cuda.is_available())

    src = torch.tensor([[2, 0, 1, 4, 3], [0, 2, 1, 3, 4]])
    index = torch.tensor([[4, 5, 4, 2, 3], [0, 0, 2, 2, 1]])

    out, argmax = scatter_max(src, index, dim=-1)
    
    print(out)
#    tensor([[0, 0, 4, 3, 2, 0],
#            [2, 4, 3, 0, 0, 0]])

    print(argmax)
#    tensor([[5, 5, 3, 4, 0, 1]
#            [1, 4, 3, 5, 5, 5]])


if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    
    args = parser.parse_args()

    train(args)