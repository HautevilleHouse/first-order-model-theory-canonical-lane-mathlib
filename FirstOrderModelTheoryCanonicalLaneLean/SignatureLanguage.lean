import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure Signature where
  functionSymbols : List String
  relationSymbols : List String
  arity : String → Nat

structure SignatureLanguage (Σ : Signature) where
  terms : Type
  formulas : Type
  termInductive : Type
  formulaInductive : Type
  signatureConsistent : Prop

structure SignatureEvidence (Σ : Signature) (L : SignatureLanguage Σ) where
  signatureConsistentClosed : L.signatureConsistent

def SignatureLanguageClosed (Σ : Signature) (L : SignatureLanguage Σ) : Prop :=
  L.signatureConsistent

theorem signature_language_closed_from_evidence (Σ : Signature) (L : SignatureLanguage Σ) (E : SignatureEvidence Σ L) :
    SignatureLanguageClosed Σ L := by
  exact E.signatureConsistentClosed

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse