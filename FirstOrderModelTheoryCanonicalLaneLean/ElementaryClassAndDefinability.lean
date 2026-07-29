import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.StructureAndModel

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

def ElementaryClass (L : Language) : Type (max u v w) :=
  { M : Structure L // ∀ (φ : Sentence L), M ⊨ φ ↔ φ ∈ TheoryOf M }

def DefinableSet {L : Language} (M : Structure L) (n : ℕ) : Type (max u v w) :=
  { S : Set (M.Universe ^ n) // ∃ (φ : Formula L) (fv : Finset ℕ), fv ⊆ Finset.range n ∧ S = { v : M.Universe ^ n | M ⊨ φ.substitute (fun i => v i) } }

theorem elementary_class_closed {L : Language} (K : ElementaryClass L) :
  (∀ M ∈ K, ∀ N ∈ K, M ≅ N → M ≡ N) := by
  intro M hM N hN h
  exact elementarilyEquivalent_of_isomorphic M N h

theorem definable_set_closed {L : Language} {M : Structure L} {n : ℕ} (D : DefinableSet M n) :
  ∃ (φ : Formula L), D.1 = { v : M.Universe ^ n | M ⊨ φ.substitute (fun i => v i) } := by
  exact D.2

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse