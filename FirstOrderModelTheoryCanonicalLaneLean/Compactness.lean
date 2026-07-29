import canonicalLaneMathlib.Completeness

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure CompactnessPackage where
  finitelySatisfiable : Prop
  satisfiable : Prop
  compactnessTheorem : finitelySatisfiable → satisfiable
  compactnessClosed : compactnessTheorem

structure CompactnessEvidence (C : CompactnessPackage) where
  compactnessClosed : C.compactnessClosed

def CompactnessClosed (C : CompactnessPackage) : Prop :=
  C.compactnessClosed

theorem compactness_closed_from_evidence (C : CompactnessPackage) (E : CompactnessEvidence C) :
    CompactnessClosed C := by
  exact E.compactnessClosed

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse