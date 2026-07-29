import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DistributionFunctionsAssociatedAdditivePositiveFoundation.DistributionFunctionDomain
import HautevilleHouse.DistributionFunctionsAssociatedAdditivePositiveFoundation.AdditivePositiveDistribution

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundation

structure PositiveAdditiveDecomposition (A : Type u) [Preorder A] where
  F : A → DistributionFunction ℝ
  additive : ∀ a b, F (a + b) = F a + F b
  positive : ∀ a, F a ≥ 0
  decomposition : ∀ a, ∃ f g : DistributionFunction ℝ, F a = f - g ∧ f ≥ 0 ∧ g ≥ 0

structure PositiveAdditiveDecompositionEvidence {A : Type u} [Preorder A]
    (D : PositiveAdditiveDecomposition A) where
  additiveClosed : D.additive
  positiveClosed : D.positive
  decompositionClosed : D.decomposition

def PositiveAdditiveDecompositionClosed {A : Type u} [Preorder A]
    (D : PositiveAdditiveDecomposition A) : Prop :=
  D.additive ∧ D.positive ∧ D.decomposition

theorem positive_additive_decomposition_closed_from_evidence
    {A : Type u} [Preorder A] (D : PositiveAdditiveDecomposition A)
    (E : PositiveAdditiveDecompositionEvidence D) :
    PositiveAdditiveDecompositionClosed D := by
  exact And.intro E.additiveClosed (And.intro E.positiveClosed E.decompositionClosed)

end DistributionFunctionsAssociatedAdditivePositiveFoundation
end HautevilleHouse