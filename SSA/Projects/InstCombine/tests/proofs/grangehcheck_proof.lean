
import SSA.Projects.InstCombine.TacticAuto
import SSA.Projects.InstCombine.LLVM.Semantics
open BitVec
open LLVM

set_option linter.unusedTactic false
set_option linter.unreachableTactic false
set_option maxHeartbeats 5000000
set_option maxRecDepth 1000000
set_option Elab.async false

section grangehcheck_proof
theorem test_and1_thm (e e_1 : IntW 32) :
  LLVM.and (icmp IntPred.sge e_1 (const? 32 0)) (icmp IntPred.slt e_1 (LLVM.and e (const? 32 2147483647))) ⊑
    icmp IntPred.ult e_1 (LLVM.and e (const? 32 2147483647)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_and1_logical_thm (e e_1 : IntW 32) :
  select (icmp IntPred.sge e_1 (const? 32 0)) (icmp IntPred.slt e_1 (LLVM.and e (const? 32 2147483647)))
      (const? 1 0) ⊑
    select (icmp IntPred.sgt e_1 (const? 32 (-1))) (icmp IntPred.slt e_1 (LLVM.and e (const? 32 2147483647)))
      (const? 1 0) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_and2_thm (e e_1 : IntW 32) :
  LLVM.and (icmp IntPred.sgt e_1 (const? 32 (-1)))
      (icmp IntPred.sle e_1 (LLVM.and e (const? 32 2147483647))) ⊑
    icmp IntPred.ule e_1 (LLVM.and e (const? 32 2147483647)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_and3_thm (e e_1 : IntW 32) :
  LLVM.and (icmp IntPred.sgt (LLVM.and e_1 (const? 32 2147483647)) e) (icmp IntPred.sge e (const? 32 0)) ⊑
    icmp IntPred.ult e (LLVM.and e_1 (const? 32 2147483647)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_and3_logical_thm (e e_1 : IntW 32) :
  select (icmp IntPred.sgt (LLVM.and e_1 (const? 32 2147483647)) e) (icmp IntPred.sge e (const? 32 0))
      (const? 1 0) ⊑
    icmp IntPred.ult e (LLVM.and e_1 (const? 32 2147483647)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_and4_thm (e e_1 : IntW 32) :
  LLVM.and (icmp IntPred.sge (LLVM.and e_1 (const? 32 2147483647)) e) (icmp IntPred.sge e (const? 32 0)) ⊑
    icmp IntPred.ule e (LLVM.and e_1 (const? 32 2147483647)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_and4_logical_thm (e e_1 : IntW 32) :
  select (icmp IntPred.sge (LLVM.and e_1 (const? 32 2147483647)) e) (icmp IntPred.sge e (const? 32 0))
      (const? 1 0) ⊑
    icmp IntPred.ule e (LLVM.and e_1 (const? 32 2147483647)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_or1_thm (e e_1 : IntW 32) :
  LLVM.or (icmp IntPred.slt e_1 (const? 32 0)) (icmp IntPred.sge e_1 (LLVM.and e (const? 32 2147483647))) ⊑
    icmp IntPred.uge e_1 (LLVM.and e (const? 32 2147483647)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_or2_thm (e e_1 : IntW 32) :
  LLVM.or (icmp IntPred.sle e_1 (const? 32 (-1))) (icmp IntPred.sgt e_1 (LLVM.and e (const? 32 2147483647))) ⊑
    icmp IntPred.ugt e_1 (LLVM.and e (const? 32 2147483647)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_or2_logical_thm (e e_1 : IntW 32) :
  select (icmp IntPred.sle e_1 (const? 32 (-1))) (const? 1 1)
      (icmp IntPred.sgt e_1 (LLVM.and e (const? 32 2147483647))) ⊑
    select (icmp IntPred.slt e_1 (const? 32 0)) (const? 1 1)
      (icmp IntPred.sgt e_1 (LLVM.and e (const? 32 2147483647))) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_or3_thm (e e_1 : IntW 32) :
  LLVM.or (icmp IntPred.sle (LLVM.and e_1 (const? 32 2147483647)) e) (icmp IntPred.slt e (const? 32 0)) ⊑
    icmp IntPred.uge e (LLVM.and e_1 (const? 32 2147483647)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_or3_logical_thm (e e_1 : IntW 32) :
  select (icmp IntPred.sle (LLVM.and e_1 (const? 32 2147483647)) e) (const? 1 1)
      (icmp IntPred.slt e (const? 32 0)) ⊑
    icmp IntPred.uge e (LLVM.and e_1 (const? 32 2147483647)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_or4_thm (e e_1 : IntW 32) :
  LLVM.or (icmp IntPred.slt (LLVM.and e_1 (const? 32 2147483647)) e) (icmp IntPred.slt e (const? 32 0)) ⊑
    icmp IntPred.ugt e (LLVM.and e_1 (const? 32 2147483647)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem test_or4_logical_thm (e e_1 : IntW 32) :
  select (icmp IntPred.slt (LLVM.and e_1 (const? 32 2147483647)) e) (const? 1 1)
      (icmp IntPred.slt e (const? 32 0)) ⊑
    icmp IntPred.ugt e (LLVM.and e_1 (const? 32 2147483647)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem negative1_logical_thm (e e_1 : IntW 32) :
  select (icmp IntPred.slt e_1 (LLVM.and e (const? 32 2147483647))) (icmp IntPred.sgt e_1 (const? 32 0))
      (const? 1 0) ⊑
    LLVM.and (icmp IntPred.slt e_1 (LLVM.and e (const? 32 2147483647)))
      (icmp IntPred.sgt e_1 (const? 32 0)) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem negative2_thm (e e_1 : IntW 32) :
  LLVM.and (icmp IntPred.slt e_1 e) (icmp IntPred.sge e_1 (const? 32 0)) ⊑
    LLVM.and (icmp IntPred.slt e_1 e) (icmp IntPred.sgt e_1 (const? 32 (-1))) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem negative2_logical_thm (e e_1 : IntW 32) :
  select (icmp IntPred.slt e_1 e) (icmp IntPred.sge e_1 (const? 32 0)) (const? 1 0) ⊑
    LLVM.and (icmp IntPred.slt e_1 e) (icmp IntPred.sgt e_1 (const? 32 (-1))) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem negative3_thm (e e_1 e_2 : IntW 32) :
  LLVM.and (icmp IntPred.slt e_2 (LLVM.and e_1 (const? 32 2147483647))) (icmp IntPred.sge e (const? 32 0)) ⊑
    LLVM.and (icmp IntPred.slt e_2 (LLVM.and e_1 (const? 32 2147483647)))
      (icmp IntPred.sgt e (const? 32 (-1))) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem negative3_logical_thm (e e_1 e_2 : IntW 32) :
  select (icmp IntPred.slt e_2 (LLVM.and e_1 (const? 32 2147483647))) (icmp IntPred.sge e (const? 32 0))
      (const? 1 0) ⊑
    select (icmp IntPred.slt e_2 (LLVM.and e_1 (const? 32 2147483647))) (icmp IntPred.sgt e (const? 32 (-1)))
      (const? 1 0) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem negative4_thm (e e_1 : IntW 32) :
  LLVM.and (icmp IntPred.ne e_1 (LLVM.and e (const? 32 2147483647))) (icmp IntPred.sge e_1 (const? 32 0)) ⊑
    LLVM.and (icmp IntPred.ne e_1 (LLVM.and e (const? 32 2147483647)))
      (icmp IntPred.sgt e_1 (const? 32 (-1))) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem negative4_logical_thm (e e_1 : IntW 32) :
  select (icmp IntPred.ne e_1 (LLVM.and e (const? 32 2147483647))) (icmp IntPred.sge e_1 (const? 32 0))
      (const? 1 0) ⊑
    LLVM.and (icmp IntPred.ne e_1 (LLVM.and e (const? 32 2147483647)))
      (icmp IntPred.sgt e_1 (const? 32 (-1))) := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem negative5_thm (e e_1 : IntW 32) :
  LLVM.or (icmp IntPred.slt e_1 (LLVM.and e (const? 32 2147483647))) (icmp IntPred.sge e_1 (const? 32 0)) ⊑
    const? 1 1 := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry


theorem negative5_logical_thm (e e_1 : IntW 32) :
  select (icmp IntPred.slt e_1 (LLVM.and e (const? 32 2147483647))) (const? 1 1)
      (icmp IntPred.sge e_1 (const? 32 0)) ⊑
    const? 1 1 := by
    simp_alive_undef
    simp_alive_ops
    simp_alive_case_bash
    simp_alive_split
    simp_alive_benchmark
    all_goals sorry
