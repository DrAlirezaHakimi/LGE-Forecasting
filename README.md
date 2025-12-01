# Local Geometric Extrapolation (LGE)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Official MATLAB implementation of **Local Geometric Extrapolation (LGE)**, a simple, training-free, and computationally trivial framework for time-series forecasting. This repository contains the source code accompanying the manuscript:

> **"A universal principle for computationally trivial forecasting"**
> *Nature Computational Science* (Submitted)

---

## 📌 Overview

In an era dominated by large-scale, computationally expensive "black-box" models, **LGE** presents a paradigm shift. It demonstrates that high-accuracy forecasting in complex dynamic systems can be achieved through a simple, interpretable geometric principle without requiring historical data depth, hyperparameter tuning, or training phases.

The core of the LGE method is an **O(1)** operation that utilizes only the two most recent data points to extrapolate the next state.

### The LGE Principle
The forecast `P` for the next time step `t+1` is a geometric extrapolation based on the instantaneous growth factor observed between the current and previous value.
```math
P_{t+1} = V_t \times \left( \frac{V_t}{V_{t-1}} \right)
