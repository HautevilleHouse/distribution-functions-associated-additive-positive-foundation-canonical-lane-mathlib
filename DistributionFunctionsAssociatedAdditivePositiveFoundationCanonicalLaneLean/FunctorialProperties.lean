import canonicalLaneMathlib.AdmissibleClass
import DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean.DistributionFunctionsAdditiveFoundation

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean

structure AdditiveDistributionMorphism (A B : DistributionAdmittedObject) where
  map : A.carrier → B.carrier
  respectsAdditive : ∀ x y : A.carrier, map (A.additiveOperation x y) = B.additiveOperation (map x) (map y)
  preservesDistribution : ∀ x : A.carrier, A.distributionFunction x = B.distributionFunction (map x)

structure AdditiveDistributionCategory where
  objects : Type u₁
  morphisms : (A B : objects) → Type u₂
  identity : (A : objects) → morphisms A A
  compose : {A B C : objects} → morphisms A B → morphisms B C → morphisms A C
  identityLaw : ∀ (A : objects) (f : morphisms A A), compose (identity A) f = f
  compositionLaw : ∀ (A B C D : objects) (f : morphisms A B) (g : morphisms B C) (h : morphisms C D), compose (compose f g) h = compose f (compose g h)

def additiveDistributionCategoryInstance : AdditiveDistributionCategory := {
  objects := DistributionAdmittedObject
  morphisms := λ A B => AdditiveDistributionMorphism A B
  identity := λ A => {
    map := λ x => x
    respectsAdditive := λ x y => rfl
    preservesDistribution := λ x => rfl
  }
  compose := λ f g => {
    map := λ x => g.map (f.map x)
    respectsAdditive := λ x y => by
      calc
        g.map (f.map (A.additiveOperation x y)) = g.map (B.additiveOperation (f.map x) (f.map y)) := by rw [f.respectsAdditive x y]
        _ = C.additiveOperation (g.map (f.map x)) (g.map (f.map y)) := g.respectsAdditive (f.map x) (f.map y)
    preservesDistribution := λ x => by
      calc
        A.distributionFunction x = B.distributionFunction (f.map x) := f.preservesDistribution x
        _ = C.distributionFunction (g.map (f.map x)) := g.preservesDistribution (f.map x)
  }
  identityLaw := λ A f => rfl
  compositionLaw := λ A B C D f g h => rfl
}

end DistributionFunctionsAssociatedAdditivePositiveFoundationCanonicalLaneLean
end HautevilleHouse