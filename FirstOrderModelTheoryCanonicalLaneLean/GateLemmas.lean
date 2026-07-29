import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A :=
  A.gateWitness

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse
