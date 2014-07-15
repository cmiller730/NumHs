{-# LANGUAGE BangPatterns #-}
module Main where

import Data.Time.Clock
import Numeric.Core.Array
import Data.Array.Repa
import Data.Array.Repa.Repr.ForeignPtr

main = do 
  start <- getCurrentTime
  !x <- computeP $ linspace 0 100 10000000 :: IO (Array F DIM1 Double)
  end <- getCurrentTime
  putStrLn $ "10000000 element linspace took " Prelude.++ show (diffUTCTime end start)
  
  start2 <- getCurrentTime
  !x <- computeP $ arange 0 100 0.00001 :: IO (Array F DIM1 Double)
  end2 <- getCurrentTime
  putStrLn $ "arange 0 100 0.00001 took " Prelude.++ show (diffUTCTime end2 start2)
  
  start3 <- getCurrentTime
  !x <- computeP $ eye 10000 :: IO (Array F DIM2 Double)
  end3 <- getCurrentTime
  putStrLn $ "eye 10000 took " Prelude.++ show (diffUTCTime end3 start3)
  
  start4 <- getCurrentTime
  !x <- computeP $ zeros (Z:.10000) :: IO (Array F DIM1 Double)
  end4 <- getCurrentTime
  putStrLn $ "zeros 10000 took " Prelude.++ show (diffUTCTime end4 start4)
  
  start5 <- getCurrentTime
  !x <- computeP $ ones (Z:.10000) :: IO (Array F DIM1 Double)
  end5 <- getCurrentTime
  putStrLn $ "ones 10000 took " Prelude.++ show (diffUTCTime end5 start5)