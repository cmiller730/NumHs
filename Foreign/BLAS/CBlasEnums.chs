{-# LANGUAGE ForeignFunctionInterface #-}

module Foreign.BLAS.CBlasEnums (
  CBLAS_ORDER,
  CBLAS_TRANSPOSE,
  CBLAS_UPLO,
  CBLAS_DIAG,
  CBLAS_SIDE ) where

#include <cblas.h>

{#enum CBLAS_ORDER {} deriving (Show,Eq) #}

{#enum CBLAS_TRANSPOSE {} deriving (Show,Eq) #}

{#enum CBLAS_UPLO {} deriving (Show,Eq) #}

{#enum CBLAS_DIAG {} deriving (Show,Eq) #}

{#enum CBLAS_SIDE {} deriving (Show,Eq) #}