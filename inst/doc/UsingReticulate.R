## ----echo = FALSE, message = FALSE---------------------------------------
knitr::opts_chunk$set(python.reticulate = FALSE)
knitr::opts_chunk$set(eval = FALSE)  ## fake to not have the packag rely on reticulate

## ----prep, include=FALSE-------------------------------------------------
#  file.copy("~/git/rcppcnpy/tests/fmat.npy", ".")
#  file.copy("~/git/rcppcnpy/tests/fmat.npy.gz", ".")
#  file.copy("~/git/rcppcnpy/tests/fvec.npy", ".")
#  file.copy("~/git/rcppcnpy/tests/imat.npy", ".")
#  file.copy("~/git/rcppcnpy/tests/ivec.npy", ".")

## ----ex1-----------------------------------------------------------------
#  ### load reticulate and use it to load numpy
#  library(reticulate)
#  np <- import("numpy")
#  
#  ## data reading
#  (mat <- np$load("fmat.npy"))

## ----ex1a----------------------------------------------------------------
#  (vec <- np$load("fvec.npy"))

## ----ex2-----------------------------------------------------------------
#  (imat <- np$load("imat.npy"))

## ----ex3-----------------------------------------------------------------
#  ## compressed data: import gzip
#  gz <- import("gzip")
#  
#  ## use it to create handle to uncompressed file
#  (mat2 <- np$load(gz$GzipFile("fmat.npy.gz","r")))

## ----ex4-----------------------------------------------------------------
#  tfile <- tempfile(fileext=".npy")
#  
#  set.seed(42)
#  (m <- matrix(sort(rnorm(6)), 3, 2))

## ----ex4a----------------------------------------------------------------
#  np$save(tfile, m)
#  
#  (m2 <- np$load(tfile))

## ----ex4b----------------------------------------------------------------
#  all.equal(m, m2)

## ----ex5-----------------------------------------------------------------
#  x <- seq(1, 10)
#  y <- sin(x)
#  np$savez("file1.npz", x, y)
#  np$savez("file2.npz", x=x, y=y)

## ----ex6-----------------------------------------------------------------
#  npz1 <- np$load("file1.npz")
#  npz1$files

## ----ex6a----------------------------------------------------------------
#  npz1$f[["arr_0"]]

## ----ex6b----------------------------------------------------------------
#  npz1$f[["arr_1"]]

## ----ex6c----------------------------------------------------------------
#  npz2 <- np$load("file2.npz")
#  npz2$files

## ----ex6d----------------------------------------------------------------
#  npz2$f[["x"]]

## ----ex6e----------------------------------------------------------------
#  npz2$f[["y"]]

## ----cleanup, include=FALSE----------------------------------------------
#  unlink("fmat.npy")
#  unlink("fmat.npy.gz")
#  unlink("fvec.npy")
#  unlink("imat.npy")
#  unlink("ivec.npy")
#  unlink("file1.npz")
#  unlink("file2.npz")

