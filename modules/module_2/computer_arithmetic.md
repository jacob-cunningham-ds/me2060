---
title: Lecture Notes
venue: Modules
downloads:
  - file: computer_arithmetic.md
    title: computer_arithmetic.md
  - file: ../../assets/computer_arithmetic_lecture_slides.pdf
    title: computer_arithmetic_lecture_slides.pdf
  
kernelspec:
  name: julia-1.10
  display_name: 'julia 1.10'
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

    $(71)_{10} = (1000111)_{2}$

2. Normalize the mantissa

    $$
    \begin{equation*}
    \begin{align*}
      (71)_{10} &= (1.000111)_{2} 2^{6} \\
      &= \bigg ( 1 + 0 \cdot \frac{1}{2^1} + 0 \cdot \frac{1}{2^2} +
      0 \cdot \frac{1}{2^3} + 1 \cdot \frac{1}{2^4} + 1 \cdot \frac{1}{2^5}  +
      1 \cdot \frac{1}{2^6} \bigg ) \times 2^6
    \end{align*}
    \end{equation*}
    $$
:::

Recall that:

$$
\begin{equation*}
f = \sum_{i=1}^{p}b_{i}2^{-i} = 2^{-p} \sum_{i=1}^{p} b_{i} 2^{p-i} = 2^{-p}z,
\quad \text{where} \; z \in \{0, 1, \ldots, 2^{p} - 1\}
\end{equation*}
$$

Substitute into $\pm (1 + f) \times 2^{E}$ results in $2^{p}$ evenly spaced numbers in the interval $[2^{E},\; 2^{E+1})$.

The smallest number larger than 1.0 is $1 + 2^{-p}$ and that the precision $p$ sets the machine epsilon $\epsilon_{m} = 2^{-p}$.

:::{exercise}
Show that the distance between floating point numbers $2^{E}$ and $2^{E+1}$ is $2^{E} \epsilon_{m}$.
:::

:::{warning} TODO
Finish the exercise and go over this section because I don't understand it fully.
:::

### Toy Problem

Assume a 7-bit system. Use the first bit for the sign of the number, next three digits for the sign and magnitude of the exponents, and the last three digits for the mantissa.

The smallest positive number:
- Binary 0111100
- Decimal 0.0625

The mantissa is normalized (i.e., $1 / b \leq m \leq m$) so the smallest $m$ in binary is 100. The next largest number is $(0111101)_{2} = (0.078125)_{10}$, the next floating point number is $(0111110)_{2} = (0.093750)_{10}$, and the next floating point number is $(0111111)_{2} = (0.109375)_{10}$.

We decrease the exponent to keep increasing the number toward $+ \infty$

$$
\begin{equation*}
\begin{align*}
  (0110101)_{2} &= (0.125000)_{10} \\
  (0110110)_{2} &= (0.156250)_{10} \\
  (0110111)_{2} &= (0.187500)_{10}
\end{align*}
\end{equation*}
$$

Largest positive number in the toy problem:

$$
\begin{equation*}
  (0011111)_{2} = (7.0)_{10}
\end{equation*}
$$

Overflow error is the attempt to represent large numbers outside the acceptable range.

Underflow error is the attempt to represent small numbers outside the acceptable range.

:::{note}
We can have smaller numbers than the smallest number in the IEEE 754 standard but with less precision.
:::

Subnormals and Gradual underflow

When we normalized the mantissa, we did not store the leading bit 1 because it is always 1 (why waste a bit). However, if we let it to be 0, we can squeeze in more floating-point numbers, but with reduced precision.

**Subnormals do not make machine epsilon $\epsilon_m$ smaller**

:::{warning} TODO
Go over this section, specifically subnormals and gradual underflow.
:::

### Precision & Signifcant Digits

Consider Planck's constant $6.626068 \times 10^{-34}$. If we change the last digit by 1, then the relative change is:

$$
\begin{equation*}
  \frac{0.000001 \times 10^{-34}}{6.626068 \times 10^{-34}} \approx 1.51 \times {10^-7}
\end{equation*}
$$

The relative error is about $10^{-7}$ so we can say that the original number had 7 significant digits or precision of the floating point number is 7 **decimal** digits. More generally:

$$
\begin{equation*}
  \text{digits} = \log_{10}{\bigg | \frac{\tilde{x} - x}{x} \bigg |}
\end{equation*}
$$

:::{important}
Precision does not mean accuracy. Any wrong answer can be represented with any given precision.
:::

### Accuracy

Absolute accuracy is defined as $|\tilde{x} - x|$ and relative accuracy is defined as $\frac{|\tilde{x} - x|}{|x|}$.

:::{tip}
In your reports be consistent with your precision!
:::

### Double Precision

IEEE standard 754 specifies how to store so-called double precision numbers. 64 bits per number means $d=52$ digit mantissas, 11 digits for exponent $e$, and a sign bit. 32 bits means $d=23$ binary digits for mantissa.

For 64 bit, $\epsilon_{m} = 2^{-52} \approx 2.2 \times 10^{-16}$; this is about 16 digits. The biggest number is $2^{1024} \approx 2 \times 10^{308}$, and the smallest number is $2^{-1022} \approx 2 \times 10^{-307}$.

### Subtractive Cancellation

Consider two nearly equal large numbers $b$ and $c$ and let subscript $c$ denote the computer representation of the number.

$$
\begin{equation*}
\begin{align*}
  a_c &\approx b_c - c_c \\
  &\approx b(1 + \epsilon_b) - c(1 + \epsilon_c) \\
  &\approx b - c + b \epsilon_b - c \epsilon_c \\
  &\approx a + a(\epsilon_b - \epsilon_c) \\
  \frac{a_c}{a} &\approx 1 + \frac{b}{a} \epsilon_b - \frac{c}{a} \epsilon_c \\
  1 + \epsilon_a &\approx 1 + \frac{b}{a}(\epsilon_b - \epsilon_c)
\end{align*}
\end{equation*}

Remember that $b \approx c$, $a_c \approx a(1 + \epsilon_a)$. Worst case $(\epsilon_b - \epsilon_c) \approx \mathrm{max}[\epsilon_b, \; \epsilon_c]$. Also remember that $b$ is a large number and $a$ is a small number so $\epsilon_a$ is very large.

:::{warning} TODO
Go over this to fully understand.
:::

Another way to think about this is by putting the number $x$ in the computer is $\mathrm{fl}(x) = x(1 + \epsilon)$ We can write that the computer implementation of $f(x) = x + 1$ as $y = x(1 + \epsilon) + 1$. Then the relative error becomes:

$$
\begin{equation*}
\begin{align*}
  \frac{|y - f(x)|}{|f(x)|} = \frac{|x + \epsilon x + 1) - (x + 1)|}{|x + 1|} =
  \frac{|\epsilon x |}{| 1 + x|}
\end{align*}
\end{equation*}
$$

For $x$ near -1, the relative error can become very large. Say we have 5 digits and add -1.0012 to 1; then we get $-1.2 \times 10^{-3}$. Only two digits are correct and this is called **subtractive cancellation** which is an important source of error.

:::{warning} TODO
I'm confused if subtractive cancellation affects precision which in turn affect accuracy or if it is just a precision error.
:::

**Cancellation Example**
:::{code-cell} julia
# x in double precision
x_d = 3.141592653589793

# x in single precision
x_s = 3.1415927

# y in double precision
y_d = 3.141592653585682

# y in single precision
y_s = 3.1415927

# x - y in double precision
x_minus_y_d = x_d - y_d

# x - y in single precision
x_minus_y_s = x_s - y_s

# exact x - y from hand calculation
x_minus_y_e = 4.111e-12

# garbge in double precision answer
x_minus_y_d - x_minus_y_e
:::

## Condition Number

Condition number $\kappa_{f}(x)$ is the ratio of relative error of the output to the relative error of the input:

$$
\begin{equation*}
  \kappa_{f}(x) = \frac{\frac{|f(x) - f(\tilde{x})|}{|f(x)|}}{\frac{|x - \tilde{x}|}{|x|}}
\end{equation*}
$$

It does not depend on the data or the computer. Condition number indicates the magnification of errors in computing $f(x)$. We can measure how bad an operation or problem is with the condition number.

Let the exact number $x$ become $\tilde{x} = \mathrm{fl}(x) = x(1 + \epsilon)$. Then considering only changes due to $x$, one gets:

$$
\begin{equation*}
  \kappa_{f}(x) = \frac{|f(x) - f(x(1 + \epsilon))|}{|\epsilon f(x)|}
\end{equation*}
$$

In the limit of small error $\epsilon \to 0$ (ideal computer):

$$
\begin{equation*}
  \kappa_{f}(x) = \lim_{\epsilon \to 0} \bigg | \frac{f(x + \epsilon x) - f(x)|}{\epsilon f(x)} \bigg | = \bigg | \lim_{\epsilon \to 0} \frac{f(x + \epsilon x) - f(x)}{\epsilon x} \cdot \frac{x}{f(x)} \bigg | = \bigg | \frac{x f'(x)}{f(x)} \bigg |
\end{equation*}
$$

If $x$ is perturbed by a small amount, the relative error of representing a function $f(x)$ is magnified by its condition number:

$$
\begin{equation*}
  \kappa_{f}\epsilon \approx \bigg | \frac{f(x + \epsilon x) - f(x)}{f(x)} \bigg |
\end{equation*}
$$

A problem is **ill-conditioned** when its condition number is large.  Assume you have a function $h(x) = f(g(x))$, then the composite condition number is $\kappa_{h}(x) = \kappa_{f}(g(x)) \cdot \kappa_{g}(x)$.

:::{prf:example}
Calculate $\kappa_{f}(x)$ for $f(x) = x - c$.

$$
\begin{equation*}
\begin{align*}
  \kappa_{f}(x) &= \bigg | \frac{x f'(x)}{f(x)} \bigg | \\
  &= \bigg | \frac{x \cdot 1}{x - c} \bigg | \\
  &= \bigg | \frac{x}{x - c} \bigg |
\end{align*}
\end{equation*}
$$

The condition number is large when $x \approx c$; conditiong is poor there.
:::

:::{prf:example}
Calculate $\kappa_{f}(x)$ for $f(x) = cx$.

$$
\begin{equation*}
  \kappa_{f}(x) = \bigg | \frac{x f'(x)}{f(x)} \bigg |
  = \bigg | \frac{x \cdot c}{cx} \bigg |
  = 1
\end{equation*}
$$

There is no magnification of error.
:::

:::{prf:example}
Calculate $\kappa_{f}(x)$ for $f(x) = \cos{x}$.

$$
\begin{equation*}
  \kappa_{f}(x) = \bigg | \frac{x f'(x)}{f(x)} \bigg |
  = \bigg | \frac{-x \sin{x}}{\cos{x}} \bigg |
  = | x \tan{x} |
\end{equation*}
$$

The condition number is large when $x = a \pi / 2$, where $a$ is an odd integer.
:::

:::{code-cell} julia
# Packages used
import Plots as plt
import LaTeXStrings as ltx

# Create x and y vectors
x = range(-2*pi, 2*pi, 500)
y = tan.(x)

# Vector of vertical lines
v = -2*pi:pi/2:2*pi

# Plot the results
plt.plot(x, y,
    lc=:blue, lw=2,
    label=ltx.L"\tan{x}")
plt.vline!(v, lc=:red, ls=:dash, label="")
plt.hline!(0, lc=:gray, label="")
plt.ylims!(-10, 10)
plt.xlims!(-1.1*2*pi, 1.1*2*pi)
plt.title!(ltx.L"Plot of $\tan{x}$ with Highlights at Multiples of $\pi/2$")
plt.xlabel!(ltx.L"$x$ (radians)")
plt.ylabel!(ltx.L"\tan{x}")
:::

## Approximations in Scientific Computing

Total error is equivalent to computational error plus propagated data error.

$$
\begin{equation*}
  \text{Total Error} = \bigg [ \tilde{f}(\hat{x}) - f(\hat{x}) \bigg ]
  + \bigg [ f(\hat{x}) - f(x) \bigg ]
\end{equation*}
$$

:::{prf:example} Calculate the surface area of Earth
Approximate the Earth as a sphere which introduces **modeling error**. So we have $\text{Area} = 4 \pi R^{2}$. Say we measure $R \approx 6370$ which introduces **measurement error**. We need to represent $\pi$ and say we use single precision so $\pi = 3.141592$ (**truncation error**). We'll have **rounding errors** due to the finite precision of computer arithmetic.
:::

## Stability

Algorithms can also be a source of error. Ill-conditioning may not explain the source of error in a problem. When error in a problem exceeds what can be explained by ill-conditioning, we call the algorithm **unstable**.

Stability does not guarantee accuracy. A stable method can produce incorrect results.

Stability refers to the effects of **computational error** on the results; whereas, Conditioning refers to the effects of **data error** on the results.

:::{important}
We get accurate results when we apply a stable algorithm to a well-conditioned problem.
:::

:::{warning} TODO
I'm confused by conditioning vs stability.
:::

The algorithm $\tilde{f}(x)$ for problem $f(x)$ has forward error:

$$
\begin{equation*}
  \Delta y = \frac{|\tilde{f}(x) - f(x)|}{|f(x)|}
\end{equation*}
$$

The algorithm has backward error:

$$
\begin{equation*}
  \Delta x = \frac{|\tilde{x} - x|}{|x|}, \; \ni \; \tilde{f}(x) = f(\tilde{x})
\end{equation*}
$$

Suppose we have following problem:

$$
\begin{equation*}
  f(x) = \cos{x} = 1 - \frac{x^2}{2!} + \frac{x^4}{4!} - \frac{x^6}{6!} + \ldots
\end{equation*}
$$

Let's represent $\cos{x}$ with the first two terms in the infinite series:

$$
\begin{equation*}
  \hat{y} = \hat{f}(x) = 1 - \frac{x^2}{2!}
\end{equation*}
$$

The forward error is then:

$$
\begin{equation*}
\begin{align*}
  \Delta y &= \hat{y} - y \\
  &= \hat{f}(x) - f(x) \\
  &= 1 - \frac{x^2}{2!} - \cos{x}
\end{align*}
\end{equation*}
$$

To solve for the backward error we first need to find $\hat{x}$:

$$
\begin{equation*}
\begin{align*}
  \hat{f}(x) &= f(\hat{x}) \\
  1 - \frac{x^2}{2!} &= \cos{\hat{x}} \\
  \hat{x} &= \arccos(1 - \frac{x^2}{2!})
\end{align*}
\end{equation*}
$$

The backward error is then:

$$
\begin{equation*}
  \Delta x = \arccos(1 - \frac{x^2}{2!}) - 1
\end{equation*}
$$

Then for $x = 1$ the forward error is -0.0403 and the backward error is 0.0472.

### Condition Number a Different Perspective

Condition number is a measure of the relative change in the solution with respect to the relative change in the input. **It is a quantitative measure of sensitivity.**

$$
\begin{equation*}
  \kappa_{f}(x) = \frac{\frac{|f(x) - f(\tilde{x})|}{|f(x)|}}{\frac{| x - \tilde{x}|}{|x|}} = \frac{\text{relative forward error}}{\text{relative backward error}}
\end{equation*}
$$

Condition number bounds the forward error:

$$
\begin{equation*}
  |\text{relative forward error}| \leq \kappa_{f}(x) \times |\text{relative backward error}|
\end{equation*}
$$

:::{important}
Recall that:

$$
\begin{equation*}
  \kappa_{f}(x) = \bigg | \frac{x f'(x)}{f(x)} \bigg |
\end{equation*}
$$

The condition number depends on the input (i.e., $x$).
:::

Continuing our previous example where $f(x) = \cos{x}$:

$$
\begin{equation*}
  \kappa{f}(x) = \frac{\text{relative forward error}}{\text{relative backward error}} \approx 1.58
\end{equation*}
$$

$$
\begin{equation*}
  \kappa_{f}(x) = \bigg | \frac{x f'(x)}{f(x)} \bigg | =
  \bigg | \frac{-\sin{1}}{\cos{1}} \bigg | =
  \tan{1} \approx 1.55741
\end{equation*}
$$

:::{note}

If $x$ or $f(x)$ is nearly zero, we can use the **absolute condition number**:

$$
\begin{equation*}
  \kappa_{f}(x) = \frac{|f(x) - f(\tilde{x})|}{|x - \tilde{x}|}
\end{equation*}
$$
:::


























