import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.LanguageSignature
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.StructureAndModel

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure Theory (L : Language) where
  axioms : List (Formula L)

def formulaSatisfied {L : Language} (M : Structure L) (φ : Formula L) : Prop :=
  match φ with
  | .true => True
  | .false => False
  | .rel r args => M.interpretRelation r args
  | .eq t1 t2 => (interpretTerm M t1) = (interpretTerm M t2)
  | .not ψ => ¬ (M ⊨ ψ)
  | .and ψ χ => (M ⊨ ψ) ∧ (M ⊨ χ)
  | .or ψ χ => (M ⊨ ψ) ∨ (M ⊨ χ)
  | .implies ψ χ => (M ⊨ ψ) → (M ⊨ χ)
  | .forall x ψ => ∀ (a : M.Universe), (M[x↦a] ⊨ ψ)
  | .exists x ψ => ∃ (a : M.Universe), (M[x↦a] ⊨ ψ)
  where
    interpretTerm {L : Language} (M : Structure L) (t : Term L) : M.Universe :=
      match t with
      | .var x => M.variableAssignment x
      | .func f args => M.interpretFunction f (args.map (interpretTerm M))

instance {L : Language} (M : Structure L) : Semantics M (Formula L) where
  satisfies := formulaSatisfied

theorem theory_consistent_iff_satisfiable {L : Language} (T : Theory L) :
  Consistent T ↔ Satisfiable T := by
  constructor
  · intro h
    exact h.satisfiable
  · intro h
    exact h.consistent

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse