#----------------------------------------------------------------------------------------------------
#' @import methods
#' @import TrenaProject
#' @importFrom AnnotationDbi select
#' @import org.Hs.eg.db
#'
#' @title TrenaProjectMouseMacrophage-class
#'
#' @name TrenaProjectMouseMacrophage-class
#' @rdname TrenaProjectMouseMacrophage-class
#' @aliases TrenaProjectMouseMacrophage
#' @exportClass TrenaProjectMouseMacrophage
#'

.TrenaProjectMouseMacrophage <- setClass("TrenaProjectMouseMacrophage",
                                  contains="TrenaProject")

#----------------------------------------------------------------------------------------------------
#' Define an object of class TrenaProjectMouseMacrophage
#'
#' @description
#' Expression, variant and covariate data for the genes of interest (perhaps unbounded) for pre-term birth studies
#'
#' @rdname TrenaProjectMouseMacrophage-class
#'
#' @export
#'
#' @return An object of the TrenaProjectMouseMacrophage class
#'

TrenaProjectMouseMacrophage <- function(quiet=TRUE)

{
   genomeName <- "mm10"

   directory <- system.file(package="TrenaProjectMouseMacrophage", "extdata", "geneSets")
   geneSet.files <- list.files(directory)
   geneSets <- list()
   for(file in geneSet.files){
      full.path <- file.path(directory, file)
      genes <- scan(full.path, sep="\t", what=character(0), quiet=TRUE)
      geneSet.name <- sub(".txt", "", file)
      geneSets[[geneSet.name]] <- genes
      }

   footprintDatabaseNames <- NA_character_;
   expressionDirectory <- system.file(package="TrenaProjectMouseMacrophage", "extdata", "expression")
   variantsDirectory <- system.file(package="TrenaProjectMouseMacrophage", "extdata", "variants")
   footprintDatabaseHost <- NA_character_;

   covariatesFile <- NA_character_;

   stopifnot(file.exists(expressionDirectory))
   #stopifnot(file.exists(variantsDirectory))
   # stopifnot(file.exists(covariatesFile))

   .TrenaProjectMouseMacrophage(TrenaProject(supportedGenes=geneSets[[1]],
                                      genomeName=genomeName,
                                      footprintDatabaseHost=footprintDatabaseHost,
                                      footprintDatabaseNames=footprintDatabaseNames,
                                      expressionDirectory=expressionDirectory,
                                      variantsDirectory=variantsDirectory,
                                      covariatesFile=covariatesFile,
                                      quiet=quiet
                                      ))

} # TrenaProjectMouseMacrophage, the constructor
#----------------------------------------------------------------------------------------------------
