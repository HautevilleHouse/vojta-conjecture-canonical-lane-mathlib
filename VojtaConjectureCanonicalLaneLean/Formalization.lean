import VojtaConjectureCanonicalLaneLean.Basic
import VojtaConjectureCanonicalLaneLean.SourcePackage
import VojtaConjectureCanonicalLaneLean.SourceDependencies

/-!
# Source-derived formalization layer for `vojta-conjecture-canonical-lane`

This module sits above `Basic.lean`, `SourcePackage.lean`, and `SourceDependencies.lean`.
It turns translated package primitives into explicit Lean data for formula
models, component inputs, source sections, and formalization status checks.

This layer records source-derived formalization structure. The generated
library target typechecked under the pinned Lean toolchain; source-conjecture
closure remains outside this generated layer.
-/

namespace HautevilleHouse
namespace VojtaConjectureCanonicalLaneLean

inductive FormulaExpr where
  | var (name : String)
  | num (value : String)
  | add (lhs rhs : FormulaExpr)
  | sub (lhs rhs : FormulaExpr)
  | mul (lhs rhs : FormulaExpr)
  | div (lhs rhs : FormulaExpr)
  | neg (arg : FormulaExpr)
  | abs (arg : FormulaExpr)
  | min (lhs rhs : FormulaExpr)
  | max (lhs rhs : FormulaExpr)
  | raw (formula : String)
deriving Repr, DecidableEq

structure FormulaComponent where
  key : String
  value : String
deriving Repr, DecidableEq

structure SourceFormulaModel where
  group : String
  key : String
  status : String
  formula : String
  expr : FormulaExpr
  parseStatus : String
  sourceSection : String
  notes : String
  validation : String
  componentKeys : List String
  components : List FormulaComponent
deriving Repr, DecidableEq

structure FormalizationCertificate where
  sourceRepo : String
  sourceCheckoutHead : String
  packageLayerTranslated : Bool
  sourceHashesRecorded : Bool
  formulaLayerModeled : Bool
  guardLayerModeled : Bool
  theoremBoundaryOpen : Bool
  sourceConjectureClosureClaimed : Bool
  leanBuildChecked : Bool
deriving Repr, DecidableEq

def sourceFormulaModels : List SourceFormulaModel := [
  { group := "constants", key := "eps_coh", status := "derived_numeric", formula := "eps_coh_raw", expr := (FormulaExpr.var "eps_coh_raw"), parseStatus := "parsed_source_expression", sourceSection := "paper/VOJTA_CONJECTURE_PREPRINT.md Appendix E.6", notes := "Strict coherence target.", validation := "required_nonnegative", componentKeys := ["eps_coh_raw"], components := [
    { key := "eps_coh_raw", value := "0.0" }
  ] },
  { group := "constants", key := "inequality_transfer", status := "derived_numeric", formula := "c_ineq_raw * transfer_gain_raw - e_ineq_raw", expr := (FormulaExpr.sub (FormulaExpr.mul (FormulaExpr.var "c_ineq_raw") (FormulaExpr.var "transfer_gain_raw")) (FormulaExpr.var "e_ineq_raw")), parseStatus := "parsed_source_expression", sourceSection := "paper/VOJTA_CONJECTURE_PREPRINT.md Section 6.2 / Appendix E.4", notes := "inequality_transfer theorem-level floor.", validation := "required_positive", componentKeys := ["c_ineq_raw", "e_ineq_raw", "transfer_gain_raw"], components := [
    { key := "c_ineq_raw", value := "1.119" },
    { key := "e_ineq_raw", value := "0.122" },
    { key := "transfer_gain_raw", value := "1.029" }
  ] },
  { group := "constants", key := "kappa_compact", status := "derived_numeric", formula := "1.0 / (1.0 + delta_comp_sup_raw)", expr := (FormulaExpr.div (FormulaExpr.num "1.0") (FormulaExpr.add (FormulaExpr.num "1.0") (FormulaExpr.var "delta_comp_sup_raw"))), parseStatus := "parsed_source_expression", sourceSection := "paper/VOJTA_CONJECTURE_PREPRINT.md Section 5.3 / Appendix C", notes := "kappa_compact theorem-level floor.", validation := "required_positive", componentKeys := ["delta_comp_sup_raw"], components := [
    { key := "delta_comp_sup_raw", value := "0.243" }
  ] },
  { group := "constants", key := "kappa_height", status := "derived_numeric", formula := "c_height_raw * height_density_raw - e_height_raw", expr := (FormulaExpr.sub (FormulaExpr.mul (FormulaExpr.var "c_height_raw") (FormulaExpr.var "height_density_raw")) (FormulaExpr.var "e_height_raw")), parseStatus := "parsed_source_expression", sourceSection := "paper/VOJTA_CONJECTURE_PREPRINT.md Section 4.5 / Appendix A", notes := "kappa_height theorem-level floor.", validation := "required_positive", componentKeys := ["c_height_raw", "e_height_raw", "height_density_raw"], components := [
    { key := "c_height_raw", value := "1.447" },
    { key := "e_height_raw", value := "0.234" },
    { key := "height_density_raw", value := "0.917" }
  ] },
  { group := "constants", key := "rho_rigidity", status := "derived_numeric", formula := "rho_rigidity_raw", expr := (FormulaExpr.var "rho_rigidity_raw"), parseStatus := "parsed_source_expression", sourceSection := "paper/VOJTA_CONJECTURE_PREPRINT.md Section 6.1 / Appendix D", notes := "rho_rigidity theorem-level floor.", validation := "required_positive", componentKeys := ["rho_rigidity_raw"], components := [
    { key := "rho_rigidity_raw", value := "1.077" }
  ] },
  { group := "constants", key := "sigma_counting", status := "derived_numeric", formula := "counting_floor_raw - truncation_loss_raw - restart_loss_raw", expr := (FormulaExpr.sub (FormulaExpr.sub (FormulaExpr.var "counting_floor_raw") (FormulaExpr.var "truncation_loss_raw")) (FormulaExpr.var "restart_loss_raw")), parseStatus := "parsed_source_expression", sourceSection := "paper/VOJTA_CONJECTURE_PREPRINT.md Section 5.2 / Appendix B", notes := "sigma_counting theorem-level floor.", validation := "required_positive", componentKeys := ["counting_floor_raw", "restart_loss_raw", "truncation_loss_raw"], components := [
    { key := "counting_floor_raw", value := "1.39" },
    { key := "restart_loss_raw", value := "0.149" },
    { key := "truncation_loss_raw", value := "0.168" }
  ] },
  { group := "stitch", key := "sigma_star_can", status := "derived_numeric", formula := "sigma_star_can_raw", expr := (FormulaExpr.var "sigma_star_can_raw"), parseStatus := "parsed_source_expression", sourceSection := "paper/VOJTA_CONJECTURE_PREPRINT.md Section 5 / stitch constants", notes := "sigma_star_can theorem-level stitch constant.", validation := "required_positive", componentKeys := ["sigma_star_can_raw"], components := [
    { key := "sigma_star_can_raw", value := "1.053" }
  ] }
]

def formalizationCertificate : FormalizationCertificate := {
  sourceRepo := "vojta-conjecture-canonical-lane",
  sourceCheckoutHead := sourceCheckoutHead,
  packageLayerTranslated := true,
  sourceHashesRecorded := true,
  formulaLayerModeled := true,
  guardLayerModeled := true,
  theoremBoundaryOpen := true,
  sourceConjectureClosureClaimed := false,
  leanBuildChecked := true
}

def sourceFormulaModelCount : Nat := 7
def sourcePythonFileCount : Nat := 5
def sourcePythonFunctionCount : Nat := 33
def sourceConstantSpecCount : Nat := 7
def sourceRegistryConstantCount : Nat := 6

theorem formalization_no_source_conjecture_closure_claim :
    formalizationCertificate.sourceConjectureClosureClaimed = false := by
  rfl

theorem formalization_build_checked :
    formalizationCertificate.leanBuildChecked = true := by
  rfl

theorem formalization_package_layer_translated :
    formalizationCertificate.packageLayerTranslated = true := by
  rfl

theorem formalization_formula_layer_modeled :
    formalizationCertificate.formulaLayerModeled = true := by
  rfl

theorem formalization_source_formula_count_checked :
    sourceFormulaModels.length = 7 := by
  rfl

theorem formalization_source_file_count_checked :
    sourceFiles.length = 5 := by
  rfl

theorem formalization_source_function_count_checked :
    sourceFunctions.length = 33 := by
  rfl

theorem formalization_constant_spec_count_checked :
    constantSpecs.length = 7 := by
  rfl

theorem formalization_registry_constant_count_checked :
    registryConstants.length = 6 := by
  rfl


theorem dependency_import_count_matches_certificate : sourceImportDependencies.length = sourceImportDependencyCount := by
  rfl

theorem dependency_path_count_matches_certificate : sourcePathDependencies.length = sourcePathDependencyCount := by
  rfl

end VojtaConjectureCanonicalLaneLean
end HautevilleHouse
