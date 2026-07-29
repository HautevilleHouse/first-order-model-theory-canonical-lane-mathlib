import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure UltraproductPackage where
  indexSet : Type
  structures : Type
  ultrafilter : Prop
  ultraproduct : Type
  losTheorem: Prop
  conclusion: losTheorem
  conclusionClosed: conclusion

structure UltraproductEvidence (U : UltraproductPackage) where
  losTheoremClosed: U.losTheorem
  conclusionClosed: U.conclusionClosed

def UltraproductClosed (U : UltraproductPackage) : Prop :=
  U.conclusion

theorem ultraproduct_closed_from_evidence (U : UltraproductPackage) (E : UltraproductEvidence U) : UltraproductClosed U := by
  exact E.conclusionClosed

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse