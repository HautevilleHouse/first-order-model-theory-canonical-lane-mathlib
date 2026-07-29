import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure ModelCompanionshipPackage where
  language : Type u
  theory : Prop
  modelCompanion : Prop
  existentiallyClosedModels : Prop
  amalgamationProperty : Prop

structure ModelCompanionshipEvidence (M : ModelCompanionshipPackage) where
  theoryClosed : M.theory
  modelCompanionClosed : M.modelCompanion
  existentiallyClosedModelsClosed : M.existentiallyClosedModels
  amalgamationPropertyClosed : M.amalgamationProperty

def ModelCompanionshipClosed (M : ModelCompanionshipPackage) : Prop :=
  M.theory ∧ M.modelCompanion ∧ M.existentiallyClosedModels ∧ M.amalgamationProperty

theorem model_companionship_closed_from_evidence
    (M : ModelCompanionshipPackage) (E : ModelCompanionshipEvidence M) :
    ModelCompanionshipClosed M := by
  exact And.intro E.theoryClosed
    (And.intro E.modelCompanionClosed
      (And.intro E.existentiallyClosedModelsClosed E.amalgamationPropertyClosed))

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse