#include <bindings.dsl.h>
#include <hpx/hpx.h>
module Bindings.HPX where

import Data.Word

import Foreign
import Foreign.C.String
import Foreign.C.Types

#if defined(linux_HOST_OS)
import System.Clock
#endif

-------------------------------------------------------------------------------
-- Actions and threads
-------------------------------------------------------------------------------

#callback_t hpx_action_handle_t , Ptr () \
                                  -> CSize \
                                  -> IO CInt
#integral_t hpx_action_t
#callback_t hpx_for_action_t , CInt \
                               -> Ptr () \
                               -> IO CInt
#callback_t hpx_pinned_action_handler_t , Ptr () \
                                          -> Ptr () \
                                          -> CSize \
                                          -> IO CInt
#callback_t hpx_pinned_vectored_action_handler_t , Ptr () \
                                                   -> CInt \
                                                   -> Ptr () \
                                                   -> CSize \
                                                   -> IO CInt
#callback_t hpx_vectored_action_handler_t , CInt \
                                            -> Ptr () \
                                            -> CSize \
                                            -> IO CInt

#integral_t hpx_action_type_t
#num HPX_DEFAULT
#num HPX_TASK
#num HPX_INTERRUPT
#num HPX_FUNCTION
#num HPX_OPENCL

#ccall _hpx_call , <hpx_addr_t> \
                   -> <hpx_action_t> \
                   -> <hpx_addr_t> \
                   -> CInt \
                   -> CString \
                   -> CInt \
                   -> IO CInt
#ccall _hpx_call_async , <hpx_addr_t> \
                         -> <hpx_action_t> \
                         -> <hpx_addr_t> \
                         -> <hpx_addr_t> \
                         -> CInt \
                         -> CString \
                         -> CInt \
                         -> IO CInt
#ccall _hpx_call_cc , <hpx_addr_t> \
                      -> <hpx_action_t> \
                      -> CInt \
                      -> CString \
                      -> CInt \
                      -> IO CInt
#ccall _hpx_call_sync , <hpx_addr_t> \
                        -> <hpx_action_t> \
                        -> Ptr () \
                        -> CSize \
                        -> CInt \
                        -> CString \
                        -> CInt \
                        -> IO CInt
#ccall hpx_register_action , <hpx_action_type_t> \
                             -> Word32 \
                             -> CString \
                             -> Ptr <hpx_action_t> \
                             -> CUInt \
                             -> CString \
                             -> CInt \
                             -> IO CInt

-------------------------------------------------------------------------------
-- Global Address Space
-------------------------------------------------------------------------------

#integral_t hpx_addr_t
#callback_t hpx_gas_dist_t , Word32 -> CSize -> Word32 -> IO <hpx_addr_t>

#integral_t hpx_gas_dist_type_t
#num HPX_DIST_TYPE_USER
#num HPX_DIST_TYPE_LOCAL
#num HPX_DIST_TYPE_CYCLIC
#num HPX_DIST_TYPE_BLOCKED

-------------------------------------------------------------------------------
-- Processes
-------------------------------------------------------------------------------

#synonym_t hpx_pid_t , <hpx_addr_t>

-------------------------------------------------------------------------------
-- Other
-------------------------------------------------------------------------------

#if defined(linux_HOST_OS)
# synonym_t hpx_time_t , TimeSpec
#elif defined(darwin_HOST_OS)
# integral_t hpx_time_t
#endif
