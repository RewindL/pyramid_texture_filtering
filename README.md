# Pyramid Texture Filtering

This MATLAB code is the implementation of [SIGGRAPH 2023](https://s2023.siggraph.org/) paper "Pyramid Texture Filtering".

### [[Paper]](https://arxiv.org/abs/2305.06525)  [[Project]](https://rewindl.github.io/pyramid_texture_filtering/) 

## Usage:
  - Put test images into the `input` folder and set `img_name` , `sigma_s` and `sigma_r` in `demo.m`.
  - Run `demo.m`, the results will be saved in the `output` folder.

## Notes:
  * To achieve best visual results, we do not apply any approximated acceleration algorithm for bilateral filter. 
  * If you use the code, please cite our paper. 

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

