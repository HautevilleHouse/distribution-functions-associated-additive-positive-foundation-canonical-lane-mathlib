import canonicalLaneMathlib.AdmissibleClass
import DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean.DistributionFunctionsAdditiveFoundation

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  distributionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.additivePositiveAxiom A.object.positiveElement

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse