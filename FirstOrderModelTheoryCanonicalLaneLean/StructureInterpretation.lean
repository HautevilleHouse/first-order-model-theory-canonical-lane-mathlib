import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.SignatureLanguage

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure StructureInterpretation (Σ : Signature) (L : SignatureLanguage Σ) where
  universe : Type u
  functionInterpretation : String → (universe → universe)
  relationInterpretation : String → (universe → Prop)
  interpretationConsistent : Prop

structure StructureEvidence (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) where
  interpretationConsistentClosed : M.interpretationConsistent

def StructureClosed (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) : Prop :=
  M.interpretationConsistent

theorem structure_closed_from_evidence (Σ : Signature) (L : SignatureLanguage Σ) (M : StructureInterpretation Σ L) (E : StructureEvidence Σ L M) :
    StructureClosed Σ L M := by
  exact E.interpretationConsistentClosed

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse