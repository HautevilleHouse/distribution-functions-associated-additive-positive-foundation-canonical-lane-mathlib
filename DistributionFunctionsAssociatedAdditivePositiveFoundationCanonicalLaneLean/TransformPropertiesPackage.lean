import DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean.DistributionMeasurePackage

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

structure TransformPropertiesPackage {A : AdmissibleClass}
    {P : AdditivePositiveFoundationPackage A}
    (M : DistributionMeasurePackage P) where
  fourierTransform : Type u
  laplaceTransform : Type v
  convolutionProduct : Type w
  fourierInversionAdmissible : Prop
  laplaceConvergenceDomain : Prop
  convolutionPreservesPositivity : Prop

structure TransformPropertiesEvidence {A : AdmissibleClass}
    {P : AdditivePositiveFoundationPackage A}
    {M : DistributionMeasurePackage P} (T : TransformPropertiesPackage M) where
  fourierInversionAdmissibleClosed : T.fourierInversionAdmissible
  laplaceConvergenceDomainClosed : T.laplaceConvergenceDomain
  convolutionPreservesPositivityClosed : T.convolutionPreservesPositivity

def TransformPropertiesClosed {A : AdmissibleClass}
    {P : AdditivePositiveFoundationPackage A}
    {M : DistributionMeasurePackage P} (T : TransformPropertiesPackage M) : Prop :=
  T.fourierInversionAdmissible ∧ T.laplaceConvergenceDomain ∧ T.convolutionPreservesPositivity

theorem transform_properties_closed_from_evidence
    {A : AdmissibleClass} {P : AdditivePositiveFoundationPackage A}
    {M : DistributionMeasurePackage P} (T : TransformPropertiesPackage M)
    (E : TransformPropertiesEvidence T) : TransformPropertiesClosed T := by
  exact And.intro E.fourierInversionAdmissibleClosed
    (And.intro E.laplaceConvergenceDomainClosed E.convolutionPreservesPositivityClosed)

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse
