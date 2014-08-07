{-# LANGUAGE ForeignFunctionInterface #-}

module Foreign.BLAS.Level2 (
  cblasSgemv,
  cblasDgemv,
  cblasSger,
  cblasDger,
  cblasStrsv,
  cblasDtrsv
   ) where

import Foreign.C
import Foreign.Ptr
import Foreign.BLAS.CBlasEnums

#include <cblas.h>

enumToCInt :: (Enum a) => a -> CInt
enumToCInt = fromIntegral . fromEnum

{#fun cblas_sgemv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_TRANSPOSE',  `Int', `Int', `Float', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int', `Float', castPtr `Ptr Float', `Int' } -> `()' #}

{#fun cblas_dgemv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_TRANSPOSE',  `Int', `Int', `Double', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int', `Double', castPtr `Ptr Double', `Int' } -> `()' #}

{#fun cblas_sger as ^ { enumToCInt `CBLAS_ORDER', `Int', `Int', `Float', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int' } -> `()' #}

{#fun cblas_dger as ^ { enumToCInt `CBLAS_ORDER', `Int', `Int', `Double', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int' } -> `()' #}

{#fun cblas_strsv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', enumToCInt `CBLAS_TRANSPOSE', enumToCInt `CBLAS_DIAG', `Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int' } -> `()' #}

{#fun cblas_dtrsv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', enumToCInt `CBLAS_TRANSPOSE', enumToCInt `CBLAS_DIAG', `Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int' } -> `()' #}
