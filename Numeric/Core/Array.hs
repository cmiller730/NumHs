{-# LANGUAGE FlexibleContexts, FlexibleInstances, DeriveDataTypeable, BangPatterns #-}

module Numeric.Core.Array (
  linspace,
  logspace,
  arange,
  eye,
  scalarInit,
  zeros,
  ones
  ) where

import Data.Array.Repa as R
import Data.Typeable.Internal
import Prelude as P
import Control.Exception

data NumHSArrayException = ArangeDivisionByZero | EyeNegativeDimension
                         deriving (Typeable)
instance Exception NumHSArrayException

instance Show NumHSArrayException where
  show ArangeDivisionByZero = "Arange: Step size must be non-zero"
  show EyeNegativeDimension = "Eye: negative dimensions are not allowed."

linspace :: Double -> Double -> Int -> Array D DIM1 Double
linspace !start !stop !num
  | num < 0 = R.fromFunction (Z:.0) (\_ -> 0)
  | num == 1 = R.fromFunction (Z:.1) (\_ -> start)
  | otherwise = let delta = (stop - start)/(fromIntegral num - 1)
                    fun :: DIM1 -> Double
                    {-# INLINE fun #-}
                    fun !(Z:.idx) = start + (fromIntegral idx)*delta
                in R.fromFunction (Z:.num) fun               
                  
logspace :: Double -> Double -> Double -> Int -> Array D DIM1 Double
logspace !start !stop !base !num = 
  let x0 = linspace start stop num
  in R.map (base**) x0 
     
arange :: Double -> Double -> Double -> Array D DIM1 Double
arange !start !stop !delta 
  | delta == 0 = throw ArangeDivisionByZero
  | otherwise = linspace start (start+(fromIntegral num - 1)*delta) num
  where
    num = ceiling $ (stop - start)/delta

eye :: Int -> Array D DIM2 Double
eye !n | n < 0 = throw EyeNegativeDimension
       | otherwise = R.fromFunction (Z:.n:.n) delta
        where 
          delta :: DIM2 -> Double
          {-# INLINE delta #-}
          delta !(Z:.i:.j) = if (i==j) then 1 else 0

scalarInit :: (Shape sh) => sh -> Double -> Array D sh Double
scalarInit !sh !x = R.fromFunction sh f
                    where
                      {-# INLINE f #-}
                      f _ = x

zeros :: (Shape sh) => sh -> Array D sh Double 
zeros !sh = scalarInit sh 0.0

ones :: (Shape sh) => sh -> Array D sh Double
ones !sh = scalarInit sh 1.0