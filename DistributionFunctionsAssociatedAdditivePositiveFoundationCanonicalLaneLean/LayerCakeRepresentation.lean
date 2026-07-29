import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DistributionFunctionsAssociatedAdditivePositiveFoundation.DistributionFunctionDomain

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundation

structure LayerCakeRepresentation (F : DistributionFunction ℝ) where
  integralRepr : (∫ t in Set.Ioi 0, (F (x - t) - F (-t)) w) = F x - F 0
  kernel : ℝ → ℝ → ℝ
  kernelMeasurable : Measurable (uncurry kernel)
  integralFormula : ∀ x, F x = ∫ t, kernel x t

structure LayerCakeEvidence (F : DistributionFunction ℝ) (L : LayerCakeRepresentation F) where
  integralReprClosed : L.integralRepr
  kernelMeasurableClosed : L.kernelMeasurable
  integralFormulaClosed : L.integralFormula

def LayerCakeClosed (F : DistributionFunction ℝ) (L : LayerCakeRepresentation F) : Prop :=
  L.integralRepr ∧ L.kernelMeasurable ∧ L.integralFormula

theorem layer_cake_closed_from_evidence (F : DistributionFunction ℝ) (L : LayerCakeRepresentation F)
    (E : LayerCakeEvidence F L) : LayerCakeClosed F L := by
  exact And.intro E.integralReprClosed (And.intro E.kernelMeasurableClosed E.integralFormulaClosed)

end DistributionFunctionsAssociatedAdditivePositiveFoundation
end HautevilleHouse