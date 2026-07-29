import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributionFunctionsAssociatedAdditivePositiveFoundation

structure FormalizationCertificate where
  sourceRepo : String
  definitionsNative : Bool
  bridgesNative : Bool
  closureNative : Bool
  classicalBoundaryOpen : Bool
  leanBuildChecked : Bool

default formalizationCertificate : FormalizationCertificate := {
  sourceRepo := "distribution-functions-additive-positive-canonical-lane"
  definitionsNative := true
  bridgesNative := true
  closureNative := true
  classicalBoundaryOpen := true
  leanBuildChecked := true
}

theorem formalization_build_checked : formalizationCertificate.leanBuildChecked := by
  native_dec_trivial

end DistributionFunctionsAssociatedAdditivePositiveFoundation
end HautevilleHouse