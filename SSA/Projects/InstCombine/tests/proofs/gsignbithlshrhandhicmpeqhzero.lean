import SSA.Projects.InstCombine.tests.proofs.gsignbithlshrhandhicmpeqhzero_proof
import SSA.Projects.InstCombine.LLVM.PrettyEDSL
import SSA.Projects.InstCombine.TacticAuto
import SSA.Projects.InstCombine.LLVM.Semantics
open LLVM
open BitVec

open MLIR AST
open Ctxt (Var)

set_option linter.deprecated false
set_option linter.unreachableTactic false
set_option linter.unusedTactic false
section gsignbithlshrhandhicmpeqhzero_statements

def scalar_i8_signbit_lshr_and_eq_before := [llvm|
{
^0(%arg35 : i8, %arg36 : i8):
  %0 = llvm.mlir.constant(-128 : i8) : i8
  %1 = llvm.mlir.constant(0 : i8) : i8
  %2 = llvm.lshr %0, %arg36 : i8
  %3 = llvm.and %2, %arg35 : i8
  %4 = llvm.icmp "eq" %3, %1 : i8
  "llvm.return"(%4) : (i1) -> ()
}
]
def scalar_i8_signbit_lshr_and_eq_after := [llvm|
{
^0(%arg35 : i8, %arg36 : i8):
  %0 = llvm.mlir.constant(-128 : i8) : i8
  %1 = llvm.mlir.constant(0 : i8) : i8
  %2 = llvm.lshr exact %0, %arg36 : i8
  %3 = llvm.and %2, %arg35 : i8
  %4 = llvm.icmp "eq" %3, %1 : i8
  "llvm.return"(%4) : (i1) -> ()
}
]
set_option debug.skipKernelTC true in
theorem scalar_i8_signbit_lshr_and_eq_proof : scalar_i8_signbit_lshr_and_eq_before ⊑ scalar_i8_signbit_lshr_and_eq_after := by
  unfold scalar_i8_signbit_lshr_and_eq_before scalar_i8_signbit_lshr_and_eq_after
  simp_alive_peephole
  intros
  ---BEGIN scalar_i8_signbit_lshr_and_eq
  apply scalar_i8_signbit_lshr_and_eq_thm
  ---END scalar_i8_signbit_lshr_and_eq



def scalar_i16_signbit_lshr_and_eq_before := [llvm|
{
^0(%arg33 : i16, %arg34 : i16):
  %0 = llvm.mlir.constant(-32768 : i16) : i16
  %1 = llvm.mlir.constant(0 : i16) : i16
  %2 = llvm.lshr %0, %arg34 : i16
  %3 = llvm.and %2, %arg33 : i16
  %4 = llvm.icmp "eq" %3, %1 : i16
  "llvm.return"(%4) : (i1) -> ()
}
]
def scalar_i16_signbit_lshr_and_eq_after := [llvm|
{
^0(%arg33 : i16, %arg34 : i16):
  %0 = llvm.mlir.constant(-32768 : i16) : i16
  %1 = llvm.mlir.constant(0 : i16) : i16
  %2 = llvm.lshr exact %0, %arg34 : i16
  %3 = llvm.and %2, %arg33 : i16
  %4 = llvm.icmp "eq" %3, %1 : i16
  "llvm.return"(%4) : (i1) -> ()
}
]
set_option debug.skipKernelTC true in
theorem scalar_i16_signbit_lshr_and_eq_proof : scalar_i16_signbit_lshr_and_eq_before ⊑ scalar_i16_signbit_lshr_and_eq_after := by
  unfold scalar_i16_signbit_lshr_and_eq_before scalar_i16_signbit_lshr_and_eq_after
  simp_alive_peephole
  intros
  ---BEGIN scalar_i16_signbit_lshr_and_eq
  apply scalar_i16_signbit_lshr_and_eq_thm
  ---END scalar_i16_signbit_lshr_and_eq



def scalar_i32_signbit_lshr_and_eq_before := [llvm|
{
^0(%arg31 : i32, %arg32 : i32):
  %0 = llvm.mlir.constant(-2147483648 : i32) : i32
  %1 = llvm.mlir.constant(0 : i32) : i32
  %2 = llvm.lshr %0, %arg32 : i32
  %3 = llvm.and %2, %arg31 : i32
  %4 = llvm.icmp "eq" %3, %1 : i32
  "llvm.return"(%4) : (i1) -> ()
}
]
def scalar_i32_signbit_lshr_and_eq_after := [llvm|
{
^0(%arg31 : i32, %arg32 : i32):
  %0 = llvm.mlir.constant(-2147483648 : i32) : i32
  %1 = llvm.mlir.constant(0 : i32) : i32
  %2 = llvm.lshr exact %0, %arg32 : i32
  %3 = llvm.and %2, %arg31 : i32
  %4 = llvm.icmp "eq" %3, %1 : i32
  "llvm.return"(%4) : (i1) -> ()
}
]
set_option debug.skipKernelTC true in
theorem scalar_i32_signbit_lshr_and_eq_proof : scalar_i32_signbit_lshr_and_eq_before ⊑ scalar_i32_signbit_lshr_and_eq_after := by
  unfold scalar_i32_signbit_lshr_and_eq_before scalar_i32_signbit_lshr_and_eq_after
  simp_alive_peephole
  intros
  ---BEGIN scalar_i32_signbit_lshr_and_eq
  apply scalar_i32_signbit_lshr_and_eq_thm
  ---END scalar_i32_signbit_lshr_and_eq



def scalar_i64_signbit_lshr_and_eq_before := [llvm|
{
^0(%arg29 : i64, %arg30 : i64):
  %0 = llvm.mlir.constant(-9223372036854775808) : i64
  %1 = llvm.mlir.constant(0) : i64
  %2 = llvm.lshr %0, %arg30 : i64
  %3 = llvm.and %2, %arg29 : i64
  %4 = llvm.icmp "eq" %3, %1 : i64
  "llvm.return"(%4) : (i1) -> ()
}
]
def scalar_i64_signbit_lshr_and_eq_after := [llvm|
{
^0(%arg29 : i64, %arg30 : i64):
  %0 = llvm.mlir.constant(-9223372036854775808) : i64
  %1 = llvm.mlir.constant(0) : i64
  %2 = llvm.lshr exact %0, %arg30 : i64
  %3 = llvm.and %2, %arg29 : i64
  %4 = llvm.icmp "eq" %3, %1 : i64
  "llvm.return"(%4) : (i1) -> ()
}
]
set_option debug.skipKernelTC true in
theorem scalar_i64_signbit_lshr_and_eq_proof : scalar_i64_signbit_lshr_and_eq_before ⊑ scalar_i64_signbit_lshr_and_eq_after := by
  unfold scalar_i64_signbit_lshr_and_eq_before scalar_i64_signbit_lshr_and_eq_after
  simp_alive_peephole
  intros
  ---BEGIN scalar_i64_signbit_lshr_and_eq
  apply scalar_i64_signbit_lshr_and_eq_thm
  ---END scalar_i64_signbit_lshr_and_eq



def scalar_i32_signbit_lshr_and_ne_before := [llvm|
{
^0(%arg27 : i32, %arg28 : i32):
  %0 = llvm.mlir.constant(-2147483648 : i32) : i32
  %1 = llvm.mlir.constant(0 : i32) : i32
  %2 = llvm.lshr %0, %arg28 : i32
  %3 = llvm.and %2, %arg27 : i32
  %4 = llvm.icmp "ne" %3, %1 : i32
  "llvm.return"(%4) : (i1) -> ()
}
]
def scalar_i32_signbit_lshr_and_ne_after := [llvm|
{
^0(%arg27 : i32, %arg28 : i32):
  %0 = llvm.mlir.constant(-2147483648 : i32) : i32
  %1 = llvm.mlir.constant(0 : i32) : i32
  %2 = llvm.lshr exact %0, %arg28 : i32
  %3 = llvm.and %2, %arg27 : i32
  %4 = llvm.icmp "ne" %3, %1 : i32
  "llvm.return"(%4) : (i1) -> ()
}
]
set_option debug.skipKernelTC true in
theorem scalar_i32_signbit_lshr_and_ne_proof : scalar_i32_signbit_lshr_and_ne_before ⊑ scalar_i32_signbit_lshr_and_ne_after := by
  unfold scalar_i32_signbit_lshr_and_ne_before scalar_i32_signbit_lshr_and_ne_after
  simp_alive_peephole
  intros
  ---BEGIN scalar_i32_signbit_lshr_and_ne
  apply scalar_i32_signbit_lshr_and_ne_thm
  ---END scalar_i32_signbit_lshr_and_ne



def scalar_i32_signbit_lshr_and_eq_X_is_constant1_before := [llvm|
{
^0(%arg5 : i32):
  %0 = llvm.mlir.constant(-2147483648 : i32) : i32
  %1 = llvm.mlir.constant(12345 : i32) : i32
  %2 = llvm.mlir.constant(0 : i32) : i32
  %3 = llvm.lshr %0, %arg5 : i32
  %4 = llvm.and %3, %1 : i32
  %5 = llvm.icmp "eq" %4, %2 : i32
  "llvm.return"(%5) : (i1) -> ()
}
]
def scalar_i32_signbit_lshr_and_eq_X_is_constant1_after := [llvm|
{
^0(%arg5 : i32):
  %0 = llvm.mlir.constant(-2147483648 : i32) : i32
  %1 = llvm.mlir.constant(12345 : i32) : i32
  %2 = llvm.mlir.constant(0 : i32) : i32
  %3 = llvm.lshr exact %0, %arg5 : i32
  %4 = llvm.and %3, %1 : i32
  %5 = llvm.icmp "eq" %4, %2 : i32
  "llvm.return"(%5) : (i1) -> ()
}
]
set_option debug.skipKernelTC true in
theorem scalar_i32_signbit_lshr_and_eq_X_is_constant1_proof : scalar_i32_signbit_lshr_and_eq_X_is_constant1_before ⊑ scalar_i32_signbit_lshr_and_eq_X_is_constant1_after := by
  unfold scalar_i32_signbit_lshr_and_eq_X_is_constant1_before scalar_i32_signbit_lshr_and_eq_X_is_constant1_after
  simp_alive_peephole
  intros
  ---BEGIN scalar_i32_signbit_lshr_and_eq_X_is_constant1
  apply scalar_i32_signbit_lshr_and_eq_X_is_constant1_thm
  ---END scalar_i32_signbit_lshr_and_eq_X_is_constant1



def scalar_i32_signbit_lshr_and_eq_X_is_constant2_before := [llvm|
{
^0(%arg4 : i32):
  %0 = llvm.mlir.constant(-2147483648 : i32) : i32
  %1 = llvm.mlir.constant(1 : i32) : i32
  %2 = llvm.mlir.constant(0 : i32) : i32
  %3 = llvm.lshr %0, %arg4 : i32
  %4 = llvm.and %3, %1 : i32
  %5 = llvm.icmp "eq" %4, %2 : i32
  "llvm.return"(%5) : (i1) -> ()
}
]
def scalar_i32_signbit_lshr_and_eq_X_is_constant2_after := [llvm|
{
^0(%arg4 : i32):
  %0 = llvm.mlir.constant(31 : i32) : i32
  %1 = llvm.icmp "ne" %arg4, %0 : i32
  "llvm.return"(%1) : (i1) -> ()
}
]
set_option debug.skipKernelTC true in
theorem scalar_i32_signbit_lshr_and_eq_X_is_constant2_proof : scalar_i32_signbit_lshr_and_eq_X_is_constant2_before ⊑ scalar_i32_signbit_lshr_and_eq_X_is_constant2_after := by
  unfold scalar_i32_signbit_lshr_and_eq_X_is_constant2_before scalar_i32_signbit_lshr_and_eq_X_is_constant2_after
  simp_alive_peephole
  intros
  ---BEGIN scalar_i32_signbit_lshr_and_eq_X_is_constant2
  apply scalar_i32_signbit_lshr_and_eq_X_is_constant2_thm
  ---END scalar_i32_signbit_lshr_and_eq_X_is_constant2



def scalar_i32_signbit_lshr_and_slt_before := [llvm|
{
^0(%arg2 : i32, %arg3 : i32):
  %0 = llvm.mlir.constant(-2147483648 : i32) : i32
  %1 = llvm.mlir.constant(0 : i32) : i32
  %2 = llvm.lshr %0, %arg3 : i32
  %3 = llvm.and %2, %arg2 : i32
  %4 = llvm.icmp "slt" %3, %1 : i32
  "llvm.return"(%4) : (i1) -> ()
}
]
def scalar_i32_signbit_lshr_and_slt_after := [llvm|
{
^0(%arg2 : i32, %arg3 : i32):
  %0 = llvm.mlir.constant(-2147483648 : i32) : i32
  %1 = llvm.mlir.constant(0 : i32) : i32
  %2 = llvm.lshr exact %0, %arg3 : i32
  %3 = llvm.and %2, %arg2 : i32
  %4 = llvm.icmp "slt" %3, %1 : i32
  "llvm.return"(%4) : (i1) -> ()
}
]
set_option debug.skipKernelTC true in
theorem scalar_i32_signbit_lshr_and_slt_proof : scalar_i32_signbit_lshr_and_slt_before ⊑ scalar_i32_signbit_lshr_and_slt_after := by
  unfold scalar_i32_signbit_lshr_and_slt_before scalar_i32_signbit_lshr_and_slt_after
  simp_alive_peephole
  intros
  ---BEGIN scalar_i32_signbit_lshr_and_slt
  apply scalar_i32_signbit_lshr_and_slt_thm
  ---END scalar_i32_signbit_lshr_and_slt



def scalar_i32_signbit_lshr_and_eq_nonzero_before := [llvm|
{
^0(%arg0 : i32, %arg1 : i32):
  %0 = llvm.mlir.constant(-2147483648 : i32) : i32
  %1 = llvm.mlir.constant(1 : i32) : i32
  %2 = llvm.lshr %0, %arg1 : i32
  %3 = llvm.and %2, %arg0 : i32
  %4 = llvm.icmp "eq" %3, %1 : i32
  "llvm.return"(%4) : (i1) -> ()
}
]
def scalar_i32_signbit_lshr_and_eq_nonzero_after := [llvm|
{
^0(%arg0 : i32, %arg1 : i32):
  %0 = llvm.mlir.constant(-2147483648 : i32) : i32
  %1 = llvm.mlir.constant(1 : i32) : i32
  %2 = llvm.lshr exact %0, %arg1 : i32
  %3 = llvm.and %2, %arg0 : i32
  %4 = llvm.icmp "eq" %3, %1 : i32
  "llvm.return"(%4) : (i1) -> ()
}
]
set_option debug.skipKernelTC true in
theorem scalar_i32_signbit_lshr_and_eq_nonzero_proof : scalar_i32_signbit_lshr_and_eq_nonzero_before ⊑ scalar_i32_signbit_lshr_and_eq_nonzero_after := by
  unfold scalar_i32_signbit_lshr_and_eq_nonzero_before scalar_i32_signbit_lshr_and_eq_nonzero_after
  simp_alive_peephole
  intros
  ---BEGIN scalar_i32_signbit_lshr_and_eq_nonzero
  apply scalar_i32_signbit_lshr_and_eq_nonzero_thm
  ---END scalar_i32_signbit_lshr_and_eq_nonzero


