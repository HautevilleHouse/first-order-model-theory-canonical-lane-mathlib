import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure LowenheimSkolemPackage where
  language : Type
  theory : Type
  infiniteModel : Prop
  cardinal : Type
  modelOfCardinal : Prop
  conclusion: infiniteModel → modelOfCardinal

structure LowenheimSkolemEvidence (L : LowenheimSkolemPackage) where
  infiniteModelClosed: L.infiniteModel
  modelOfCardinalClosed: L.modelOfCardinal
  conclusionClosed: L.conclusion

def LowenheimSkolemClosed (L : LowenheimSkolemPackage) : Prop :=
  L.conclusion

theorem lowenheim_skolem_closed_from_evidence (L : LowenheimSkolemPackage) (E : LowenheimSkolemEvidence L) : LowenheimSkolemClosed L := by
  exact E.conclusionClosed

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse