import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.SatisfactionRelation

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure CompactnessTheorem (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) (S : SatisfactionRelation Σ L M) where
  finiteSatisfiability : Prop
  fullSatisfiability : Prop
  compactnessImplication : Prop

structure CompactnessEvidence (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) (S : SatisfactionRelation Σ L M) (C : CompactnessTheorem Σ L M S) where
  finiteSatisfiabilityClosed : C.finiteSatisfiability
  fullSatisfiabilityClosed : C.fullSatisfiability
  compactnessImplicationClosed : C.compactnessImplication

def CompactnessClosed (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) (S : SatisfactionRelation Σ L M) (C : CompactnessTheorem Σ L M S) : Prop :=
  C.finiteSatisfiability ∧ C.fullSatisfiability ∧ C.compactnessImplication

theorem compactness_closed_from_evidence (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) (S : SatisfactionRelation Σ L M) (C : CompactnessTheorem Σ L M S) (E : CompactnessEvidence Σ L M S C) :
    CompactnessClosed Σ L M S C := by
  exact And.intro E.finiteSatisfiabilityClosed (And.intro E.fullSatisfiabilityClosed E.compactnessImplicationClosed)

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse