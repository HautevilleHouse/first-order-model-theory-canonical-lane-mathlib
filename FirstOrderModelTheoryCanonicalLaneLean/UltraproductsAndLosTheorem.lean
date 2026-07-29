import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.StructureAndModel

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure Ultraproduct {L : Language} (Mi : Index → Structure L) (U : Ultrafilter Index) where
  universe : Type (max u v w)
  structure : Structure L
  quotientMap : (i : Index) → Mi i → universe

theorem losTheorem {L : Language} {Mi : Index → Structure L} (U : Ultrafilter Index) (φ : Formula L) :
  (Ultraproduct Mi U) ⊨ φ ↔ { i | Mi i ⊨ φ } ∈ U := by
  induction φ with
  | true => simp
  | false => simp
  | rel R args => simp
  | eq t1 t2 => simp
  | not ψ => simp [IH ψ]
  | and ψ χ => simp [IH ψ, IH χ]
  | or ψ χ => simp [IH ψ, IH χ]
  | implies ψ χ => simp [IH ψ, IH χ]
  | forall x ψ =>
    constructor
    · intro h
      apply U.mem_of_forall
      intro i
      exact (IH ψ).mpr (h (Quotient.mk _ i))
    · intro h a
      apply (IH ψ).mp
      apply U.mem_of_forall
      intro i
      exact (IH ψ).mpr (h i)
  | exists x ψ =>
    constructor
    · intro h
      rcases h with ⟨a, ha⟩
      apply U.mem_of_exists
      intro i
      exact (IH ψ).mpr ha
    · intro h
      have : Nonempty { i | Mi i ⊨ ∃ x, ψ } := by
        apply U.nonempty_of_mem h
      rcases this with ⟨i, hi⟩
      rcases (IH ψ).mp hi with ⟨a, ha⟩
      exact ⟨Quotient.mk _ a, ha⟩

theorem ultraproduct_closed {L : Language} {Mi : Index → Structure L} (U : Ultrafilter Index) :
  (Ultraproduct Mi U) ⊨ φ ↔ { i | Mi i ⊨ φ } ∈ U := losTheorem U φ

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse