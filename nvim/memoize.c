

int numPaths(int m, int n, int arr[][n]) {
  if (arr[m][n] != -1) {
    return arr[m][n];
  }
  if (m == 0 || n == 0) {
    arr[m][n] = 1;
    return arr[m][n];
  }
  return (arr[m][n] = numPaths(m-1, n, arr) + numPaths(m, n-1, arr));
}

int arr[m][n];
for (int i = 0; i < m; ++i) 
  for (int j = 0; j < n; ++j)
    arr[m][n] = -1;
