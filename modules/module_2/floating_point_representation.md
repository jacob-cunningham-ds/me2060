---
title: Floating Point Representation
venue: Modules

kernelspec:
  name: julia-1.10
  display_name: 'julia 1.10'
---

```{iframe} https://www.youtube.com/embed/97Gb9TS3MJs?si=N6nJICFOZrVrb35G
:width: 100%
```

---

## Notes

Use finite set $\mathbb{F}$ to replace real numbers.

If we equally space numbers along the real number line, then smaller numbers would have lower precision than larger numbers.  For example if my number line is divided into 0.25 steps, the first number after 1 is 1.25 and the first number after 1,000,000 is 1,000,000.25. This is not a good idea.

Suppose we look at the interval [1, 2]. Let's add equally spaced points on this interval so that the points encompose [1, 2).  Computers like binary so let's say that there are $2^{d}$ points within this interval. Suppose $d = 3$:

```{code-cell} julia
:tags: [remove-input]
using Printf
start, stop = 1, 2
values = 2^3
step = (stop - start) / (values + 1)
points = [value for value in range(start, stop = stop - step, step=step)]

for (idx, value) in enumerate(points)
    println(@sprintf("Point %d: %0.4f", idx, value))
end
```

Now if we multiply those points by 2 we get:

```{code-cell} julia
:tags: [remove-input]
points_x2 = 2 * points

for (idx, value) in enumerate(points_x2)
    println(@sprintf("Point %d: %0.4f", idx, value))
end
```

They are still equally spaced but they have twice as wide the original spacing as the original group. Suppose we multiply by $2^-1$ instead:

```{code-cell} julia
:tags: [remove-input]
points_half = 0.5 * points

for (idx, value) in enumerate(points_half)
    println(@sprintf("Point %d: %0.4f", idx, value))
end
```

Each interval $[2^{e},\; 2^{e + 1})$ has $2^{d}$ evenly spaced values in $\mathbb{F}$; however the spaces between values are different in different intervals.

Say $x \in \; [2^{e}, \; 2^{e + 1})$ and $\mathrm{fl}(x)$ is the closest value in $\mathbb{F}$. Then the difference between the floating point representation of $x$ and $x$ itself is bounded by half the size of the space between the points.

$$
\begin{equation*}
  |\mathrm{fl}(x) - x| \leq \frac{1}{2} \cdot \frac{2^{e + 1} - 2^{e}}{2^{d}}
\end{equation*}
$$

The error is bounded by half the spacing because when you store a number in floating point format, it is rounded to the nearest representable value within the interval. If we think about the relative error of $x$:

$$
\begin{equation*}
    \bigg | \frac{\mathrm{fl}(x) - x}{x} \bigg | &\leq \frac{1}{2} \cdot \frac{2 - 1}{2^d} = \frac{1}{2} \cdot 2^{-d} = \epsilon_{M}
\end{equation*}
$$

Another way to read this is that the relative error is at most the machine epsilon ($\epsilon_M$), which is the upper bound for floating point representation error.

IEEE 754 double precision uses $d=52$ and IEEE 754 single precision uses $d=23$.

```{code-cell} julia
:tags: [remove-input]
function epsilon_m(d)
    return (1 / 2) * float(2)^(-d)
end

println(@sprintf("The relative error for floating point representation error using IEEE 754\ndouble precision is %e\n", epsilon_m(52)))
println(@sprintf("The relative error for floating point representation error using IEEE 754\nsingle precision is %e", epsilon_m(23)))
```
    




