import DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean.AdditivePositiveFoundationPackage

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

structure DistributionMeasurePackage {A : AdmissibleClass}
    (P : AdditivePositiveFoundationPackage A) where
  measureSpace : Type u
  sigmaAlgebra : Set (Set (measureSpace))
  distributionMeasure : measureSpace → ℝ
  measurePositivity : Prop
  measureAdditivity : Prop
  measurePositiveOnNonempty : Prop

structure DistributionMeasureEvidence {A : AdmissibleClass}
    {P : AdditivePositiveFoundationPackage A} (M : DistributionMeasurePackage P) where
  measurePositivityClosed : M.measurePositivity
  measureAdditivityClosed : M.measureAdditivity
  measurePositiveOnNonemptyClosed : M.measurePositiveOnNonempty

def DistributionMeasureClosed {A : AdmissibleClass}
    {P : AdditivePositiveFoundationPackage A} (M : DistributionMeasurePackage P) : Prop :=
  M.measurePositivity ∧ M.measureAdditivity ∧ M.measurePositiveOnNonempty

theorem distribution_measure_closed_from_evidence
    {A : AdmissibleClass} {P : AdditivePositiveFoundationPackage A}
    (M : DistributionMeasurePackage P) (E : DistributionMeasureEvidence M) :
    DistributionMeasureClosed M := by
  exact And.intro E.measurePositivityClosed
    (And.intro E.measureAdditivityClosed E.measurePositiveOnNonemptyClosed)

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse
