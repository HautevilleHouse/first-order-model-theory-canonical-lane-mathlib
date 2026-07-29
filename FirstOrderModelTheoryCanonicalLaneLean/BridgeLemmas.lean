import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.SignatureAndStructures

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SignatureClosed (A.object : Signature)

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  A.object.conclusion

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse
