module Numeric.Interpolate.Spline (
  spline) where

import Data.Array.Repa as R
import Control.Monad
import Control.Monad.Identity

linInterp :: (Floating b, Num b) => b -> b -> b -> b -> b -> b
linInterp x1 x2 y1 y2 x = (x-x1)*(y2-y1)/(x2 - x1) + y1

interpFromKnots :: Array U DIM1 Double -> 
                   Array U DIM1 Double -> Double -> Double
interpFromKnots x0 y0 x = runIdentity $ 
  do
    let (Z :. j) = R.extent x0
        (n,_) = head $ filter (\x' -> snd x' <= x) ((zip [0,1..]) $ toList x0) 
    let x0' = x0 ! (Z:. n)
        x1' = x0 ! (Z:. n+1)
        y0' = y0 ! (Z:. n)
        y1' = y0 ! (Z:. n+1)
    return $ linInterp x0' x1' y0' y1' x
    
spline :: Array U DIM1 Double -> Array U DIM1 Double ->
          Int -> Array D DIM1 Double -> Array D DIM1 Double
spline x0 y0 1 x = R.map (interpFromKnots x0 y0) x         