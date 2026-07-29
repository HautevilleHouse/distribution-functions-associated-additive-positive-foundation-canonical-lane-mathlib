import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

structure DistributionAdmittedObject where
  carrier : Type u
  additiveOperation : carrier → carrier → carrier
  positiveElement : carrier
  distributionFunction : carrier → ℝ
  additivePositiveAxiom : ∀ x : carrier, distributionFunction (additiveOperation x positiveElement) = distributionFunction x
  positiveClosure : distributionFunction positiveElement = 1

structure AdmissibleClass where
  object : DistributionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  distributionWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def distributionWitnessClosed (O : DistributionAdmittedObject) : Prop :=
  O.additivePositiveAxiom O.positiveElement

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse