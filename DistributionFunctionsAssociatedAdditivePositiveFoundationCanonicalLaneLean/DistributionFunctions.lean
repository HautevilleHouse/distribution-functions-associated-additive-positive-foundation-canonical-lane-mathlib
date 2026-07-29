import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundation

structure DistributionFunctionSpace where
  carrier : Type u
  measurableStructure : MeasurableSpace carrier
  positiveMeasure : Measure carrier

definition PositiveBasis : Prop := ∀ (f : carrier → ℝ), f ≥ 0 → ∫ x, f x ∂positiveMeasure > 0

structure AdditivePositiveFunctional (X : DistributionFunctionSpace) where
  functional : (X.carrier → ℝ) → ℝ
  linear : ∀ f g, functional (f + g) = functional f + functional g
  positive : ∀ f, f ≥ 0 → functional f ≥ 0
  continuous : TopologicalSpace (X.carrier → ℝ) → Continuous functional

end DistributionFunctionsAssociatedAdditivePositiveFoundation
end HautevilleHouse