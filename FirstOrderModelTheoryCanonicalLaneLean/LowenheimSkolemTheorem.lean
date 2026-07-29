import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.CompactnessTheorem

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure LowenheimSkolemTheorem (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) (S : SatisfactionRelation Σ L M) (C : CompactnessTheorem Σ L M S) where
  cardinalBound : Type u
  downardLSType : Prop
  upwardLSType : Prop

structure LowenheimSkolemEvidence (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) (S : SatisfactionRelation Σ L M) (C : CompactnessTheorem Σ L M S) (LS : LowenheimSkolemTheorem Σ L M S C) where
  downardLSTypeClosed : LS.downardLSType
  upwardLSTypeClosed : LS.upwardLSType

def LowenheimSkolemClosed (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) (S : SatisfactionRelation Σ L M) (C : CompactnessTheorem Σ L M S) (LS : LowenheimSkolemTheorem Σ L M S C) : Prop :=
  LS.downardLSType ∧ LS.upwardLSType

theorem lowenheim_skolem_closed_from_evidence (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) (S : SatisfactionRelation Σ L M) (C : CompactnessTheorem Σ L M S) (LS : LowenheimSkolemTheorem Σ L M S C) (E : LowenheimSkolemEvidence Σ L M S C LS) :
    LowenheimSkolemClosed Σ L M S C LS := by
  exact And.intro E.downardLSTypeClosed E.upwardLSTypeClosed

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse