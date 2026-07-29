import canonicalLaneMathlib.Signature

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure Theory where
  sentences : List String
  consistent : Prop
  complete : Prop

structure TheoryPackage where
  theory : Theory
  consistentClosed : theory.consistent
  completeClosed : theory.complete

structure TheoryEvidence (T : TheoryPackage) where
  consistentClosed : T.theory.consistent
  completeClosed : T.theory.complete

def TheoryClosed (T : TheoryPackage) : Prop :=
  T.theory.consistent ∧ T.theory.complete

theorem theory_closed_from_evidence (T : TheoryPackage) (E : TheoryEvidence T) :
    TheoryClosed T := by
  exact And.intro E.consistentClosed E.completeClosed

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse