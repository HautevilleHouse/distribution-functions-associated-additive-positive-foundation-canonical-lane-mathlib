import Mathlib

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

structure DistributionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DistributionAdmittedObject where
  space : DistributionSpace
  additivePositive : Prop
  foundationClosed : Prop
  conclusion : foundationClosed

structure DistributionEndgameState where
  object : DistributionAdmittedObject

def DistributionWitnessClosed (O : DistributionAdmittedObject) : Prop :=
  O.foundationClosed

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse