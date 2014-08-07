{-# LANGUAGE ForeignFunctionInterface #-}

module Foreign.BLAS.Level1 (
  cblasSdsdot,
  cblasDsdot,
  cblasSdot,
  cblasDdot,
  cblasSasum,
  cblasDasum,
  cblasSnrm2,
  cblasDnrm2,
  cblasIsamax,
  cblasIdamax,
  cblasSaxpy,
  cblasDaxpy,
  cblasScopy,
  cblasDcopy,
  cblasSswap,
  cblasDswap,
  cblasSrot,
  cblasDrot,
  cblasSrotg,
  cblasDrotg,
  cblasSrotm,
  cblasDrotm,
  cblasSrotmg,
  cblasDrotmg,
  cblasSscal,                  
  cblasDscal ) where

import Foreign.C
import Foreign.Ptr

#include <cblas.h>

{#fun cblas_sdsdot as ^ { `Int', `Float',  castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int' } -> `Float' #}

{#fun cblas_dsdot as ^ { `Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int' } -> `Double' #}

{#fun cblas_sdot as ^ { `Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int' } -> `Float' #}

{#fun cblas_ddot as ^ { `Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int' } -> `Double' #}

{#fun cblas_sasum as ^ { `Int', castPtr `Ptr Float', `Int' } -> `Float' #}

{#fun cblas_dasum as ^ {`Int', castPtr `Ptr Double', `Int'} -> `Double' #}

{#fun cblas_snrm2 as ^ {`Int', castPtr `Ptr Float', `Int'} -> `Float' #}

{#fun cblas_dnrm2 as ^ {`Int', castPtr `Ptr Double', `Int'} -> `Double' #}

{#fun cblas_isamax as ^ {`Int', castPtr `Ptr Float', `Int'} -> `Int' #}

{#fun cblas_idamax as ^ {`Int', castPtr `Ptr Double', `Int'} -> `Int' #}

{#fun cblas_saxpy as ^ {`Int', `Float', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int'} -> `()' #}

{#fun cblas_daxpy as ^ {`Int', `Double', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int'} -> `()' #}

{#fun cblas_scopy as ^ {`Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int'} -> `()' #}

{#fun cblas_dcopy as ^ {`Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int'} -> `()' #}

{#fun cblas_sswap as ^ {`Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int'} -> `()' #}

{#fun cblas_dswap as ^ {`Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int'} -> `()' #}

{#fun cblas_srot as ^ {`Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int', `Float', `Float'} -> `()' #}

{#fun cblas_drot as ^ {`Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int', `Double', `Double'} -> `()' #}

{#fun cblas_srotg as ^ {castPtr `Ptr Float',castPtr `Ptr Float',castPtr `Ptr Float',castPtr `Ptr Float'} -> `()' #}

{#fun cblas_drotg as ^ {castPtr `Ptr Double',castPtr `Ptr Double',castPtr `Ptr Double',castPtr `Ptr Double'} -> `()' #}

{#fun cblas_srotm as ^ {`Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float', `Int', castPtr `Ptr Float'} -> `()' #}

{#fun cblas_drotm as ^ {`Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double', `Int', castPtr `Ptr Double'} -> `()' #}

{#fun cblas_srotmg as ^ {castPtr `Ptr Float', castPtr `Ptr Float', castPtr `Ptr Float', `Float', castPtr `Ptr Float'} -> `()' #}

{#fun cblas_drotmg as ^ {castPtr `Ptr Double', castPtr `Ptr Double', castPtr `Ptr Double', `Double', castPtr `Ptr Double'} -> `()' #}

{#fun cblas_sscal as ^ {`Int', `Float', castPtr `Ptr Float', `Int'} -> `()' #}

{#fun cblas_dscal as ^ {`Int', `Double', castPtr `Ptr Double', `Int'} -> `()' #}