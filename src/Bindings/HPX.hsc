#include <bindings.dsl.h>
#include <hpx/hpx.h>
module Bindings.HPX where

import Bindings.Libffi (C'ffi_type)

import Data.Int
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

#callback_t hpx_action_handler_t , Ptr () \
                                -> CSize  \
                                -> IO CInt
#integral_t hpx_action_t
#callback_t hpx_for_action_t , CInt   \
                            -> Ptr () \
                            -> IO CInt
#callback_t hpx_pinned_action_handler_t , Ptr () \
                                       -> Ptr () \
                                       -> CSize  \
                                       -> IO CInt
#callback_t hpx_pinned_vectored_action_handler_t , Ptr () \
                                                -> CInt   \
                                                -> Ptr () \
                                                -> CSize  \
                                                -> IO CInt
#callback_t hpx_vectored_action_handler_t , CInt   \
                                         -> Ptr () \
                                         -> CSize  \
                                         -> IO CInt

#integral_t hpx_action_type_t
#num HPX_DEFAULT
#num HPX_TASK
#num HPX_INTERRUPT
#num HPX_FUNCTION
#num HPX_OPENCL

-- Action attributes
#num HPX_ATTR_NONE
#num HPX_MARSHALLED
#num HPX_PINNED
#num HPX_INTERNAL
#num HPX_VECTORED
#num HPX_COALESCED
#num HPX_COMPRESSED

#integral_t intptr_t

#ccall _hpx_call , <hpx_addr_t>           \
                -> <hpx_action_t>         \
                -> <hpx_addr_t>           \
                -> CInt                   \
                -> CString                \
                -> CInt                   \
                -> IO CInt
#ccall _hpx_call_async , <hpx_addr_t>   \
                      -> <hpx_action_t> \
                      -> <hpx_addr_t>   \
                      -> <hpx_addr_t>   \
                      -> CInt           \
                      -> CString        \
                      -> CInt           \
                      -> IO CInt
#ccall _hpx_call_cc , <hpx_addr_t>   \
                   -> <hpx_action_t> \
                   -> CInt           \
                   -> CString        \
                   -> CInt           \
                   -> IO CInt
#ccall _hpx_call_sync , <hpx_addr_t>   \
                     -> <hpx_action_t> \
                     -> Ptr ()         \
                     -> CSize          \
                     -> CInt           \
                     -> CString        \
                     -> CInt           \
                     -> IO CInt
#ccall _hpx_call_when , <hpx_addr_t>   \
                     -> <hpx_addr_t>   \
                     -> <hpx_action_t> \
                     -> <hpx_addr_t>   \
                     -> CInt           \
                     -> CString        \
                     -> CInt           \
                     -> IO CInt
#ccall _hpx_call_when_cc , <hpx_addr_t>   \
                        -> <hpx_addr_t>   \
                        -> <hpx_action_t> \
                        -> CInt           \
                        -> CString        \
                        -> CInt           \
                        -> IO CInt
#ccall _hpx_call_when_sync , <hpx_addr_t>   \
                          -> <hpx_addr_t>   \
                          -> <hpx_action_t> \
                          -> Ptr ()         \
                          -> CSize          \
                          -> CInt           \
                          -> CString        \
                          -> CInt           \
                          -> IO CInt
#ccall _hpx_call_when_with_continuation , <hpx_addr_t>   \
                                       -> <hpx_addr_t>   \
                                       -> <hpx_action_t> \
                                       -> <hpx_addr_t>   \
                                       -> <hpx_action_t> \
                                       -> CInt           \
                                       -> CString        \
                                       -> CInt           \
                                       -> IO CInt
#ccall _hpx_call_with_continuation , <hpx_addr_t>   \
                                  -> <hpx_action_t> \
                                  -> <hpx_addr_t>   \
                                  -> <hpx_action_t> \
                                  -> CInt           \
                                  -> CString        \
                                  -> CInt           \
                                  -> IO CInt
#ccall _hpx_thread_continue , CInt    \
                           -> CString \
                           -> CInt    \
                           -> IO CInt
#ccall hpx_action_get_handler , <hpx_action_t> \
                             -> IO <hpx_action_handler_t>
#ccall hpx_count_range_call , <hpx_action_t> \
                           -> <hpx_addr_t>   \
                           -> CSize          \
                           -> CSize          \
                           -> Word32         \
                           -> CSize          \
                           -> Ptr ()         \
                           -> IO CInt
#ccall hpx_par_call , <hpx_action_t>                             \
                   -> CInt                                       \
                   -> CInt                                       \
                   -> CInt                                       \
                   -> CInt                                       \
                   -> CSize                                      \
                   -> FunPtr (Ptr () -> CInt -> Ptr () -> IO ()) \
                   -> CSize                                      \
                   -> Ptr ()                                     \
                   -> <hpx_addr_t>                               \
                   -> IO CInt
#ccall hpx_par_call_sync , <hpx_action_t>                             \
                        -> CInt                                       \
                        -> CInt                                       \
                        -> CInt                                       \
                        -> CInt                                       \
                        -> CSize                                      \
                        -> FunPtr (Ptr () -> CInt -> Ptr () -> IO ()) \
                        -> CSize                                      \
                        -> Ptr ()                                     \
                        -> IO CInt
#ccall hpx_par_for , <hpx_for_action_t> \
                  -> CInt               \
                  -> CInt               \
                  -> Ptr ()             \
                  -> <hpx_addr_t>       \
                  -> IO CInt
#ccall hpx_par_for_sync , <hpx_for_action_t> \
                       -> CInt               \
                       -> CInt               \
                       -> Ptr ()             \
                       -> IO CInt
#ccall hpx_register_action , <hpx_action_type_t>    \
                          -> Word32                 \
                          -> CString                \
                          -> Ptr <hpx_action_t>     \
                          -> CUInt                  \
                          -> <hpx_action_handler_t> \
                          -> <hpx_type_t>           \
                          -> <hpx_type_t>           \
                          -> IO CInt
#ccall hpx_thread_can_alloca , CSize \
                            -> IO <intptr_t>
#ccall hpx_thread_current_action , IO <hpx_action_t>
#ccall hpx_thread_current_cont_action , IO <hpx_action_t>
#ccall hpx_thread_current_cont_target , IO <hpx_addr_t>
#ccall hpx_thread_current_parcel , IO <hpx_pid_t>
#ccall hpx_thread_current_target , IO <hpx_addr_t>
#ccall hpx_thread_get_tls_id , IO CInt
#ccall hpx_thread_set_affinity , CInt \
                              -> IO ()
#ccall hpx_thread_sigmask , CInt \
                         -> CInt \
                         -> IO CInt
#ccall hpx_thread_yield , IO ()

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

#ccall _hpx_gas_bcast_sync , <hpx_action_t> \
                          -> <hpx_addr_t>   \
                          -> CInt           \
                          -> CSize          \
                          -> CSize          \
                          -> CInt           \
                          -> CString        \
                          -> CInt           \
                          -> IO CInt
#ccall _hpx_gas_bcast_with_continuation , <hpx_action_t> \
                                       -> <hpx_addr_t>   \
                                       -> CInt           \
                                       -> CSize          \
                                       -> CSize          \
                                       -> <hpx_action_t> \
                                       -> <hpx_addr_t>   \
                                       -> CInt           \
                                       -> CString        \
                                       -> CInt           \
                                       -> IO CInt
#ccall hpx_addr_add , <hpx_addr_t> \
                   -> Int64        \
                   -> Word32       \
                   -> IO <hpx_addr_t>
#ccall hpx_addr_sub , <hpx_addr_t> \
                   -> <hpx_addr_t> \
                   -> Word32       \
                   -> IO Int64
-- #ccall hpx_calloc_registered , CSize \
--                             -> CSize \
--                             -> Ptr ()
#ccall hpx_free_registered , Ptr () \
                          -> IO ()
#ccall hpx_gas_alloc , CSize            \
                    -> Word32           \
                    -> Word32           \
                    -> <hpx_gas_dist_t> \
                    -> Word32           \
                    -> IO <hpx_addr_t>
#ccall hpx_gas_alloc_blocked , CSize  \
                            -> Word32 \
                            -> Word32 \
                            -> IO <hpx_addr_t>
#ccall hpx_gas_alloc_blocked_attr , CSize  \
                                 -> Word32 \
                                 -> Word32 \
                                 -> Word32 \
                                 -> IO <hpx_addr_t>
#ccall hpx_gas_alloc_cyclic , CSize  \
                           -> Word32 \
                           -> Word32 \
                           -> IO <hpx_addr_t>
#ccall hpx_gas_alloc_cyclic_attr , CSize  \
                                -> Word32 \
                                -> Word32 \
                                -> Word32 \
                                -> IO <hpx_addr_t>
#ccall hpx_gas_alloc_local , CSize  \
                          -> Word32 \
                          -> Word32 \
                          -> IO <hpx_addr_t>
#ccall hpx_gas_alloc_local_at_async , CSize        \
                                   -> Word32       \
                                   -> Word32       \
                                   -> <hpx_addr_t> \
                                   -> <hpx_addr_t> \
                                   -> IO <hpx_addr_t>
#ccall hpx_gas_alloc_local_at_sync , CSize        \
                                  -> Word32       \
                                  -> Word32       \
                                  -> <hpx_addr_t> \
                                  -> <hpx_addr_t> \
                                  -> IO <hpx_addr_t>
#ccall hpx_gas_alloc_local_attr , CSize  \
                               -> Word32 \
                               -> Word32 \
                               -> Word32 \
                               -> IO <hpx_addr_t>
#ccall hpx_gas_calloc , CSize            \
                     -> Word32           \
                     -> Word32           \
                     -> <hpx_gas_dist_t> \
                     -> Word32           \
                     -> IO <hpx_addr_t>
#ccall hpx_gas_calloc_blocked , CSize  \
                             -> Word32 \
                             -> Word32 \
                             -> IO <hpx_addr_t>
#ccall hpx_gas_calloc_blocked_attr , CSize  \
                                  -> Word32 \
                                  -> Word32 \
                                  -> Word32 \
                                  -> IO <hpx_addr_t>
#ccall hpx_gas_calloc_cyclic , CSize  \
                            -> Word32 \
                            -> Word32 \
                            -> IO <hpx_addr_t>
#ccall hpx_gas_calloc_cyclic_attr , CSize  \
                                 -> Word32 \
                                 -> Word32 \
                                 -> Word32 \
                                 -> IO <hpx_addr_t>
#ccall hpx_gas_calloc_local , CSize  \
                           -> Word32 \
                           -> Word32 \
                           -> IO <hpx_addr_t>
#ccall hpx_gas_calloc_local_at_async , CSize        \
                                    -> Word32       \
                                    -> Word32       \
                                    -> <hpx_addr_t> \
                                    -> <hpx_addr_t> \
                                    -> IO ()
#ccall hpx_gas_calloc_local_at_sync , CSize        \
                                   -> Word32       \
                                   -> Word32       \
                                   -> <hpx_addr_t> \
                                   -> IO <hpx_addr_t>
#ccall hpx_gas_calloc_local_attr , CSize  \
                                -> Word32 \
                                -> Word32 \
                                -> Word32 \
                                -> IO <hpx_addr_t>
#ccall hpx_gas_free , <hpx_addr_t> \
                   -> <hpx_addr_t> \
                   -> IO ()
#ccall hpx_gas_free_sync , <hpx_addr_t> \
                        -> IO ()
#ccall hpx_gas_memcpy , <hpx_addr_t> \
                     -> <hpx_addr_t> \
                     -> CSize        \
                     -> IO <hpx_addr_t>
#ccall hpx_gas_memcpy_sync , <hpx_addr_t> \
                          -> <hpx_addr_t> \
                          -> CSize        \
                          -> IO CInt
#ccall hpx_gas_memget , Ptr ()       \
                     -> <hpx_addr_t> \
                     -> CSize        \
                     -> <hpx_addr_t> \
                     -> IO CInt
#ccall hpx_gas_memget_sync , Ptr ()       \
                          -> <hpx_addr_t> \
                          -> CSize        \
                          -> IO CInt
#ccall hpx_gas_memput , <hpx_addr_t> \
                     -> Ptr ()       \
                     -> CSize        \
                     -> <hpx_addr_t> \
                     -> <hpx_addr_t> \
                     -> IO CInt
#ccall hpx_gas_memput_lsync , <hpx_addr_t> \
                           -> Ptr ()       \
                           -> CSize        \
                           -> <hpx_addr_t> \
                           -> IO CInt
#ccall hpx_gas_memput_rsync , <hpx_addr_t> \
                           -> Ptr ()       \
                           -> CSize        \
                           -> IO CInt
#ccall hpx_gas_move , <hpx_addr_t> \
                   -> <hpx_addr_t> \
                   -> <hpx_addr_t> \
                   -> IO ()
#ccall hpx_gas_rebalance , <hpx_addr_t> \
                        -> IO ()
#ccall hpx_gas_set_attr , <hpx_addr_t> \
                       -> Word32       \
                       -> IO ()
#ccall hpx_gas_try_pin , <hpx_addr_t>  \
                       -> Ptr (Ptr ()) \
                       -> IO Bool
#ccall hpx_malloc_registered , CSize \
                            -> IO (Ptr ())
#ccall hpx_memalign_registered , CSize \
                              -> CSize \
                              -> IO (Ptr ())
#ccall HPX_THERE , Word32 \
                -> IO <hpx_addr_t>

#globalvar HPX_HERE, <hpx_addr_t>

-------------------------------------------------------------------------------
-- LCOs
-------------------------------------------------------------------------------

#callback_t hpx_monoid_id_t , Ptr () \
                           -> CSize  \
                           -> IO ()
#callback_t hpx_monoid_op_t , Ptr () \
                           -> Ptr () \
                           -> CSize  \
                           -> IO ()
#callback_t hpx_predicate_t , Ptr () \
                           -> CSize \
                           -> IO Bool

#integral_t hpx_status_t

#ccall hpx_lco_and_new , Int64 \
                      -> IO <hpx_addr_t>
#ccall hpx_lco_and_set , <hpx_addr_t> \
                      -> <hpx_addr_t> \
                      -> IO ()
#ccall hpx_lco_and_set_num , <hpx_addr_t> \
                          -> CInt         \
                          -> <hpx_addr_t> \
                          -> IO ()
#ccall hpx_lco_delete , <hpx_addr_t> \
                     -> <hpx_addr_t> \
                     -> IO ()
#ccall hpx_lco_delete_all , CInt             \
                         -> Ptr <hpx_addr_t> \
                         -> <hpx_addr_t>     \
                         -> IO CInt
#ccall hpx_lco_delete_sync , <hpx_addr_t> \
                          -> IO ()
#ccall hpx_lco_error , <hpx_addr_t>   \
                    -> <hpx_status_t> \
                    -> <hpx_addr_t>   \
                    -> IO ()
#ccall hpx_lco_error_sync , <hpx_addr_t>   \
                         -> <hpx_status_t> \
                         -> IO ()
#ccall hpx_lco_future_new , CSize \
                         -> IO <hpx_addr_t>
#ccall hpx_lco_get , <hpx_addr_t> \
                  -> CSize        \
                  -> Ptr ()       \
                  -> IO <hpx_status_t>
#ccall hpx_lco_get_all , CInt               \
                      -> Ptr <hpx_addr_t>   \
                      -> Ptr CSize          \
                      -> Ptr (Ptr ())       \
                      -> Ptr <hpx_status_t> \
                      -> IO CInt
#ccall hpx_lco_get_reset , <hpx_addr_t> \
                        -> CSize        \
                        -> Ptr ()       \
                        -> IO <hpx_status_t>
#ccall hpx_lco_getref , <hpx_addr_t> \
                     -> CSize        \
                     -> Ptr (Ptr ()) \
                     -> IO <hpx_status_t>
#ccall hpx_lco_release , <hpx_addr_t> \
                      -> Ptr ()       \
                      -> IO ()
#ccall hpx_lco_reset , <hpx_addr_t> \
                    -> <hpx_addr_t> \
                    -> IO ()
#ccall hpx_lco_reset_sync , <hpx_addr_t> \
                         -> IO ()
#ccall hpx_lco_sema_new , CUInt \
                       -> IO <hpx_addr_t>
#ccall hpx_lco_sema_p , <hpx_addr_t> \
                     -> IO <hpx_status_t>
#ccall hpx_lco_sema_v , <hpx_addr_t> \
                     -> <hpx_addr_t> \
                     -> IO ()
#ccall hpx_lco_sema_v_sync , <hpx_addr_t> \
                          -> IO ()
#ccall hpx_lco_set , <hpx_addr_t> \
                  -> CSize        \
                  -> Ptr ()       \
                  -> <hpx_addr_t> \
                  -> <hpx_addr_t> \
                  -> IO ()
#ccall hpx_lco_set_lsync , <hpx_addr_t> \
                        -> CSize        \
                        -> Ptr ()       \
                        -> <hpx_addr_t> \
                        -> IO ()
#ccall hpx_lco_set_rsync , <hpx_addr_t> \
                        -> CSize        \
                        -> Ptr ()       \
                        -> IO CInt
#ccall hpx_lco_set_with_continuation , <hpx_addr_t>   \
                                    -> CSize          \
                                    -> Ptr ()         \
                                    -> <hpx_addr_t>   \
                                    -> <hpx_addr_t>   \
                                    -> <hpx_action_t> \
                                    -> IO ()
#ccall hpx_lco_wait , <hpx_addr_t> \
                   -> IO <hpx_status_t>
#ccall hpx_lco_wait_all , CInt               \
                       -> Ptr <hpx_addr_t>   \
                       -> Ptr <hpx_status_t> \
                       -> IO CInt
#ccall hpx_lco_wait_reset , <hpx_addr_t> \
                         -> IO <hpx_status_t>

-------------------------------------------------------------------------------
-- System
-------------------------------------------------------------------------------

#ccall _hpx_run , Ptr <hpx_action_t> \
               -> CInt               \
               -> CString            \
               -> CInt               \
               -> IO CInt
#ccall hpx_exit , CInt \
               -> IO ()
#ccall hpx_finalize , IO ()
#ccall hpx_init , Ptr CInt          \
               -> Ptr (Ptr CString) \
               -> IO CInt
#ccall hpx_print_help , IO ()
#ccall hpx_print_version , IO ()

-------------------------------------------------------------------------------
-- Processes
-------------------------------------------------------------------------------

#synonym_t hpx_pid_t , <hpx_addr_t>

#ccall _hpx_process_broadcast , <hpx_pid_t>    \
                             -> <hpx_action_t> \
                             -> <hpx_addr_t>   \
                             -> <hpx_addr_t>   \
                             -> CInt           \
                             -> CString        \
                             -> CInt           \
                             -> IO CInt
#ccall _hpx_process_broadcast_lsync , <hpx_pid_t>    \
                                   -> <hpx_action_t> \
                                   -> <hpx_addr_t>   \
                                   -> CInt           \
                                   -> IO CInt
#ccall _hpx_process_broadcast_rsync , <hpx_pid_t>    \
                                   -> <hpx_action_t> \
                                   -> CInt           \
                                   -> IO CInt
#ccall _hpx_process_call , <hpx_addr_t>   \
                        -> <hpx_addr_t>   \
                        -> <hpx_action_t> \
                        -> <hpx_addr_t>   \
                        -> CInt           \
                        -> CString        \
                        -> CInt           \
                        -> IO CInt
#ccall hpx_process_collective_allreduce_delete , <hpx_addr_t> \
                                              -> IO ()
#ccall hpx_process_collective_allreduce_join , <hpx_addr_t> \
                                            -> Int32        \
                                            -> CSize        \
                                            -> Ptr ()       \
                                            -> IO CInt
#ccall hpx_process_collective_allreduce_new , CSize          \
                                           -> <hpx_action_t> \
                                           -> <hpx_action_t> \
                                           -> IO <hpx_addr_t>
#ccall hpx_process_collective_allreduce_subscribe , <hpx_addr_t>   \
                                                 -> <hpx_action_t> \
                                                 -> <hpx_addr_t>   \
                                                 -> IO Int32
#ccall hpx_process_collective_allreduce_subscribe_finalize , <hpx_addr_t> \
                                                          -> IO CInt
#ccall hpx_process_collective_allreduce_unsubscribe , <hpx_addr_t> \
                                                   -> Int32        \
                                                   -> IO ()
#ccall hpx_process_delete , <hpx_addr_t> \
                         -> <hpx_addr_t> \
                         -> IO ()
#ccall hpx_process_getpid , <hpx_addr_t> \
                         -> IO <hpx_pid_t>
#ccall hpx_process_new , <hpx_addr_t> \
                      -> IO <hpx_addr_t>

-------------------------------------------------------------------------------
-- Other
-------------------------------------------------------------------------------

#if defined(linux_HOST_OS)
# synonym_t hpx_time_t , TimeSpec
#elif defined(darwin_HOST_OS)
# integral_t hpx_time_t
#endif

#ccall hpx_get_my_rank , IO CInt
#ccall hpx_get_my_thread_id , IO CInt
#ccall hpx_get_num_ranks , IO CInt
#ccall hpx_get_num_threads , IO CInt
#ccall hpx_is_active , IO CInt

#synonym_t hpx_type_t , Ptr <ffi_type>
#cinline HPX_CHAR       , <hpx_type_t>
#cinline HPX_UCHAR      , <hpx_type_t>
#cinline HPX_SCHAR      , <hpx_type_t>
#cinline HPX_SHORT      , <hpx_type_t>
#cinline HPX_USHORT     , <hpx_type_t>
#cinline HPX_SSHORT     , <hpx_type_t>
#cinline HPX_INT        , <hpx_type_t>
#cinline HPX_UINT       , <hpx_type_t>
#cinline HPX_SINT       , <hpx_type_t>
#cinline HPX_LONG       , <hpx_type_t>
#cinline HPX_ULONG      , <hpx_type_t>
#cinline HPX_SLONG      , <hpx_type_t>
#cinline HPX_VOID       , <hpx_type_t>
#cinline HPX_UINT8      , <hpx_type_t>
#cinline HPX_SINT8      , <hpx_type_t>
#cinline HPX_UINT16     , <hpx_type_t>
#cinline HPX_SINT16     , <hpx_type_t>
#cinline HPX_UINT32     , <hpx_type_t>
#cinline HPX_SINT32     , <hpx_type_t>
#cinline HPX_UINT64     , <hpx_type_t>
#cinline HPX_SINT64     , <hpx_type_t>
#cinline HPX_FLOAT      , <hpx_type_t>
#cinline HPX_DOUBLE     , <hpx_type_t>
#cinline HPX_POINTER    , <hpx_type_t>
#cinline HPX_LONGDOUBLE , <hpx_type_t>
#cinline HPX_SIZE_T     , <hpx_type_t>
#cinline HPX_ADDR       , <hpx_type_t>
#cinline HPX_ACTION_T   , <hpx_type_t>

#ccall wr_hpx_time_add , Ptr <hpx_time_t> \
                      -> Ptr <hpx_time_t> \
                      -> Ptr <hpx_time_t> \
                      -> IO ()
#ccall wr_hpx_time_construct , Ptr <hpx_time_t> \
                            -> CULong           \
                            -> CULong           \
                            -> IO ()
#ccall wr_hpx_time_diff , Ptr <hpx_time_t> \
                       -> Ptr <hpx_time_t> \
                       -> Ptr <hpx_time_t> \
                       -> IO ()
#ccall wr_hpx_time_diff_ms , Ptr <hpx_time_t> \
                          -> Ptr <hpx_time_t> \
                          -> IO CDouble
#ccall wr_hpx_time_diff_ns , Ptr <hpx_time_t> \
                          -> Ptr <hpx_time_t> \
                          -> IO Int64
#ccall wr_hpx_time_diff_us , Ptr <hpx_time_t> \
                          -> Ptr <hpx_time_t> \
                          -> IO CDouble
#ccall wr_hpx_time_elapsed , Ptr <hpx_time_t> \
                          -> Ptr <hpx_time_t> \
                          -> IO ()
#ccall wr_hpx_time_elapsed_ms , Ptr <hpx_time_t> \
                             -> IO CDouble
#ccall wr_hpx_time_elapsed_ns , Ptr <hpx_time_t> \
                             -> IO Word64
#ccall wr_hpx_time_elapsed_us , Ptr <hpx_time_t> \
                             -> IO CDouble
#ccall wr_hpx_time_from_start_ns , Ptr <hpx_time_t> \
                                -> IO Word64
#ccall wr_hpx_time_ms , Ptr <hpx_time_t> \
                     -> IO CDouble
#ccall wr_hpx_time_now , Ptr <hpx_time_t> \
                      -> IO ()
#ccall wr_hpx_time_ns , Ptr <hpx_time_t> \
                     -> IO CDouble
