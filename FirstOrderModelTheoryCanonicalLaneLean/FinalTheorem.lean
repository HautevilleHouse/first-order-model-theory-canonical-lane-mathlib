import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

def ConstrainedModelTheoryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_model_theory_endgame (A : AdmissibleClass) :
    ConstrainedModelTheoryClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse
