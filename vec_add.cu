#include <iostream>
#include <vector>
#include <math.h>

// function to add the elements of two arrays
void add(int n, float *x, float *y)
{
  for (int i = 0; i < n; i++)
      y[i] = x[i] + y[i];
}

int main(void)
{
  int N = 1<<20; // 1M elements
  std::vector<float> x(N);
  std::vector<float> y(N);

  // initialize x and y arrays on the host
  for (auto& xi : x) xi = 1.0f;
  for (auto& yi : y) yi = 2.0f;

  // Run kernel on 1M elements on the CPU
  add(N, x.data(), y.data());

  // Check for errors (all values should be 3.0f)
  float maxError = 0.0f;
  for (auto yi : y)
    maxError = fmax(maxError, fabs(yi-3.0f));
  std::cout << "Max error: " << maxError << std::endl;

  return 0;
}
