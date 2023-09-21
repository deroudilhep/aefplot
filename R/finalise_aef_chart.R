#' Finalise a ggplot chart to be published in compliance with AEF info standards
#'
#' @description This function saves the chart its given as an argument, with
#'   the correct guidelines for publication for an AEF info chart. It will
#'   left align title, subtitle, caption and source, add the AEF info logo at
#'   the bottom right of the chart and save it to a specified location.
#'
#' @param plot_name The variable name that holds the chart to be formatted and
#'   saved.
#' @param source_name The text that will come after "Source :" in the bottom
#'   left hand side of the chart.
#' @param save_filepath The exact file path where the chart will be saved,
#'   including the name and extension of the file.
#' @param width_pixels Width in pixels for the final chart. Default to 800.
#' @param height_pixels Height in pixels for the final chart. Default to 600.
#' @param logo_image_path File path to the logo that is to be used in the
#'   bottom right hand side of the chart. Default to AEF info logo. Must be a
#'   PNG file.
#'
#' @return (Invisibly) an updated ggpplot object
#' @export
#'
#' @examples
#' library(ggplot2)
#' sample_df <- fb_messages_sample_df
#' chart <- ggplot(sample_df, aes(x = sender_name, y = messages)) +
#'   geom_col(aes(fill = sender_name)) +
#'   scale_fill_manual(values = aefcolor_extended) +
#'   labs(
#'     title = "This is a test graph",
#'     subtitle = "With a nice subtitle",
#'     caption = "And a nice caption") +
#'   aef_style()
#' finalise_aef_chart(
#'   plot_name = chart,
#'   source_name = "Super source",
#'   save_filepath = paste0(tempdir(), "/filename.png")
#' )
finalise_aef_chart <- function(plot_name,
                               source_name,
                               save_filepath = file.path(
                                 Sys.getenv("TMPDIR"),
                                 "tmp-nc.png"
                               ),
                               width_pixels = 800,
                               height_pixels = 600,
                               logo_image_path = file.path(
                                 system.file("extdata", package = 'aefplot'),
                                 "aef-info-logo-rgb.png")
                               ) {
  footer <- create_footer(source_name, logo_image_path)
  # Draw a left-aligned grid
  plot_left_aligned <- left_align(
    plot_name,
    c("subtitle", "title", "caption")
  )
  plot_grid <- ggpubr::ggarrange(
    plot_left_aligned,
    footer,
    ncol = 1,
    nrow = 2,
    heights = c(1, 0.080/(height_pixels/600))
  )
  save_plot(
    plot_grid,
    width_pixels,
    height_pixels,
    save_filepath
  )
  # Return (invisibly) a copy of the graph. It can be assigned to a variable.
  invisible(plot_grid)
}
# Draw the grid and export the chart
save_plot <- function(plot_grid, width, height, save_filepath) {
  grid::grid.draw(plot_grid)
  ggplot2::ggsave(
    filename = save_filepath,
    plot = plot_grid,
    width = (width/72),
    height = (height/72),
    bg = "#ffffff"
  )
}
# Left align text
left_align <- function(plot_name, pieces) {
  grob <- ggplot2::ggplotGrob(plot_name)
  n <- length(pieces)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}
# Create a footer for the chart
create_footer <- function(source_name, logo_image_path) {
  footer <- grid::grobTree(
    grid::textGrob(
      paste0("Source : ", source_name),
      x = 0.008,
      hjust = 0,
      gp = grid::gpar(
        fontfamily = "Calibri",
        fontface = "italic",
        fontsize = 11,
        col = "#908e95"
      )
    ),
    grid::rasterGrob(png::readPNG(logo_image_path), x = 0.97)
  )
  return(footer)
}
