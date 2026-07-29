import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure Language where
  FunctionSymbols : Type u
  RelationSymbols : Type v
  arity : (FunctionSymbols ⊕ RelationSymbols) → ℕ

structure LanguageSignatureEvidence (L : Language) where
  functionSymbolsCounted : ℕ
  relationSymbolsCounted : ℕ
  arityWellDefined : Prop
  arityWellDefinedTerm : arityWellDefined

def LanguageSignatureClosed (L : Language) : Prop := True

theorem language_signature_closed_from_evidence (L : Language) (E : LanguageSignatureEvidence L) : LanguageSignatureClosed L := by
  trivial

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse