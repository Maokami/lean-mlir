
import SSA.Projects.InstCombine.TacticAuto
import SSA.Projects.InstCombine.LLVM.Semantics
open BitVec
open LLVM

set_option linter.unusedTactic false
set_option linter.unreachableTactic false
set_option maxHeartbeats 5000000
set_option maxRecDepth 1000000
set_option Elab.async false

section gselecthsafehtransforms_proof
theorem cond_eq_and_const_thm (e e_1 : IntW 8) :
  select (icmp IntPred.eq e_1 (const? 8 10)) (icmp IntPred.ult e_1 e) (const? 1 0) ⊑
    select (icmp IntPred.eq e_1 (const? 8 10)) (icmp IntPred.ugt e (const? 8 10)) (const? 1 0) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem cond_eq_or_const_thm (e e_1 : IntW 8) :
  select (icmp IntPred.ne e_1 (const? 8 10)) (const? 1 1) (icmp IntPred.ult e_1 e) ⊑
    select (icmp IntPred.ne e_1 (const? 8 10)) (const? 1 1) (icmp IntPred.ugt e (const? 8 10)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem xor_and_thm (e e_1 : IntW 32) (e_2 : IntW 1) :
  LLVM.xor (select e_2 (icmp IntPred.ult e_1 e) (const? 1 0)) (const? 1 1) ⊑
    select (LLVM.xor e_2 (const? 1 1)) (const? 1 1) (icmp IntPred.uge e_1 e) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem xor_or_thm (e e_1 : IntW 32) (e_2 : IntW 1) :
  LLVM.xor (select e_2 (const? 1 1) (icmp IntPred.ult e_1 e)) (const? 1 1) ⊑
    select (LLVM.xor e_2 (const? 1 1)) (icmp IntPred.uge e_1 e) (const? 1 0) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem and_orn_cmp_1_logical_thm (e : IntW 1) (e_1 e_2 : IntW 32) :
  select (icmp IntPred.sgt e_2 e_1) (select e (const? 1 1) (icmp IntPred.sle e_2 e_1)) (const? 1 0) ⊑
    select (icmp IntPred.sgt e_2 e_1) e (const? 1 0) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem andn_or_cmp_2_logical_thm (e e_1 : IntW 16) (e_2 : IntW 1) :
  select (select e_2 (const? 1 1) (icmp IntPred.sge e_1 e)) (icmp IntPred.slt e_1 e) (const? 1 0) ⊑
    select e_2 (icmp IntPred.slt e_1 e) (const? 1 0) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem andn_or_cmp_2_partial_logical_thm (e : IntW 1) (e_1 e_2 : IntW 16) :
  select (LLVM.or (icmp IntPred.sge e_2 e_1) e) (icmp IntPred.slt e_2 e_1) (const? 1 0) ⊑
    LLVM.and e (icmp IntPred.slt e_2 e_1) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools_logical_commute0_thm (e e_1 e_2 : IntW 1) :
  select (select (LLVM.xor e_2 (const? 1 1)) e_1 (const? 1 0)) (const? 1 1) (select e_2 e (const? 1 0)) ⊑
    select e_2 e e_1 := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools_logical_commute0_and1_thm (e e_1 e_2 : IntW 1) :
  select (LLVM.and (LLVM.xor e_2 (const? 1 1)) e_1) (const? 1 1) (select e_2 e (const? 1 0)) ⊑ select e_2 e e_1 := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools_logical_commute0_and2_thm (e e_1 e_2 : IntW 1) :
  select (select (LLVM.xor e_2 (const? 1 1)) e_1 (const? 1 0)) (const? 1 1) (LLVM.and e_2 e) ⊑ select e_2 e e_1 := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools_logical_commute0_and1_and2_thm (e e_1 e_2 : IntW 1) :
  select (LLVM.and (LLVM.xor e_2 (const? 1 1)) e_1) (const? 1 1) (LLVM.and e_2 e) ⊑ select e_2 e e_1 := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools_logical_commute1_thm (e e_1 e_2 : IntW 1) :
  select (select e_2 (LLVM.xor e_1 (const? 1 1)) (const? 1 0)) (const? 1 1) (select e_1 e (const? 1 0)) ⊑
    select e_1 e e_2 := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools_logical_commute1_and2_thm (e e_1 e_2 : IntW 1) :
  select (select e_2 (LLVM.xor e_1 (const? 1 1)) (const? 1 0)) (const? 1 1) (LLVM.and e_1 e) ⊑ select e_1 e e_2 := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools_logical_commute3_and2_thm (e e_1 e_2 : IntW 1) :
  select (select e_2 (LLVM.xor e_1 (const? 1 1)) (const? 1 0)) (const? 1 1) (LLVM.and e e_1) ⊑ select e_1 e e_2 := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools2_logical_commute0_thm (e e_1 e_2 : IntW 1) :
  select (select e_2 e_1 (const? 1 0)) (const? 1 1) (select (LLVM.xor e_2 (const? 1 1)) e (const? 1 0)) ⊑
    select e_2 e_1 e := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools2_logical_commute0_and1_thm (e e_1 e_2 : IntW 1) :
  select (LLVM.and e_2 e_1) (const? 1 1) (select (LLVM.xor e_2 (const? 1 1)) e (const? 1 0)) ⊑ select e_2 e_1 e := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools2_logical_commute0_and2_thm (e e_1 e_2 : IntW 1) :
  select (select e_2 e_1 (const? 1 0)) (const? 1 1) (LLVM.and (LLVM.xor e_2 (const? 1 1)) e) ⊑ select e_2 e_1 e := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools2_logical_commute0_and1_and2_thm (e e_1 e_2 : IntW 1) :
  select (LLVM.and e_2 e_1) (const? 1 1) (LLVM.and (LLVM.xor e_2 (const? 1 1)) e) ⊑ select e_2 e_1 e := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools2_logical_commute1_thm (e e_1 e_2 : IntW 1) :
  select (select e_2 e_1 (const? 1 0)) (const? 1 1) (select (LLVM.xor e_1 (const? 1 1)) e (const? 1 0)) ⊑
    select e_1 e_2 e := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools2_logical_commute1_and1_thm (e e_1 e_2 : IntW 1) :
  select (LLVM.and e_2 e_1) (const? 1 1) (select (LLVM.xor e_1 (const? 1 1)) e (const? 1 0)) ⊑ select e_1 e_2 e := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools2_logical_commute1_and2_thm (e e_1 e_2 : IntW 1) :
  select (select e_2 e_1 (const? 1 0)) (const? 1 1) (LLVM.and (LLVM.xor e_1 (const? 1 1)) e) ⊑ select e_1 e_2 e := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools2_logical_commute1_and1_and2_thm (e e_1 e_2 : IntW 1) :
  select (LLVM.and e_2 e_1) (const? 1 1) (LLVM.and (LLVM.xor e_1 (const? 1 1)) e) ⊑ select e_1 e_2 e := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools2_logical_commute2_thm (e e_1 e_2 : IntW 1) :
  select (select e_2 e_1 (const? 1 0)) (const? 1 1) (select e (LLVM.xor e_2 (const? 1 1)) (const? 1 0)) ⊑
    select e_2 e_1 e := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools2_logical_commute2_and1_thm (e e_1 e_2 : IntW 1) :
  select (LLVM.and e_2 e_1) (const? 1 1) (select e (LLVM.xor e_2 (const? 1 1)) (const? 1 0)) ⊑ select e_2 e_1 e := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem bools2_logical_commute3_and1_thm (e e_1 e_2 : IntW 1) :
  select (LLVM.and e_2 e_1) (const? 1 1) (select e (LLVM.xor e_1 (const? 1 1)) (const? 1 0)) ⊑ select e_1 e_2 e := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem orn_and_cmp_1_logical_thm (e : IntW 1) (e_1 e_2 : IntW 37) :
  select (icmp IntPred.sle e_2 e_1) (const? 1 1) (select e (icmp IntPred.sgt e_2 e_1) (const? 1 0)) ⊑
    select (icmp IntPred.sle e_2 e_1) (const? 1 1) e := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem orn_and_cmp_2_logical_thm (e e_1 : IntW 16) (e_2 : IntW 1) :
  select (select e_2 (icmp IntPred.sge e_1 e) (const? 1 0)) (const? 1 1) (icmp IntPred.slt e_1 e) ⊑
    select e_2 (const? 1 1) (icmp IntPred.slt e_1 e) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem orn_and_cmp_2_partial_logical_thm (e : IntW 1) (e_1 e_2 : IntW 16) :
  select (LLVM.and (icmp IntPred.sge e_2 e_1) e) (const? 1 1) (icmp IntPred.slt e_2 e_1) ⊑
    LLVM.or e (icmp IntPred.slt e_2 e_1) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry
