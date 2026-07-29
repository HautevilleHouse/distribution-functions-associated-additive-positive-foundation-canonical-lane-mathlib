import canonicalLaneMathlib.AdmissibleClass
import DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean.DistributionFunctionsAdditiveFoundation

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

structure AdditiveDecomposition (A : DistributionAdmittedObject) where
  component₁ : A.carrier
  component₂ : A.carrier
  decompositionIdentity : A.additiveOperation component₁ component₂ = A.positiveElement
  distributionIndependence : A.distributionFunction component₁ * A.distributionFunction component₂ = A.distributionFunction A.positiveElement

structure AdditiveDecompositionEvidence (A : DistributionAdmittedObject) (D : AdditiveDecomposition A) where
  decompositionIdentityClosed : D.decompositionIdentity
  distributionIndependenceClosed : D.distributionIndependence

def AdditiveDecompositionClosed (A : DistributionAdmittedObject) (D : AdditiveDecomposition A) : Prop :=
  D.decompositionIdentity ∧ D.distributionIndependence

theorem additive_decomposition_closed_from_evidence (A : DistributionAdmittedObject) (D : AdditiveDecomposition A) (E : AdditiveDecompositionEvidence A D) :
    AdditiveDecompositionClosed A D := by
  exact And.intro E.decompositionIdentityClosed E.distributionIndependenceClosed

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse