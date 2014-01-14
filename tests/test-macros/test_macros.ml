(*
 * Copyright (c) 2013 Jeremy Yallop.
 *
 * This file is distributed under the terms of the MIT License.
 * See the file LICENSE for details.
 *)

open OUnit
open Ctypes


(*
  Test calling type-generic macros.
*)
let test_tg_macros () =
  let open Generated_bindings in
  assert_bool "calling double version of type-generic exp"
    (exp_double 1.0 = exp 1.0);
  assert_bool "calling float version of type-generic exp"
    (abs_float (exp_float 1.0 -. exp 1.0) <= 0.001)


let suite = "Macro tests" >:::
  ["Calling type-generic macros"
    >:: test_tg_macros;
  ]


let _ =
  run_test_tt_main suite
