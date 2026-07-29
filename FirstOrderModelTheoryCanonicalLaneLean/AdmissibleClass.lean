import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure AdmissibleClass where
  object : FirstOrderAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FirstOrderWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse