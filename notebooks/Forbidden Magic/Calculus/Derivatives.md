Rate of change at a given instant
Slope of the tangent of the original function

# Rules
## Constant term rule
The derivative of a constant is 0
$$\huge{\frac{d}{dx}c = 0}$$
Example:
$$\large{\frac{d}{dx}7=0}$$

**Variable**
```
d/dx [x] = 1
```
## Power rule
$$\huge{\frac{d}{dx}x^n = nx^{n-1}}$$

Examples:
$$\large{\begin{matrix}f(x) = x^4 \\ f'(x) = 4x^3 \end{matrix}}$$
Applying negative exponent:


```
           
d/dx [1/x^2] = d/dx [x^-2]
           = -2x^-3
           = -2 / x^3
           
d/dx [sqrt(x)] = d/dx [x^1/2]
           = 1/2 x^-1/2
           = x^-1/2 / 2
           = 1 / 2x^1/2
           = 1 / 2(sqrt(x))
```

**Raised to constant vs raised to func vs raised to variable (?)**
```
d/dx [a^c] = a^c * lna
d/dx [a^u] = a^u * u' * lna
d/dx [a^x]
```

**Constant multiple rule**
```
d/dx [c f(x)] = c * f'(x)

ex.
d/dx [5x^4] = 5 * d/dx[x^4]
            = 5 * 4x^3
            = 20x^3
```

w3
**Product rule**
```
d/dx [uv] = u'v + uv'

h(x) = f(x)g(x)
h'(x) = f'(x)g(x) + f(x)g'(x)

ex.
d/dx [x^3 * sin(x)] = 3x^2 * sin(x) + x^3 * cos(x)
          = x^2 (3 sin(x) + x cos(x))
d/dx [x^2 ln(x)] = 2x ln(x) + x^2 * 1/x
          = 2x ln(x) + x
          = x (2 ln(x) + 1)
```

**Quotient rule**
```
d/dx [u/v] = (vu' - uv') / v^2

ex.
d/dx [3x-5 / 7x+4] = (7x+4)(3) - (3x-5)(7) / (7x+4)^2
           = 21x + 12 - 21x + 35 / (7x+4) ^2
           = 47 / (7x+2)^2
```

w4
**Chain rule**
```
d/dx [f(g(u))] = f'(g[u]) * g'(u) * u'
d/dx [f(g(x))] = f'(g[x]) * g'(x)

d/dx [f(x)]^n = n(f(x))^n-1 * f'(x)

dy/dx = dy/du * du/dx

h(x) = f(g(x))
h'(x) = f'(g(x)) * g'(x)

```

**Reciprocal rule**
```
h(x) = 1/f(x)
h'(x) = - f'(x) / (f(x))^2
```

**Logarithmic functions**
```
d/dx [log_a u] = u'/ (u lna)
d/dx [ln u] = u'/ u
```

**Trigonometric functions**
```
d/dx [sin(u)] = cos(u)u'
ex. d/dx [sin(x^2)] = cos(x^2)(2x)

d/dx [cos(u)] = -sin(u)u'

d/dx [tan(u)] = sec^2(u)u'
d/dx [cot(u)] = -csc^2(u)u'

d/dx [sec(u)] = sec(u) * tan(u) * u'
d/dx [csc(u)] = -csc(u) * cot(u) * u'

d/dx [sin-1(u)] = u' / sqrt(1-u^2)
d/dx [cos-1(u)] = -u' / sqrt(1-u^2)

d/dx [tan-1(u)] = u' / 1 + u^2
d/dx [cot-1(u)] = -u' / 1 + u^2

d/dx [sec-1(u)] = u' / u * sqrt(u^2 - 1)
d/dx [csc-1(u)] = -u' / u * sqrt(u^2 - 1)
```

**Exponential functions**
```
d/dx [c^u] = e^u * u'

ex.
d/dx [e^x] = e^x * 1
           = e^x
d/dx [e^2x] = e^2x * 2
           = 2e^2x
d/dx [e^sin(x)] = e^sin(x) * cos(x)


d/dx [a^u] = a^u * u' * lna

ex.
d/dx [5^x] = 5^x * 1 * ln(5)
d/dx [4^x^2] = 4^x^2 * 2x * ln(4)
d/dx [7^x^4] = 7^x^4 * 4x^3 * ln(7)
```
# Deriving functions
```
f(x) = 4x^3 + 7x^2 - 9x + 5

f'(x) = 4(3x^2) + 7(2x) - 9(1) + 0
f'(x) = 12x^2 + 14x - 9
```

# Vs Limits
```
Slope of a tangent line
m_tan = f'(c) <-- this is the derivative

ex. f(x) = x^3; f'(x) = 3x^2
say x = 2; m_tan = f'(2) = 3(2)^2 = 12

Slope of a secant line
m_sec = (y2 - y1) / (x2 - x1)

ex. choose 2 points whose midpoint is 2
m_sec [1,3] = (f(3) - f(1)) / 3 - 1
            = (3^3 - 1^3) / 3 - 1
            = 27 - 1 / 2
            = 13
m_sec [1.9, 2.1] = (f(2.1) - f(1.9)) / 2.1 - 1.9
            = (2.1^3 - 1.9^3) / 0.2
            = 12.01

Slope of the secant line is close to the slope of the tangent line!

lim x->2 (f(x) - f(2)) / (x - 2)
lim x->2 (x^3 - 8) / (x - 2)
lim x->2 (x-2) (x^2 + 2x + 4) / (x - 2)
lim x->2 2^2 + 2(2) + 4 = 12
```

### 1. Remind Me of the Slope Formula?
As you noted, the algebra slope formula is:

$$\huge{\text{Slope } (m) = \frac{y_2 - y_1}{x_2 - x_1}}$$

This formula tells us the steepness between two distinct points on a line: a "First Point" $(x_1, y_1)$ and a "Second Point" $(x_2, y_2)$.
### 2. Setting Up Our Two Points

In calculus, we want to find the slope of a curve $f(x) = x^3$ at one specific target spot: where $x = 2$.

Because we can't find the slope using only _one_ point (you need two points to draw a line), we pick a fake second point further down the curve.

- **Our Target Point (Point 1):** We want the slope at $x = 2$. If $x_1 = 2$, then the $y$-value is $f(2)$, which is $2^3 = 8$.
    
    - $\mathbf{Point\ 1 = (2, f(2))}$ or $(2, 8)$
        
- **Our Moving Point (Point 2):** We pick a random, flexible point further down the $x$-axis. We just call its position $x$. Its $y$-value will change depending on where it is, so we call it $f(x)$.
    
    - $\mathbf{Point\ 2 = (x, f(x))}$ or $(x, x^3)$
        

### 3. Plugging Them Into the Slope Formula

Now, let's plug these exact coordinates into your $y_2 - y_1$ formula:

- $x_1 = 2$
    
- $y_1 = f(2)$
    
- $x_2 = x$
    
- $y_2 = f(x)$
    

$$\text{Slope} = \frac{y_2 - y_1}{x_2 - x_1} \longrightarrow \frac{f(x) - f(2)}{x - 2}$$