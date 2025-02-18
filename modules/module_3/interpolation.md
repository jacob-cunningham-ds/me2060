---
title: Lecture Notes
venue: Modules
downloads:
  - file: interpolation.md
    title: interpolation.md
  - file: ../../assets/interpolation_lecture_slides.pdf
    title: interpolation_lecture_slides.pdf
---

## Interpolation

Interpolation is the building block for differentiation, ingegration, solutions to differential equations, signal processing, approximation theory, and many complex algorithms.  The key idea is to find a curve that passes through the data points where the data might come from any field.  

There are two approaches to interpolation: 
- Polynomial interpolation
- Piecewise interpolation

:::{important}
There is a big difference between interpolation and curve-fitting. One of the differences is that in interpolation the function passes through the points.
:::

In interpolation, function (interpolant) must match the data exactly.  We seek a function $f: \mathbb{R} \to \mathbb{R}$ usch that $f(x_i) = y_i$ for $i = 1, \ldots, m$.  We call function $f$ the **interpolant**.

For complex interpolation problems additional information might be included:
- Slope of the interpolant at data points
- Monotonicity
- Convexity

### Existence & Uniqueness of Interpolant

:::{prf:theorem}
For any real data points $\big \{ (x_i, y_i) \big \}^{n}_{i=1}$ with distinct abscissae $x_i$ there exists a unique polynomial interpolant $p(x)$ of degree $n - 1$ which satisfies the interpolation conditions:

$$
\begin{equation}
  p(x_i) = y_i \qquad i = 1, \; 2, \; \ldots n
\end{equation}
$$
:::

In other words, no matter which method or basis is used to obtain the interpolating polynomial, **the same result is obtained**.

For a given set of data points $(t_i, y_i)$, $i = 1,\; \ldots, m$ an interpolant is chosen from the space of functions spanned by a suitable set of **basis functions** $\phi_{1}(t),\; \ldots,\; \phi_{n}(t)$

Interpolating function $f$ is chosen to be a linear combination of the basis functions (a set of pre-defined shapes or patterns):

$$
\begin{equation*}
  f(t) = \sum_{j=1}^{n} x_j \phi_j (t)
\end{equation*}
$$

where the parameters $x_j$ are to be determined. Additionally, we require $f$ to interpolate the data $(t_i, y_i)$:

$$
\begin{equation*}
  f(t_i) = \sum_{j=1}^{n} x_j \phi_j (t_i) = y_i \qquad i = 1,\; \ldots,\; m
\end{equation*}
$$

Which is a system of linear equations that can be written in matrix form as:

$$
\begin{equation*}
  \mathbf{A} \mathbf{x} = \mathbf{y},
\end{equation*}
$$

where, $\mathbf{A}$ is called the Vandermonde matrix, $\mathbf{y}$ is composed of the known data values $y_i$, $\mathbf{x}$ are the unknown parameters to be determined.

$\mathbf{A}$ is an $m \times n$ **basis** matrix where the entires are given by $a_{ij} = \phi_j (t_i)$. In other words, $a_{ij}$ is the value of the jth **basis** function evaluated at the ith **data point**.

::::{tab-set}
:::{tab-item} n = m
Data points can be fit exactly. Need to solve a system of linear equations assuming $\mathbf{A}$ is a nonsingular matrix.
:::
:::{tab-item} n < m
Overdetermined system (more data than the parameters). Data cannot be fitted exactly and we typically use the method of least squares.
:::
:::{tab-item} n > m
Underdetermined system (more parameters than data). Interpolant is non-unique. Additional properties can be useful (e.g., degree of smoothness, monotonicity, convexity).
:::
::::

**Sensitivity** of the parameters $x$ to perturbations in the data depends on the **conditioning** of $\mathbf{A}$.

:::{important}
Choice of basis functions determines the conditioning of $\mathbf{A}$.
:::

### Example: Monomial Basis

Basis function:

$$
\begin{equation*}
  \phi_j (t) = t^{j-1} \qquad j = 1,\; \ldots,\; n
\end{equation*}
$$

Interpolant:

$$
\begin{equation*}
  p_{n-1}(t) = x_1 + x_2 t + \ldots + x_n t^{n-1}
\end{equation*}
$$

$$
\begin{equation*}
  \mathbf{A}\mathbf{x} = 
  \begin{bmatrix}
    1 & t_1 & \ldots & t_{1}^{n-1} \\
    1 & t_2 & \ldots & t_{2}^{n-1} \\
    \vdots & \vdots & \ddots & \vdots \\
    1 & t_n & \ldots & t_{n}^{n-1}
  \end{bmatrix}
  \begin{bmatrix}
    x_1 \\ x_2 \\ \vdots \\ x_n
  \end{bmatrix}
  =
  \begin{bmatrix}
    y_1 \\ y_2 \\ \vdots \\ y_n
  \end{bmatrix}
  = y
\end{equation*}
$$

Three data points are given: (-2, 27), (0, -1), (1, 0). Therefore $m=3$.

$$
\begin{equation*}
\begin{align}
  \phi_j (t) &= t^{j -1} \qquad j = 1,\; \ldots,\; 3 \\
  f(t_i) &= \sum_{j=1}^{m} x_j \phi_j (t_i) = y_i \qquad i = 1,\; \ldots,\; m \\
  &= \sum_{j=1}^{3} x_j t^{j - 1} = y_i \qquad i = 1,\; \ldots,\; 3 \\
  p_2(t) &= x_1 + x_2 t + x_3 t^2
\end{align}
\end{equation*}
$$





















