import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DistributionFunctionsAssociatedAdditivePositiveFoundation.DistributionFunctionDomain

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundation

structure AdditivePositiveDistributionPackage {A : Type u} (base : AdditivePositiveBase A) where
  space : A → Set ℝ
  distribution : (a : A) → DistributionFunction ℝ
  additivity : ∀ a b, pos base.add a b → space (base.add a b) = space a ∩ space b
  positivity : ∀ a, pos base a → distribution a = DistributionFunction.where (λ x => if x ≥ 0 then 1 else 0)

structure AdditivePositiveDistributionEvidence {A : Type u} {base : AdditivePositiveBase A}
    (P : AdditivePositiveDistributionPackage base) where
  additivityClosed : P.additivity
  positivityClosed : P.positivity

def AdditivePositiveDistributionClosed {A : Type u} {base : AdditivePositiveBase A}
    (P : AdditivePositiveDistributionPackage base) : Prop :=
  P.additivity ∧ P.positivity

theorem additive_positive_distribution_closed_from_evidence
    {A : Type u} {base : AdditivePositiveBase A}
    (P : AdditivePositiveDistributionPackage base)
    (E : AdditivePositiveDistributionEvidence P) :
    AdditivePositiveDistributionClosed P := by
  exact And.intro E.additivityClosed E.positivityClosed

end DistributionFunctionsAssociatedAdditivePositiveFoundation
end HautevilleHouse