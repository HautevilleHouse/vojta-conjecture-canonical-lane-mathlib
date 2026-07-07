import VojtaConjectureCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace VojtaConjectureCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end VojtaConjectureCanonicalLaneLean
end HautevilleHouse
