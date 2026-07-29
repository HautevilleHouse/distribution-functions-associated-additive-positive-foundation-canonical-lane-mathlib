import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundation

structure AdditivePositiveBase (A : Type u) where
  zero : A
  add : A → A → A
  pos : A → Prop
  posZero : pos zero
  posAdd : ∀ x y, pos x → pos y → pos (add x y)
  addAssoc : ∀ x y z, add (add x y) z = add x (add y z)
  addComm : ∀ x y, add x y = add y x
  zeroAdd : ∀ x, add zero x = x

section distribution

structure DistributionFunction (α : Type u) [Preorder α] where
  domain : Set α
  F : α → ℝ
  nondecreasing : ∀ a b, a ≤ b → F a ≤ F b
  rightContinuous : ∀ a, Filter.Tendsto F (𝓝[≥] a) (𝓝 (F a))
  limitZero : Filter.Tendsto F (Filter.atBot : Filter α) (𝓝 0)
  limitOne : Filter.Tendsto F (Filter.atTop : Filter α) (𝓝 1)

end distribution

end DistributionFunctionsAssociatedAdditivePositiveFoundation
end HautevilleHouse