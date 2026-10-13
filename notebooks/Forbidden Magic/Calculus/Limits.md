Take the following function as an example:
$$\huge{f(x) = \frac{x^2-4}{x-2}}$$

If we try getting f(2), it's indeterminate.
$$\huge{f(2) = \frac{2^2-4}{2-2}}$$
$$\huge{f(2) = \begin{rcases} \frac{0}{0} \end{rcases} \text{\normalsize{divide by zero; indeterminate}}}$$
Since we can't use 2 directly, we can plugging in values close 2 to see what value comes out.
$$\huge{f(2.1) = \frac{2.1^2-4}{2.1-2} = 4.1}$$
$$\huge{f(2.01) = \frac{2.01^2-4}{2.01-2} = 4.01}$$
We can see that as x approaches 0, it gets closer and closer to 4.

A limit is a way of solving as x approaches a certain number.
$$\large{\lim_{x\to2}f(x) = \frac{x^2-4}{x-2}}$$
$$\large{\lim_{x\to2}f(x) = \frac{(x+2)(x-2)}{x-2}}$$
$$\large{\lim_{x\to2}f(x) = x+2}$$
$$\large{\lim_{x\to2}f(x) = 2+2 = 4}$$