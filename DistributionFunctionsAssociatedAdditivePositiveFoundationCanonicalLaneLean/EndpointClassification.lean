import DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean.TransformPropertiesPackage

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

structure EndpointClassificationPackage {A : AdmissibleClass}
    {P : AdditivePositiveFoundationPackage A}
    {M : DistributionMeasurePackage P}
    (T : TransformPropertiesPackage M) where
  positiveDefiniteFunctionClassified : Prop
  bochnerTheoremApplicable : Prop
  levyContinuityOk : Prop
  endpointMatchesAdditivePositiveStatement : Prop

structure EndpointClassificationEvidence {A : AdmissibleClass}
    {P : AdditivePositiveFoundationPackage A}
    {M : DistributionMeasurePackage P}
    {T : TransformPropertiesPackage M}
    (Epkg : EndpointClassificationPackage T) where
  positiveDefiniteFunctionClassifiedClosed : Epkg.positiveDefiniteFunctionClassified
  bochnerTheoremApplicableClosed : Epkg.bochnerTheoremApplicable
  levyContinuityOkClosed : Epkg.levyContinuityOk
  endpointMatchesAdditivePositiveStatementClosed : Epkg.endpointMatchesAdditivePositiveStatement

def EndpointClassificationClosed {A : AdmissibleClass}
    {P : AdditivePositiveFoundationPackage A}
    {M : DistributionMeasurePackage P}
    {T : TransformPropertiesPackage M}
    (Epkg : EndpointClassificationPackage T) : Prop :=
  Epkg.positiveDefiniteFunctionClassified ∧ Epkg.bochnerTheoremApplicable ∧
  Epkg.levyContinuityOk ∧ Epkg.endpointMatchesAdditivePositiveStatement

theorem endpoint_classification_closed_from_evidence
    {A : AdmissibleClass} {P : AdditivePositiveFoundationPackage A}
    {M : DistributionMeasurePackage P} {T : TransformPropertiesPackage M}
    (Epkg : EndpointClassificationPackage T) (E : EndpointClassificationEvidence Epkg) :
    EndpointClassificationClosed Epkg := by
  exact And.intro E.positiveDefiniteFunctionClassifiedClosed
    (And.intro E.bochnerTheoremApplicableClosed
      (And.intro E.levyContinuityOkClosed E.endpointMatchesAdditivePositiveStatementClosed))

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse
