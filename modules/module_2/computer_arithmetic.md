---
title: Lecture Notes
venue: Modules
downloads:
  - file: computer_arithmetic.md
    title: computer_arithmetic.md
  - file: ../../assets/computer_arithmetic.pdf
    title: computer_arithmetic.pdf
---

## Floating Point Representation for Real Number

:::{prf:definition} Floating Point Representation
:label: def-fpr
$$
\begin{equation*}
  m.b^{e}
\end{equation*}
$$

where,
- $m$: mantissa or significand
- $b$: base (2, 8, 10, 16, etc.)
- $e$: exponent (always an integer)

:::

[Definition (%s)](#def-fpr) provides a way to represent real numbers that can be very large or very small in a computer. The mantissa ($m$) contains the significant digits and represents the precision of the number. For exampe, in the number 1.23 the mantissa is 1.23. The base ($b$) indicates the number system used for the representation. The exponent ($e$) defines the scale or magnitude of the number.

Consider 1/34 = 0.029411765. Assume we have a system where 4 decimal places are allowed. In base 10 we can represent the number as:
- $1/34 \approx 0.0294 \times 10^{0}$
- $1/34 \approx 0.2941 \times 10^{-1}$

:::{tip}
By normalizing the mantissa, we increase the precision because the leading bit is always 1 so there is no need to store it.

$$
\begin{equation*}
  \frac{1}{b} \leq m < 1
\end{equation*}
$$
:::

Real number set $\mathbb{R}$ is infinite, continuous, and unbounded but computers have a finite precision (i.e., 32 bit, 64 bit). Floating point representation is based on exponential notation.

$$
\begin{equation*}
  \pm (S) \times 10^{E}, \; \mathrm{where} \; 1 \leq S < 10
\end{equation*}
$$

On computers, a binary system is used to represent real numbers.

$$
\begin{equation*}
  \pm (S) \times 2^{E}, \; \mathrm{where} \; 1 \leq S < 2
\end{equation*}
$$

:::{prf:definition} Binary Representation

In binary the mantissa is defined as:

$$
\begin{equation*}
  S = \pm (1 + f) \qquad \mathrm{where} \; f = \sum_{i=1}^{p}b_i 2^{-i}
\end{equation*}
$$

where,
- $p$ is the precision
- $b$ is the binary digit such that $b \in \{0, 1\}$
:::

Consider the following example.

:::{prf:example}
Normalize $71_{10}$ in Base 2

1. Convert 71 to binary

2. Normalize the mantissa

:::

### Toy Problem

### Precision & Signifcant Digits

### Accuracy

### Subtractive Cancellation

## Condition Number

## Approximations in Scientific Computing

## Stability