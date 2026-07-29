import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.StructureInterpretation

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure SatisfactionRelation (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) where
  satisfaction : M.universe → L.formulas → Prop
  assignmentConsistent : Prop
  satisfactionCompositional : Prop

structure SatisfactionEvidence (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) (S : SatisfactionRelation Σ L M) where
  assignmentConsistentClosed : S.assignmentConsistent
  satisfactionCompositionalClosed : S.satisfactionCompositional

def SatisfactionClosed (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) (S : SatisfactionRelation Σ L M) : Prop :=
  S.assignmentConsistent ∧ S.satisfactionCompositional

theorem satisfaction_closed_from_evidence (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) (S : SatisfactionRelation Σ L M) (E : SatisfactionEvidence Σ L M S) :
    SatisfactionClosed Σ L M S := by
  exact And.intro E.assignmentConsistentClosed E.satisfactionCompositionalClosed

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse