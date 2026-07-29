import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.TheoryAndSatisfiability

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

def QuantifierElimination (L : Language) (T : Theory L) : Prop :=
  ∀ (φ : Formula L), ∃ (ψ : Formula L), ψ.isQuantifierFree ∧ (T ⊢ φ ↔ ψ)

theorem quantifierEliminationTest {L : Language} (T : Theory L) :
  (∀ (φ : Formula L), φ.isExistential → (∃ (ψ : Formula L), ψ.isQuantifierFree ∧ T ⊢ φ ↔ ψ)) →
  QuantifierElimination L T := by
  intro h φ
  induction φ with
  | true => exact ⟨φ, by simp, by apply provable_iff⟩
  | false => exact ⟨φ, by simp, by apply provable_iff⟩
  | rel R args => exact ⟨φ, by simp, by apply provable_iff⟩
  | eq t1 t2 => exact ⟨φ, by simp, by apply provable_iff⟩
  | not ψ =>
    rcases ih ψ with ⟨ψ', hqf, h⟩
    exact ⟨¬' ψ', hqf, by
      rw [h]
      apply not_iff_provable⟩
  | and ψ χ =>
    rcases ih ψ with ⟨ψ', hqf1, h1⟩
    rcases ih χ with ⟨χ', hqf2, h2⟩
    exact ⟨ψ' ∧' χ', hqf1.and hqf2, by
      rw [h1, h2]
      apply and_iff_provable⟩
  | or ψ χ =>
    rcases ih ψ with ⟨ψ', hqf1, h1⟩
    rcases ih χ with ⟨χ', hqf2, h2⟩
    exact ⟨ψ' ∨' χ', hqf1.or hqf2, by
      rw [h1, h2]
      apply or_iff_provable⟩
  | implies ψ χ =>
    rcases ih ψ with ⟨ψ', hqf1, h1⟩
    rcases ih χ with ⟨χ', hqf2, h2⟩
    exact ⟨ψ' →' χ', hqf1.implies hqf2, by
      rw [h1, h2]
      apply implies_iff_provable⟩
  | forall x ψ =>
    have ex : (∃ x, ¬' ψ).isExistential := by
      simp
    rcases h (∃ x, ¬' ψ) ex with ⟨θ, hqf, h_eq⟩
    refine ⟨¬' θ, hqf, ?_⟩
    calc
      T ⊢ (∀ x, ψ) ↔ ¬ (∃ x, ¬ ψ) := by
        apply provable_iff_forall_not_exists
      _ ↔ ¬ θ := by
        rw [h_eq]
      _ ↔ ¬' θ := by
        apply not_iff_provable
  | exists x ψ =>
    have ex : (∃ x, ψ).isExistential := by
      simp
    rcases h (∃ x, ψ) ex with ⟨θ, hqf, h_eq⟩
    exact ⟨θ, hqf, h_eq⟩

theorem quantifierEliminationClosure {L : Language} (T : Theory L) (hQE : QuantifierElimination L T) :
  T isComplete := by
  intro φ
  have : φ.isQuantifierFree ∨ ¬ φ.isQuantifierFree := by
    apply em
  rcases this with (hqf | hqf)
  · have : T ⊢ φ ∨ T ⊢ ¬' φ := hQE.complete_quantifierFree φ hqf
    exact this
  · have : T ⊢ φ ↔ (φ.toPrenex).toPrenexEquivalent := by
      apply provable_iff_prenex
    sorry

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse