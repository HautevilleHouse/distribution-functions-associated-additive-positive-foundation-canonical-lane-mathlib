import DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean.AdditivePositiveDistribution

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

structure PositiveOperatorKernel (A : AdmissibleClass) (D : AdditivePositiveDistribution A) where
  kernelFunction : ℝ → ℝ → ℝ
  positivity : ∀ x y, kernelFunction x y ≥ 0
  additivity : ∀ x y1 y2, kernelFunction x (y1 + y2) = kernelFunction x y1 + kernelFunction x y2
  positivityClosed : positivity
  additivityClosed : additivity

def PositiveOperatorKernelClosed (A : AdmissibleClass) (D : AdditivePositiveDistribution A) (K : PositiveOperatorKernel A D) : Prop :=
  K.positivity ∧ K.additivity

theorem positive_operator_kernel_closed_from_evidence (A : AdmissibleClass) (D : AdditivePositiveDistribution A) (K : PositiveOperatorKernel A D) :
    PositiveOperatorKernelClosed A D K := by
  exact And.intro K.positivityClosed K.additivityClosed

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse
