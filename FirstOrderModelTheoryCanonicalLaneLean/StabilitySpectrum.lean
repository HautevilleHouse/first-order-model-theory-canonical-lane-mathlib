import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure StabilitySpectrumPackage where
  language : Type u
  theory : Prop
  stableCardinals : Prop
  unstabilityWitness : Prop

structure StabilitySpectrumEvidence (S : StabilitySpectrumPackage) where
  theoryClosed : S.theory
  stableCardinalsClosed : S.stableCardinals
  unstabilityWitnessClosed : S.unstabilityWitness

def StabilitySpectrumClosed (S : StabilitySpectrumPackage) : Prop :=
  S.theory ∧ S.stableCardinals ∧ S.unstabilityWitness

theorem stability_spectrum_closed_from_evidence
    (S : StabilitySpectrumPackage) (E : StabilitySpectrumEvidence S) :
    StabilitySpectrumClosed S := by
  exact And.intro E.theoryClosed
    (And.intro E.stableCardinalsClosed E.unstabilityWitnessClosed)

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse