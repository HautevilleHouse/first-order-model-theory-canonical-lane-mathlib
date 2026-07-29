import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FirstOrderModelTheoryCanonicalLaneLean.LanguageSignature

namespace HautevilleHouse
namespace FirstOrderModelTheoryCanonicalLaneLean

structure Structure (L : Language) where
  Universe : Type u
  interpretFunction : (f : L.FunctionSymbols) → (L.arity (Sum.inl f) → Universe)
  interpretRelation : (r : L.RelationSymbols) → (L.arity (Sum.inr r) → Universe) → Prop

structure Model (L : Language) (T : Theory L) where
  structure : Structure L
  satisfiesAxioms : (φ : Formula L) → φ ∈ T.axioms → structure ⊨ φ

def StructureClosed (L : Language) (M : Structure L) : Prop := True

end FirstOrderModelTheoryCanonicalLaneLean
end HautevilleHouse