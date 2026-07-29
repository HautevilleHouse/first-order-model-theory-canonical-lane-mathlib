import canonicalLaneMathlib.MathlibObjects

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure Signature where
  functionSymbols : List String
  relationSymbols : List String
  arity : String → Nat

structure SignaturePackage where
  sig : Signature
  languageDefined : Prop
  languageDefinedClosed : languageDefined

structure SignatureEvidence (S : SignaturePackage) where
  languageDefinedClosed : S.languageDefined

def SignatureClosed (S : SignaturePackage) : Prop :=
  S.languageDefined

theorem signature_closed_from_evidence (S : SignaturePackage) (E : SignatureEvidence S) :
    SignatureClosed S := by
  exact E.languageDefinedClosed

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse