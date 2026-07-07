import VojtaConjectureCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace VojtaConjectureCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

end VojtaConjectureCanonicalLaneLean
end HautevilleHouse
