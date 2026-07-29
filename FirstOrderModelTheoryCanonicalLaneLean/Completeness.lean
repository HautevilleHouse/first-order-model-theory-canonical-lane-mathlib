import canonicalLaneMathlib.ModelTheory

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure ProofSystem where
  axioms : List String
  rules : List String
  sound : Prop
  complete : Prop

structure CompletenessPackage where
  system : ProofSystem
  soundClosed : system.sound
  completeClosed : system.complete

structure CompletenessEvidence (C : CompletenessPackage) where
  soundClosed : C.system.sound
  completeClosed : C.system.complete

def CompletenessClosed (C : CompletenessPackage) : Prop :=
  C.system.sound ∧ C.system.complete

theorem completeness_closed_from_evidence (C : CompletenessPackage) (E : CompletenessEvidence C) :
    CompletenessClosed C := by
  exact And.intro E.soundClosed E.completeClosed

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse