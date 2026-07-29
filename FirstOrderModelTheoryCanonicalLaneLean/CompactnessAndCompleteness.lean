import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.SignatureAndStructures

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure Theory (S : Signature) where
  sentences : List (S.relationSymbols → Prop)
  consistency : Prop

def TheoryClosed {S : Signature} (T : Theory S) : Prop :=
  T.consistency

structure CompactnessResult (S : Signature) where
  theory : Theory S
  finitelySatisfiable : Prop
  satisfiability : Prop
  compactnessWitness : finitelySatisfiable → satisfiability

structure CompletenessResult (S : Signature) where
  theory : Theory S
  syntacticConsistency : Prop
  semanticConsistency : Prop
  completenessWitness : syntacticConsistency → semanticConsistency

theorem compactness_closed_from_witness {S : Signature} (C : CompactnessResult S) :
    (C.finitelySatisfiable → C.satisfiability) :=
  C.compactnessWitness

theorem completeness_closed_from_witness {S : Signature} (C : CompletenessResult S) :
    (C.syntacticConsistency → C.semanticConsistency) :=
  C.completenessWitness

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse
