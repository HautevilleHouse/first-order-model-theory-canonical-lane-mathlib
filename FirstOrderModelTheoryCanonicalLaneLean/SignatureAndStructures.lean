import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure Signature where
  functionSymbols : List String
  relationSymbols : List String
  arity : String → Nat
  arityCondition : ∀ s ∈ functionSymbols ∪ relationSymbols, arity s ≥ 0

structure Structure (S : Signature) where
  universe : Type u
  interpretation : (f : S.functionSymbols) → (S.arity f → universe) → universe
  relation : (R : S.relationSymbols) → (S.arity R → universe) → Prop
  interpretationWellDefined : ∀ f : S.functionSymbols, ∀ args : S.arity f → universe, interpretation f args ∈ universe
  relationWellDefined : ∀ R : S.relationSymbols, ∀ args : S.arity R → universe, relation R args ∈ Prop

def SignatureClosed (S : Signature) : Prop :=
  S.functionSymbols ≠ [] ∨ S.relationSymbols ≠ []

theorem signature_closed_from_nonempty (S : Signature) (h : S.functionSymbols ≠ [] ∨ S.relationSymbols ≠ []) : SignatureClosed S :=
  h

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse
