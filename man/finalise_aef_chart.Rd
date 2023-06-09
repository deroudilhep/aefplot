% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/finalise_aef_chart.R
\name{finalise_aef_chart}
\alias{finalise_aef_chart}
\title{Finalise a ggplot chart to be published in compliance with AEF info standards}
\usage{
finalise_aef_chart(
  plot_name,
  source_name,
  save_filepath = file.path(Sys.getenv("TMPDIR"), "tmp-nc.png"),
  width_pixels = 800,
  height_pixels = 600,
  logo_image_path = file.path(system.file("extdata", package = "aefplot"),
    "aef-info-logo-rgb.png")
)
}
\arguments{
\item{plot_name}{The variable name that holds the chart to be formatted and
saved.}

\item{source_name}{The text that will come after "Source :" in the bottom
left hand side of the chart.}

\item{save_filepath}{The exact file path where the chart will be saved,
including the name and extension of the file.}

\item{width_pixels}{Width in pixels for the final chart. Default to 800.}

\item{height_pixels}{Height in pixels for the final chart. Default to 600.}

\item{logo_image_path}{File path to the logo that is to be used in the
bottom right hand side of the chart. Default to AEF info logo. Must be a
PNG file.}
}
\value{
(Invisibly) an updated ggpplot object
}
\description{
This function saves the chart its given as an argument, with
the correct guidelines for publication for an AEF info chart. It will
left align title, subtitle, caption and source, add the AEF info logo at
the bottom right of the chart and save it to a specified location.
}
\examples{
library(ggplot2)
sample_df <- fb_messages_sample_df
chart <- ggplot(sample_df, aes(x = sender_name, y = messages)) +
  geom_col(aes(fill = sender_name)) +
  scale_fill_manual(values = aefcolor_extended) +
  labs(
    title = "This is a test graph",
    subtitle = "With a nice subtitle",
    caption = "And a nice caption") +
  aef_style()
finalise_aef_chart(
  plot_name = chart,
  source_name = "Super source",
  save_filepath = paste0(tempdir(), "/filename.png")
)
}
