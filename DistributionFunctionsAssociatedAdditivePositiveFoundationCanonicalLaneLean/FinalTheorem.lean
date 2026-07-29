import canonicalLaneMathlib.AdmissibleClass
import DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

def ConstrainedDistributionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_distribution_endgame (A : AdmissibleClass) :
    ConstrainedDistributionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse