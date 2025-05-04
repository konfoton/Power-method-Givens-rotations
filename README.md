# Power Method with Normalization and Givens-Based Deflation

This project is a study of numerical methods for finding the dominant eigenvalues of a real matrix using the **power method with normalization**, combined with a **deflation technique** based on **Givens rotations**.

## 📌 Objectives

- Implement the **power method** to find the largest (by modulus) eigenvalue and its corresponding eigenvector of a real matrix \( A \in \mathbb{R}^{n \times n} \).
- Extend the method to find **multiple successive eigenvalues** using **deflation**.
- Use **Givens rotations** to perform deflation efficiently without forming large rotation matrices.

## 📚 Key Concepts

### 🔁 Power Method with Normalization

An iterative algorithm to find the dominant eigenvalue/vector:

- Start with an arbitrary non-zero vector.
- Repeatedly apply matrix-vector multiplication.
- Normalize the result at each step to avoid overflow and help convergence.
- Estimate the dominant eigenvalue using Rayleigh quotient or vector norm ratios.

### 🧮 Deflation

After computing an eigenpair \((\lambda, v)\), we modify the matrix so that:

- The computed eigenpair no longer influences further iterations.
- Subsequent runs of the power method yield the next largest eigenvalue.
- The deflation is performed through a transformation matrix \( G \).

### 🔄 Givens Rotations

To avoid constructing a full matrix \( G \in \mathbb{R}^{n \times n} \):

- Use a product of 2D Givens rotations:
  \[
  G = G_{1,n} G_{1,n-1} \cdots G_{1,2}
  \]
- Each \( G_{i,j} \) rotates only two coordinates \( i \) and \( j \).
- Only 2x2 sub-rotations are computed and applied.
- This saves memory and computation.

## ⚙️ Implementation Constraints

- **Do not store** full-sized Givens matrices.
- All operations should be performed using **2D Givens rotations** only.
- Memory efficiency is prioritized.
