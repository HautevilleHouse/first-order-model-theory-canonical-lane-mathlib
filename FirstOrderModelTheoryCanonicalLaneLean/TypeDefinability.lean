import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure TypeDefinabilityPackage where
  language : Type u
  model : Type v
  partialType : Prop
  definableSet : Prop
  typeDefinableEquivalence : Prop

structure TypeDefinabilityEvidence (T : TypeDefinabilityPackage) where
  partialTypeClosed : T.partialType
  definableSetClosed : T.definableSet
  typeDefinableEquivalenceClosed : T.typeDefinableEquivalence

def TypeDefinabilityClosed (T : TypeDefinabilityPackage) : Prop :=
  T.partialType ∧ T.definableSet ∧ T.typeDefinableEquivalence

theorem type_definability_closed_from_evidence
    (T : TypeDefinabilityPackage) (E : TypeDefinabilityEvidence T) :
    TypeDefinabilityClosed T := by
  exact And.intro E.partialTypeClosed
    (And.intro E.definableSetClosed E.typeDefinableEquivalenceClosed)

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse