{-# LANGUAGE ForeignFunctionInterface #-}

module Foreign.BLAS.Level2 (
  cblasSgemv,
  cblasDgemv,
  cblasSger,
  cblasDger,
  cblasStrsv,
  cblasDtrsv,
  cblasStrmv,
  cblasDtrmv,
  cblasSsyr,
  cblasDsyr,
  cblasSsyr2,
  cblasDsyr2,
  cblasSgbmv,
  cblasDgbmv,
  cblasSsbmv,
  cblasDsbmv,
  cblasStbmv,
  cblasDtbmv,
  cblasStbsv,
  cblasDtbsv,
  cblasStpmv,
  cblasDtpmv
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

{#fun cblas_strmv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', enumToCInt `CBLAS_TRANSPOSE', enumToCInt `CBLAS_DIAG', `Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int' } -> `()' #}

{#fun cblas_dtrmv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', enumToCInt `CBLAS_TRANSPOSE', enumToCInt `CBLAS_DIAG', `Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int' } -> `()' #}

{#fun cblas_ssyr as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', `Int', `Float', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int'} -> `()' #}

{#fun cblas_dsyr as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', `Int', `Double', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int'} -> `()' #}

{#fun cblas_ssyr2 as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', `Int', `Float', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int'} -> `()' #}

{#fun cblas_dsyr2 as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', `Int', `Double', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int'} -> `()' #}

{#fun cblas_sgbmv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_TRANSPOSE', `Int', `Int', `Int', `Int', `Float', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int', `Float', castPtr `Ptr Float', `Int'} -> `()' #}

{#fun cblas_dgbmv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_TRANSPOSE', `Int', `Int', `Int', `Int', `Double', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int', `Double', castPtr `Ptr Double', `Int'} -> `()' #}

{#fun cblas_ssbmv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', `Int', `Int', `Float', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int', `Float', castPtr `Ptr Float', `Int'} -> `()' #}

{#fun cblas_dsbmv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', `Int', `Int', `Double', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int', `Double', castPtr `Ptr Double', `Int'} -> `()' #}

{#fun cblas_stbmv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', enumToCInt `CBLAS_TRANSPOSE', enumToCInt `CBLAS_DIAG', `Int', `Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int'} -> `()' #}

{#fun cblas_dtbmv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', enumToCInt `CBLAS_TRANSPOSE', enumToCInt `CBLAS_DIAG', `Int', `Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int'} -> `()' #}

{#fun cblas_stbsv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', enumToCInt `CBLAS_TRANSPOSE', enumToCInt `CBLAS_DIAG', `Int', `Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int'} -> `()' #}

{#fun cblas_dtbsv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', enumToCInt `CBLAS_TRANSPOSE', enumToCInt `CBLAS_DIAG', `Int', `Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int'} -> `()' #}

{#fun cblas_stpmv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', enumToCInt `CBLAS_TRANSPOSE', enumToCInt `CBLAS_DIAG', `Int', castPtr `Ptr Float', castPtr `Ptr Float', `Int'} -> `()' #}

{#fun cblas_dtpmv as ^ { enumToCInt `CBLAS_ORDER', enumToCInt `CBLAS_UPLO', enumToCInt `CBLAS_TRANSPOSE', enumToCInt `CBLAS_DIAG', `Int', castPtr `Ptr Double', castPtr `Ptr Double', `Int'} -> `()' #}