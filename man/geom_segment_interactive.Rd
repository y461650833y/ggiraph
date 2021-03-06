% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_segment_interactive.R
\name{geom_segment_interactive}
\alias{geom_segment_interactive}
\title{Line interactive segments}
\usage{
geom_segment_interactive(mapping = NULL, data = NULL, stat = "identity",
  position = "identity", arrow = NULL, lineend = "butt", na.rm = FALSE,
  show.legend = NA, inherit.aes = TRUE, ...)
}
\arguments{
\item{mapping}{The aesthetic mapping, see \code{\link[ggplot2]{geom_point}}.}

\item{data}{A data frame, see \code{\link[ggplot2]{geom_point}}.}

\item{stat}{The statistical transformation to use on the data for this
layer, as a string, see \code{\link[ggplot2]{geom_point}}.}

\item{position}{Postion adjustment, see \code{\link[ggplot2]{geom_point}}.}

\item{arrow}{Arrow specification, as created by ?grid::arrow}

\item{lineend}{Line end style (round, butt, square)}

\item{na.rm}{See \code{\link[ggplot2]{geom_point}}.}

\item{show.legend}{See \code{\link[ggplot2]{geom_point}}.}

\item{inherit.aes}{See \code{\link[ggplot2]{geom_point}}.}

\item{...}{other arguments passed on to layer. See \code{\link[ggplot2]{geom_point}}.}
}
\description{
The geometry is based on \code{\link[ggplot2]{geom_segment}}.
See the documentation for those functions for more details.
}
\examples{
# add interactive segments to a ggplot -------
library(ggplot2)

counts <- as.data.frame(table(x = rpois(100,5)))
counts$x <- as.numeric( as.character(counts$x) )
counts$xlab <- paste0("bar",as.character(counts$x) )

gg_segment_1 <- ggplot(data = counts, aes(x = x, y = Freq,
			yend = 0, xend = x, tooltip = xlab ) ) +
	geom_segment_interactive( size = I(10))

dataset = data.frame(x=c(1,2,5,6,8),
		y=c(3,6,2,8,7),
		vx=c(1,1.5,0.8,0.5,1.3),
		vy=c(0.2,1.3,1.7,0.8,1.4),
		labs = paste0("Lab", 1:5))
dataset$clickjs = paste0("alert(\\"",dataset$labs, "\\")" )

gg_segment_2 = ggplot() +
	geom_segment_interactive(data=dataset, mapping=aes(x=x, y=y,
			xend=x+vx, yend=y+vy, tooltip = labs, onclick=clickjs ),
		arrow=grid::arrow(length = grid::unit(0.03, "npc")),
		size=2, color="blue") +
	geom_point(data=dataset, mapping=aes(x=x, y=y),
		size=4, shape=21, fill="white")

ggiraph(code = {print(gg_segment_1)})
ggiraph(code = {print(gg_segment_2)})
}
\seealso{
\code{\link{ggiraph}}
}
