import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure FirstOrderStructure where
  carrier : Type u
  language : Type v
  interpretation : language → carrier → Prop

structure FirstOrderAdmittedObject where
  structure : FirstOrderStructure
  completeTheory : Prop
  modelCompanion : Prop
  conclusion : modelCompanion

structure FirstOrderEndgameState where
  object : FirstOrderAdmittedObject

def FirstOrderWitnessClosed (O : FirstOrderAdmittedObject) : Prop :=
  O.modelCompanion

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse