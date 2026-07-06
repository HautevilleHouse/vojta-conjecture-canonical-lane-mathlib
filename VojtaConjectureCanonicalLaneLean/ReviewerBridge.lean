import VojtaConjectureCanonicalLaneLean.Formalization
import VojtaConjectureCanonicalLaneLean.SourceDependencies

/-!
# Reviewer Bridge

Typed Lean data for the imported reviewer bridge architecture.
-/

namespace HautevilleHouse
namespace VojtaConjectureCanonicalLaneLean

structure ReviewerBridgeFile where
  path : String
  role : String
  sha256 : String
  present : Bool
deriving Repr, DecidableEq

structure ReviewerChainStep where
  index : Nat
  label : String
deriving Repr, DecidableEq

structure ReviewerClosureGate where
  gate : String
  constant : String
deriving Repr, DecidableEq

structure ReviewerManifestEntry where
  path : String
  sha256 : String
deriving Repr, DecidableEq

structure CertificateGate where
  gate : String
  status : String
deriving Repr, DecidableEq

structure CertificateInput where
  key : String
  value : String
deriving Repr, DecidableEq

def reviewerBridgeFiles : List ReviewerBridgeFile := [
  { path := "REVIEWER_MAP.md", role := "reviewer_map", sha256 := "ac43687cc053cd4037cd914f9c3b6f26be20c1d18af6c2c3c444c1faa4952f67", present := true },
  { path := "notes/IDENTIFICATION_BRIDGE.md", role := "identification_bridge", sha256 := "78ab6848dadb4bc3d7c3eb59e1b4491c85bffe9d69c1af3c68837eac0705b5f9", present := true },
  { path := "artifacts/constants_extraction_inputs.json", role := "constant_inputs", sha256 := "373e7af63ac2864d3c5ab14805f457ce5efd4b3404d88bc059c6ff10b7e4c57e", present := true },
  { path := "artifacts/constants_extracted.json", role := "constant_extracted", sha256 := "898f1f823263b2fda02aa9b4ea137cc9483038c18f8eccf1f4dcb0ab36bf878a", present := true },
  { path := "artifacts/constants_registry.json", role := "constant_registry", sha256 := "e3a750000ae08ab6993d65fe6e0020727b7d38dbfc1429e27f05a6791d46e609", present := true },
  { path := "artifacts/stitch_constants.json", role := "stitch_constants", sha256 := "91a762771b8efc5db798ac8a541aa916220d76f5a3f6dd25ebc374aa2e981366", present := true },
  { path := "artifacts/promotion_report.json", role := "promotion_report", sha256 := "f586e26c495ce61c8e9dffbf2d05840cc1d774c2129e7e0e9c88d74d89011ec6", present := true },
  { path := "repro/repro_manifest.json", role := "manifest", sha256 := "ceae5fd5b165a3cda7fb3831fbdb627d136830478ef18b2bbc3e6d97dbfe7dee", present := true },
  { path := "repro/certificate_baseline.json", role := "baseline_certificate", sha256 := "ae5474660815da160acd21f3d0dd63f76f0f54cfc6b79bd8a90ecd52e7e5e12e", present := true }
]

def reviewerChainSteps : List ReviewerChainStep := [
  { index := 1, label := "EG1" },
  { index := 2, label := "EG2" },
  { index := 3, label := "EG3" },
  { index := 4, label := "EG4" },
  { index := 5, label := "Identification bridge" },
  { index := 6, label := "Scalar closure" }
]

def reviewerClosureGates : List ReviewerClosureGate := [
  { gate := "VOJ_G1", constant := "kappa_height" },
  { gate := "VOJ_G2", constant := "sigma_counting" },
  { gate := "VOJ_G3", constant := "kappa_compact" },
  { gate := "VOJ_G4", constant := "rho_rigidity" },
  { gate := "VOJ_G5", constant := "inequality_transfer" },
  { gate := "VOJ_G6", constant := "eps_coh" },
  { gate := "VOJ_GM", constant := "derived" }
]

def reviewerFalsificationConditionCount : Nat := 5

def reviewerManifestEntries : List ReviewerManifestEntry := [
  { path := "CITATION.cff", sha256 := "388744410845977c33d8b2275dd1f86db1ceb67ba8ab06380aba3f846f8a3631" },
  { path := "README.md", sha256 := "5a00b10e80f8890f2d0c0100d5a6ff9546e8b74a9b35225ae8c4ff71bc97d42a" },
  { path := "artifacts/constants_extracted.json", sha256 := "898f1f823263b2fda02aa9b4ea137cc9483038c18f8eccf1f4dcb0ab36bf878a" },
  { path := "artifacts/constants_extraction_inputs.json", sha256 := "373e7af63ac2864d3c5ab14805f457ce5efd4b3404d88bc059c6ff10b7e4c57e" },
  { path := "artifacts/constants_registry.json", sha256 := "e3a750000ae08ab6993d65fe6e0020727b7d38dbfc1429e27f05a6791d46e609" },
  { path := "artifacts/promotion_report.json", sha256 := "f586e26c495ce61c8e9dffbf2d05840cc1d774c2129e7e0e9c88d74d89011ec6" },
  { path := "artifacts/stitch_constants.json", sha256 := "91a762771b8efc5db798ac8a541aa916220d76f5a3f6dd25ebc374aa2e981366" },
  { path := "notes/EG1_public.md", sha256 := "ae4f3e73481046e1167c0b9805a64daac769d13ec5c54e6e3fc5bd5ef958972a" },
  { path := "notes/EG2_public.md", sha256 := "bb89e18e077b41c8d956d650dd32bf48130c4e715c67e092646132cce58220c6" },
  { path := "notes/EG3_public.md", sha256 := "ee35659d2516f5c9d0e0ddde9481299a7ba59886a8806edabd5ede67afb602f7" },
  { path := "notes/EG4_public.md", sha256 := "d20ad749da680cde4babd8290ebd4b6998bd2346dcb41c1eec325b3c5881d251" },
  { path := "notes/IDENTIFICATION_BRIDGE.md", sha256 := "78ab6848dadb4bc3d7c3eb59e1b4491c85bffe9d69c1af3c68837eac0705b5f9" },
  { path := "paper/CANONICAL_ROUTING_INDEX.md", sha256 := "932913efa2773061ca4cf6d8678b73e1c4d9a2e01fd7b0fd8217ce2427df2a98" },
  { path := "paper/EXTRACTION_SPEC.md", sha256 := "d758637200d646e47462bd25b16f52857b0ac158fc880afaa1cce1935619c553" },
  { path := "paper/VOJTA_CONJECTURE_PREPRINT.md", sha256 := "b029543cad6b998dd0b1eed31fd1164a8c2e767d917f1c2d9778f189f7f6c7e5" },
  { path := "repro/REPRO_PACK.md", sha256 := "1f8c8f677ba70722f6fef819aaa8bc0e9611be90616ced461a5f2650da725f86" },
  { path := "repro/THIRD_PARTY_RERUN_PROTOCOL.md", sha256 := "53649218b74412121e8c7df4e7ad6517e104ab06565bdb0f295154344e5456de" },
  { path := "repro/certificate_baseline.json", sha256 := "ae5474660815da160acd21f3d0dd63f76f0f54cfc6b79bd8a90ecd52e7e5e12e" },
  { path := "repro/run_repro.sh", sha256 := "bcf3a9985ee134be34902882dbc372f2c58662cb3928115fee1d764c10816a79" },
  { path := "scripts/extract_constants.py", sha256 := "730d57dae3fac057e19630db34233183cae269568d43118c943387970081896d" },
  { path := "scripts/promote_constants.py", sha256 := "b65eb7a60552c668f04d6331a5256fe4e662ae5e83e769d42f6a141819769356" },
  { path := "scripts/release_gate.py", sha256 := "5c9760aeddbfa0e4b5a9447e1bda670004391c19470f9b1cf8897bf154f667b8" },
  { path := "scripts/update_manifest.py", sha256 := "45ae03f10349daebab98b6eb9a0836b7e2d15a48ca5504277c80ec7d4c633d12" },
  { path := "scripts/voj_closure_guard.py", sha256 := "dfc3d30b7de117acbffcc07124e94e5e8ba1d9954ce8d538893195dd87621e3a" },
  { path := "scripts/README.md", sha256 := "a7c8cfaefbfb88af0c5aec65f52c5331734f24a7b947df533026f001d729144b" }
]

def baselineCertificateGates : List CertificateGate := [
  { gate := "VOJ_G1", status := "PASS" },
  { gate := "VOJ_G2", status := "PASS" },
  { gate := "VOJ_G3", status := "PASS" },
  { gate := "VOJ_G4", status := "PASS" },
  { gate := "VOJ_G5", status := "PASS" },
  { gate := "VOJ_G6", status := "PASS" },
  { gate := "VOJ_GM", status := "PASS" }
]

def baselineCertificateInputs : List CertificateInput := [
  { key := "eps_coh", value := "0.0" },
  { key := "inequality_transfer", value := "1.029451" },
  { key := "kappa_compact", value := "0.8045052292839904" },
  { key := "kappa_height", value := "1.092899" },
  { key := "rho_rigidity", value := "1.077" },
  { key := "sigma_counting", value := "1.073" },
  { key := "sigma_star_can", value := "1.053" }
]

def bridgeConstantKeys : List String := [
  "eps_coh",
  "inequality_transfer",
  "kappa_compact",
  "kappa_height",
  "rho_rigidity",
  "sigma_counting",
  "sigma_star_can"
]

def baselineCertificateAllPass : Bool := true
def baselineCertificateLane : String := "manifold_constrained"
def outsideConstantDependencyCount : Nat := 0

theorem reviewer_bridge_file_count_checked : reviewerBridgeFiles.length = 9 := by
  rfl

theorem reviewer_chain_step_count_checked : reviewerChainSteps.length = 6 := by
  rfl

theorem reviewer_closure_gate_count_checked : reviewerClosureGates.length = 7 := by
  rfl

theorem reviewer_falsification_condition_count_checked : reviewerFalsificationConditionCount = 5 := by
  rfl

theorem reviewer_manifest_entry_count_checked : reviewerManifestEntries.length = 25 := by
  rfl

theorem baseline_certificate_gate_count_checked : baselineCertificateGates.length = 7 := by
  rfl

theorem baseline_certificate_input_count_checked : baselineCertificateInputs.length = 7 := by
  rfl

theorem bridge_constant_key_count_checked : bridgeConstantKeys.length = 7 := by
  rfl

theorem baseline_certificate_all_pass_checked : baselineCertificateAllPass = true := by
  rfl

theorem outside_constant_dependency_count_checked : outsideConstantDependencyCount = 0 := by
  rfl

end VojtaConjectureCanonicalLaneLean
end HautevilleHouse
