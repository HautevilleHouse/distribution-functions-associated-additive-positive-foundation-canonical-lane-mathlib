import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundation

structure DistributionAdmittedObject where
  space : DistributionFunctionSpace
  functional : AdditivePositiveFunctional space
  normalization : functional.functional (fun x => 1) = 1

structure AdmissibleClass where
  object : DistributionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.functional.functional (fun x => 1) = 1) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DistributionFunctionsAssociatedAdditivePositiveFoundation
end HautevilleHouse