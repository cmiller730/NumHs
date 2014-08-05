{-# LANGUAGE ForeignFunctionInterface #-}

module Foreign.BLAS (
  CBLAS_ORDER,
  CBLAS_TRANSPOSE,
  CBLAS_UPLO,
  CBLAS_DIAG,
  CBLAS_SIDE
                    ) where

import Foreign.C
import Foreign.Ptr
import Foreign.ForeignPtr

#include <cblas.h>

{#enum CBLAS_ORDER {} deriving (Show,Eq) #}

{#enum CBLAS_TRANSPOSE {} deriving (Show,Eq) #}

{#enum CBLAS_UPLO {} deriving (Show,Eq) #}

{#enum CBLAS_DIAG {} deriving (Show,Eq) #}

{#enum CBLAS_SIDE {} deriving (Show,Eq) #}

unsafeCast = castPtr . unsafeForeignPtrToPtr

{#fun cblas_sdsdot as ^ { `Int', `Float',  castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int' } -> `Float' #}

{#fun cblas_dsdot as ^ { `Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int' } -> `Double' #}

{#fun cblas_sdot as ^ { `Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int' } -> `Float' #}

{#fun cblas_ddot as ^ { `Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int' } -> `Double' #}