\name{finfo}
\alias{finfo}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("finfo")}
\format{
  A data frame with 11 observations on the following 7 variables.
  \describe{
    \item{\code{size}}{a numeric vector}
    \item{\code{isdir}}{a logical vector}
    \item{\code{mode}}{a octmode}
    \item{\code{mtime}}{a POSIXct}
    \item{\code{ctime}}{a POSIXct}
    \item{\code{atime}}{a POSIXct}
    \item{\code{exe}}{a character vector}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(finfo)
## maybe str(finfo) ; plot(finfo) ...
}
\keyword{datasets}
