# Pyramid Texture Filtering

This code is the implementation of [SIGGRAPH 2023](https://s2023.siggraph.org/) paper "Pyramid Texture Filtering".

### [Paper](https://arxiv.org/abs/2305.06525)  [Project](https://rewindl.github.io/pyramid_texture_filtering/) 

## Usage:
  - Input test images into `figures` folder and set `img_name` , `sigma_s` and `sigma_r` in `demo.m`.
  - Run `demo.m`, the results will be saved in `output` folder.

## Notes:
  * This code is written in MATLAB R2021b and use Parallel Computing Toolbox.
  * This code does not apply any accelerated algorithm for the joint bilateral filter. The algorithm in ["A Fast Approximation of the Bilateral Filter using a Signal Processing Approach"](https://people.csail.mit.edu/sparis/publi/2006/eccv/Paris_06_Fast_Approximation.pdf)(ECCV 2006) can be used to achieve faster speeds, but will limit range weights to be calculated in separate channels.
  * To get more details of proposed method, please see our paper and project page.
  * If you use our code, please cite the paper. 

```
@article{zhang2023pyramid,
    title   = {Pyramid Texture Filtering},
    author  = {Zhang, Qing and Jiang, Hao and Nie, Yongwei and Zheng, Wei-Shi},
    journal = {ACM Transactions on Graphics (Proceedings of ACM SIGGRAPH 2023)},
    year    = {2023},
    volume  = {},
    number  = {},
    pages   = {}
}
```

