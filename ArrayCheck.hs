{-# OPTIONS_GHC -F -pgmF htfpp #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}


import System.Environment ( getArgs )
import System.Exit ( exitWith )
import Test.Framework
import Numeric.Core.Array
import Data.Array.Repa as R
import Data.Array.Repa.Shape as S
import Prelude as P

smallInts :: Gen Int
smallInts = choose (-10000,10000)

prop_linspace_size start stop = forAll smallInts (\num ->
  let
    x = linspace start stop num
  in 
   if (num < 0) then R.extent x == (Z:.0 :: DIM1)
   else R.extent x == (Z:.num) )
                                
                                
prop_linspace_delta start stop = forAll smallInts (\num ->
  let 
    num' = (abs num) + 2
    x = toList $ linspace start stop num'
    delta = (stop - start) / (fromIntegral num'-1)
    diffs = P.zipWith (-) (tail x) x
  in
   all (\x -> abs(x-delta) < 1e-10) diffs)


smallDoubles :: Gen Double
smallDoubles = choose (2,10)

tuples = do 
  num <- choose (2,16)
  base <- smallDoubles
  start <- smallDoubles
  stop <- smallDoubles
  return (base,num, start, stop)
  
prop_logspace_delta = 
  forAll tuples (\(base,num,start,stop) ->
    let 
      num' = (abs num) + 2
      x = toList $ logspace start stop base num'
      x2 = P.map (logBase base) x
      diffs = P.zipWith (-) (tail x2) x2
      delta = (stop - start) / (fromIntegral num' - 1)
    in (length x == num') && all (\x -> abs(x - delta) < 1e-10) diffs
    )
  
prop_arange_delta start stop delta  
  | delta == 0 = True
  | otherwise = let x = toList $ arange start stop delta
                    diffs = P.zipWith (-) (tail x) x
                in if (not $ null x) 
                   then all (\x -> abs(x-delta) < 1e-3) diffs
                   else True
                        
prop_eye = forAll (choose (0,1000)) 
     (\n -> let idx = [Z:.i:.j | i <- [0,1..(n-1)], j<-[0,1..(n-1)] ]
                eyeN = eye n
            in (size . extent) eyeN == n^2 && 
               all (\ sh@(Z:.i:.j) -> if (i==j) 
                                      then eyeN ! sh  == 1 
                                      else eyeN ! sh  == 0
                   ) idx
     )
main = htfMain htf_thisModulesTests