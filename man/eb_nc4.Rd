\name{Parallel NetCDF4}
\alias{ncvar_get_dmat}
\alias{ncvar_get_gbd}
\alias{ncvar_put_dmat}
\alias{ncvar_put_gbd}
\title{Read and Write Parallel NetCDF4 Files in GBD and ddmatrix Format}
\description{
  These functions write and read NetCDF4 files in GBD and ddmatrix format.
}
\usage{
ncvar_get_dmat(nc, varid, verbose = FALSE, signedbyte = TRUE,
    collapse_degen = TRUE, bldim = .DEMO.CT$bldim,
    ICTXT = .DEMO.CT$ictxt, comm = .SPMD.CT$comm)
ncvar_get_gbd(nc, varid, verbose = FALSE, signedbyte = TRUE,
    collapse_degen = TRUE, comm = .SPMD.CT$comm,
    gbd.major = .DEMO.CT$gbd.major)
ncvar_put_dmat(nc, varid, vals, verbose = FALSE,
    comm = .SPMD.CT$comm)
ncvar_put_gbd(nc, varid, vals, verbose = FALSE,
    comm = .SPMD.CT$comm, gbd.major = .DEMO.CT$gbd.major)
}
\arguments{
  \item{nc}{an object of class \code{ncdf4} (as returned by either function
            \code{nc_open_par} or function \code{nc_create_par}),
            indicating what file to read from.}
  \item{varid}{See \code{ncvar_get} for details.}
  \item{verbose}{See \code{ncvar_get} for details.}
  \item{signedbyte}{See \code{ncvar_get} for details.}
  \item{collapse_degen}{See \code{ncvar_get} for details.}
  \item{vals}{See \code{ncvar_put} for details.}
  \item{gbd.major}{a GBD major, either 1 for row-major or 2
                    for column-major.}
  \item{bldim}{the blocking dimension for block-cyclically distributing
               the matrix across the process grid. }
  \item{ICTXT}{BLACS context number for return.}
  \item{comm}{a communicator number.}
}
\details{
  \code{ncvar_get_*} are similar to \code{ncvar_get} of \pkg{pbdNCDF4},
  but focus on 2D arrays and return a ddmatrix or GBD matrix.

  \code{ncvar_put_*} are also similar to \code{ncvar_put} of \pkg{pbdNCDF4},
  but only dump 2D arrays.
}
\value{
  \code{ncvar_get_dmat} returns a \code{ddmatrix}, and
  \code{ncvar_get_gbd} returns a GBD matrix in either row- or column
  major specified by \code{gbd.major}.
}
\references{
  Programming with Big Data in R Website:
  \url{http://r-pbd.org/}
}
\author{
  Drew Schmidt \email{schmidt AT math.utk.edu}, Wei-Chen Chen,
  George Ostrouchov, and Pragneshkumar Patel.
}
\seealso{
  \code{.DEMO.CT}.
}
\examples{
\dontrun{
### Under command mode, run the demo with 4 processors by
### (Use Rscript.exe for windows system)
mpiexec -np 4 Rscript -e "demo(nc4_serial,'pbdDEMO',ask=F,echo=F)"
mpiexec -np 4 Rscript -e "demo(nc4_parallel,'pbdDEMO',ask=F,echo=F)"
mpiexec -np 4 Rscript -e "demo(nc4_dmat,'pbdDEMO',ask=F,echo=F)"
mpiexec -np 4 Rscript -e "demo(nc4_gbdc,'pbdDEMO',ask=F,echo=F)"
}
}
\keyword{programming}

