import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

structure AdditiveDistributionClass where
  carrier : Type u
  addition : carrier → carrier → carrier
  zero : carrier
  additiveSemigroupLaw : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  additiveIdentity : ∀ a : carrier, addition a zero = a ∧ addition zero a = a
  positiveCone : Set carrier
  positiveConeAdditive : ∀ a b, a ∈ positiveCone → b ∈ positiveCone → addition a b ∈ positiveCone
  distributionFunction : carrier → ℝ → ℝ
  distributionNondecreasing : ∀ a, Monotone (distributionFunction a)
  distributionRightContinuous : ∀ a, ∀ x, Filter.Tendsto (distributionFunction a) (𝓝 x) (𝓝 (distributionFunction a x))
  distributionLimitAtNegInf : ∀ a, Filter.Tendsto (distributionFunction a) Filter.atBot (𝓝 0)
  distributionLimitAtPosInf : ∀ a, Filter.Tendsto (distributionFunction a) Filter.atTop (𝓝 1)

structure AdditivePositiveFoundation where
  additiveStructure : AdditiveDistributionClass
  positiveFunction : additiveStructure.carrier → ℝ → ℝ
  positiveFunctionSupport : ∀ a, Set.Nonempty {x | positiveFunction a x > 0}
  additiveClosureUnderPositive : ∀ a b, positiveFunction (additiveStructure.addition a b) = λ x => positiveFunction a x + positiveFunction b x
  foundationAxiom : ∀ a, ∀ x, additiveStructure.distributionFunction a x = ∫ y in Set.Iic x, positiveFunction a y ∂ volume

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse