import DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

structure AdditivePositiveFoundationPackage (A : AdmissibleClass) where
  distributionFunction : Type u
  additiveLaw : Type v
  positiveFoundation : Prop
  distributionDomainComplete : Prop
  additiveIdentityDefined : Prop
  positivityPreserving : Prop

structure AdditivePositiveFoundationEvidence {A : AdmissibleClass}
    (P : AdditivePositiveFoundationPackage A) where
  distributionDomainCompleteClosed : P.distributionDomainComplete
  additiveIdentityDefinedClosed : P.additiveIdentityDefined
  positivityPreservingClosed : P.positivityPreserving

def AdditivePositiveFoundationClosed {A : AdmissibleClass}
    (P : AdditivePositiveFoundationPackage A) : Prop :=
  P.distributionDomainComplete ∧ P.additiveIdentityDefined ∧ P.positivityPreserving

theorem additive_positive_foundation_closed_from_evidence
    {A : AdmissibleClass} (P : AdditivePositiveFoundationPackage A)
    (E : AdditivePositiveFoundationEvidence P) : AdditivePositiveFoundationClosed P := by
  exact And.intro E.distributionDomainCompleteClosed
    (And.intro E.additiveIdentityDefinedClosed E.positivityPreservingClosed)

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse
