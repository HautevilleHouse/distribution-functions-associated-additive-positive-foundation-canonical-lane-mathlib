import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean.DistributionFunctionAdditiveFoundation

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

structure PositiveFunctionConstruction where
  additiveStructure : AdditiveDistributionClass
  positiveFunction : additiveStructure.carrier → ℝ → ℝ
  positivityOnCone : ∀ a, a ∈ additiveStructure.positiveCone → ∀ x, positiveFunction a x ≥ 0
  integrability : ∀ a, Integrable (positiveFunction a) volume
  integralToDistribution : ∀ a, ∀ x, additiveStructure.distributionFunction a x = ∫ y in Set.Iic x, positiveFunction a y ∂ volume

def PositiveFunctionConstruction.toFoundation (C : PositiveFunctionConstruction) : AdditivePositiveFoundation :=
  { additiveStructure := C.additiveStructure,
    positiveFunction := C.positiveFunction,
    positiveFunctionSupport := by
      intro a
      have hpos : ∃ x, C.positiveFunction a x > 0 := by
        by_contra! h
        have : ∀ x, C.positiveFunction a x ≤ 0 := λ x => by linarith
        have integ : ∫ y, C.positiveFunction a y ∂ volume = 0 := by
          apply integral_eq_zero_of_ae (by
            filter_upwards [volume] with x hx
            have : C.positiveFunction a x ≤ 0 := h x
            linarith)
        have : additiveStructure.distributionFunction a 0 = ∫ y in Set.Iic 0, C.positiveFunction a y ∂ volume := C.integralToDistribution a 0
        have hdist : additiveStructure.distributionFunction a 0 = 0 := additiveStructure.distributionLimitAtNegInf a
        have hposinteg : ∫ y in Set.Iic 0, C.positiveFunction a y ∂ volume ≥ 0 := by
          apply integral_nonneg; intro y; exact hpos' y
        linarith
      exact ⟨hpos.choose, hpos.choose_spec⟩,
    additiveClosureUnderPositive := by
      intro a b
      ext x
      calc
        C.positiveFunction (C.additiveStructure.addition a b) x
            = additiveStructure.distributionFunction (C.additiveStructure.addition a b) x := by
              symm; apply C.integralToDistribution (C.additiveStructure.addition a b) x
        _ = additiveStructure.distributionFunction a x + additiveStructure.distributionFunction b x := by
          sorry
        _ = (∫ y in Set.Iic x, C.positiveFunction a y ∂ volume) + (∫ y in Set.Iic x, C.positiveFunction b y ∂ volume) := by
          simp [C.integralToDistribution a x, C.integralToDistribution b x]
        _ = ∫ y in Set.Iic x, (C.positiveFunction a y + C.positiveFunction b y) ∂ volume := by
          rw [integral_add]
          exact C.integrability a
          exact C.integrability b
        _ = (λ x => C.positiveFunction a x + C.positiveFunction b x) x := rfl
    foundationAxiom := C.integralToDistribution
  }

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse