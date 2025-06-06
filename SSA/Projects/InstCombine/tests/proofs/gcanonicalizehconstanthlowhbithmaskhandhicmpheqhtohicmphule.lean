import SSA.Projects.InstCombine.tests.proofs.gcanonicalizehconstanthlowhbithmaskhandhicmpheqhtohicmphule_proof
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
section gcanonicalizehconstanthlowhbithmaskhandhicmpheqhtohicmphule_statements

def p0_before := [llvm|
{
^0(%arg16 : i8):
  %0 = llvm.mlir.constant(3 : i8) : i8
  %1 = llvm.and %arg16, %0 : i8
  %2 = llvm.icmp "eq" %1, %arg16 : i8
  "llvm.return"(%2) : (i1) -> ()
}
]
def p0_after := [llvm|
{
^0(%arg16 : i8):
  %0 = llvm.mlir.constant(4 : i8) : i8
  %1 = llvm.icmp "ult" %arg16, %0 : i8
  "llvm.return"(%1) : (i1) -> ()
}
]
set_option debug.skipKernelTC true in
theorem p0_proof : p0_before ⊑ p0_after := by
  unfold p0_before p0_after
  simp_alive_peephole
  intros
  ---BEGIN p0
  apply p0_thm
  ---END p0



def pv_before := [llvm|
{
^0(%arg14 : i8, %arg15 : i8):
  %0 = llvm.mlir.constant(-1 : i8) : i8
  %1 = llvm.lshr %0, %arg15 : i8
  %2 = llvm.and %1, %arg14 : i8
  %3 = llvm.icmp "eq" %2, %arg14 : i8
  "llvm.return"(%3) : (i1) -> ()
}
]
def pv_after := [llvm|
{
^0(%arg14 : i8, %arg15 : i8):
  %0 = llvm.mlir.constant(-1 : i8) : i8
  %1 = llvm.lshr %0, %arg15 : i8
  %2 = llvm.icmp "ule" %arg14, %1 : i8
  "llvm.return"(%2) : (i1) -> ()
}
]
set_option debug.skipKernelTC true in
theorem pv_proof : pv_before ⊑ pv_after := by
  unfold pv_before pv_after
  simp_alive_peephole
  intros
  ---BEGIN pv
  apply pv_thm
  ---END pv



def n0_before := [llvm|
{
^0(%arg4 : i8):
  %0 = llvm.mlir.constant(4 : i8) : i8
  %1 = llvm.and %arg4, %0 : i8
  %2 = llvm.icmp "eq" %1, %arg4 : i8
  "llvm.return"(%2) : (i1) -> ()
}
]
def n0_after := [llvm|
{
^0(%arg4 : i8):
  %0 = llvm.mlir.constant(-5 : i8) : i8
  %1 = llvm.mlir.constant(0 : i8) : i8
  %2 = llvm.and %arg4, %0 : i8
  %3 = llvm.icmp "eq" %2, %1 : i8
  "llvm.return"(%3) : (i1) -> ()
}
]
set_option debug.skipKernelTC true in
theorem n0_proof : n0_before ⊑ n0_after := by
  unfold n0_before n0_after
  simp_alive_peephole
  intros
  ---BEGIN n0
  apply n0_thm
  ---END n0


