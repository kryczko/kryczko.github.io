Problem 2.1
==================

.. default-role:: math

Prove the following three theorems:

(a) For normalizable solutions, the separation constant E must be real. *Hint*: Write `E` (in Equation 2.7) as `E_0+i\Gamma` (with `E_0` and `\Gamma`), and show that if Equation 1.20 is to hold for all `t`, `\Gamma` must be zero.

(b) The time-independent wave function `\psi(x)` can always be taken to be real (unlike `\Psi(x,t)`, which is necessarily complex). 

-----

**Solution:**

(a) Substituting `E+i\Gamma` into Equation 2.7 gives

.. math::

   \psi(x,t) = \psi(x) e^{-i(E_0+i\Gamma)t/\hbar} = \psi(x) e^{-iE_0t/\hbar} e^{-\Gamma t/\hbar}

Taking the modulus squared and integrating over all space, we have

.. math::

   \int_{-\infty}^{\infty} |\psi(x,t)|^2 dx = e^{-2\Gamma t/\hbar} \int_{-\infty}^{\infty} |\psi(x)|^2 dx=1,

which implies that

.. math::

   e^{-2\Gamma t/\hbar} = 1 \rightarrow \text{apply logarithm}\rightarrow -2\Gamma t/\hbar = 0.

Since this must hold for all `t`, `\hbar` and 2 are constants, we conclude that `\Gamma = 0`, and hence `E` is real.

.. toctree::
   :maxdepth: 2
   :caption: Contents:
   