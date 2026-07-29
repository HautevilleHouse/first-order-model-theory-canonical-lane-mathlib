import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure OEMinimalityPackage where
  language : Type u
  order : Type v
  theory : Prop
  oMinimalAxioms : Prop
  cellDecomposition : Prop

structure OEMinimalityEvidence (O : OEMinimalityPackage) where
  theoryClosed : O.theory
  oMinimalAxiomsClosed : O.oMinimalAxioms
  cellDecompositionClosed : O.cellDecomposition

def OEMinimalityClosed (O : OEMinimalityPackage) : Prop :=
  O.theory ∧ O.oMinimalAxioms ∧ O.cellDecomposition

theorem oeminimality_closed_from_evidence
    (O : OEMinimalityPackage) (E : OEMinimalityEvidence O) :
    OEMinimalityClosed O := by
  exact And.intro E.theoryClosed
    (And.intro E.oMinimalAxiomsClosed E.cellDecompositionClosed)

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse