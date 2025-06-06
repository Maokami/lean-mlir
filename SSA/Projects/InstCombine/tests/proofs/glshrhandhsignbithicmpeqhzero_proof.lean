
import SSA.Projects.InstCombine.TacticAuto
import SSA.Projects.InstCombine.LLVM.Semantics
open BitVec
open LLVM

set_option linter.unusedTactic false
set_option linter.unreachableTactic false
set_option maxHeartbeats 5000000
set_option maxRecDepth 1000000
set_option Elab.async false

section glshrhandhsignbithicmpeqhzero_proof
theorem scalar_i8_lshr_and_signbit_eq_thm (e e_1 : IntW 8) :
  icmp IntPred.eq (LLVM.and (lshr e_1 e) (const? 8 (-128))) (const? 8 0) ⊑
    icmp IntPred.sgt (lshr e_1 e) (const? 8 (-1)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem scalar_i16_lshr_and_signbit_eq_thm (e e_1 : IntW 16) :
  icmp IntPred.eq (LLVM.and (lshr e_1 e) (const? 16 (-32768))) (const? 16 0) ⊑
    icmp IntPred.sgt (lshr e_1 e) (const? 16 (-1)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem scalar_i32_lshr_and_signbit_eq_thm (e e_1 : IntW 32) :
  icmp IntPred.eq (LLVM.and (lshr e_1 e) (const? 32 (-2147483648))) (const? 32 0) ⊑
    icmp IntPred.sgt (lshr e_1 e) (const? 32 (-1)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem scalar_i64_lshr_and_signbit_eq_thm (e e_1 : IntW 64) :
  icmp IntPred.eq (LLVM.and (lshr e_1 e) (const? 64 (-9223372036854775808))) (const? 64 0) ⊑
    icmp IntPred.sgt (lshr e_1 e) (const? 64 (-1)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem scalar_i32_lshr_and_signbit_ne_thm (e e_1 : IntW 32) :
  icmp IntPred.ne (LLVM.and (lshr e_1 e) (const? 32 (-2147483648))) (const? 32 0) ⊑
    icmp IntPred.slt (lshr e_1 e) (const? 32 0) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem scalar_i32_lshr_and_signbit_eq_X_is_constant1_thm (e : IntW 32) :
  icmp IntPred.eq (LLVM.and (lshr (const? 32 12345) e) (const? 32 (-2147483648))) (const? 32 0) ⊑
    const? 1 1 := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem scalar_i32_lshr_and_negC_eq_X_is_constant2_thm (e : IntW 32) :
  icmp IntPred.eq (LLVM.and (lshr (const? 32 (-2147483648)) e) (const? 32 (-2147483648))) (const? 32 0) ⊑
    icmp IntPred.ne e (const? 32 0) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem scalar_i32_lshr_and_negC_slt_thm (e e_1 : IntW 32) :
  icmp IntPred.slt (LLVM.and (lshr e_1 e) (const? 32 (-2147483648))) (const? 32 0) ⊑
    icmp IntPred.slt (lshr e_1 e) (const? 32 0) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem scalar_i32_lshr_and_negC_eq_nonzero_thm (e e_1 : IntW 32) :
  icmp IntPred.eq (LLVM.and (lshr e_1 e) (const? 32 (-2147483648))) (const? 32 1) ⊑ const? 1 0 := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry
