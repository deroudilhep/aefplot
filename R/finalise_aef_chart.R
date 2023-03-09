# Draw the grid and export the chart
save_plot <- function(plot_grid, width, height, save_filepath) {
  grid::grid.draw(plot_grid)
  ggplot2::ggsave(filename = save_filepath, plot = plot_grid, width = (width/72), height = (height/72),  bg = "#ffffff")
}
# Left align text
left_align <- function(plot_name, pieces) {
  grob <- ggplot2::ggplotGrob(plot_name)
  n <- base::length(pieces)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}
# Create a footer for the chart
create_footer <- function(source_name, logo_image_path) {
  footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc")),
                           grid::textGrob(base::paste0("Source : ", source_name), x = 0.004, hjust = 0, gp = grid::gpar(fontfamily = "Calibri", fontsize = 16)),
                           grid::rasterGrob(png::readPNG(logo_image_path), x = 0.944, width = 10, height = 10))
  return(footer)
}
finalise_aef_chart <- function(plot_name, source_name, save_filepath = base::file.path(base::Sys.getenv("TMPDIR"), "tmp-nc.png"), width_pixels = 640, height_pixels = 450, logo_image_path = base::file.path(base::system.file("extdata", package = 'aefplot'),"aef-info-logo-rgb.png")) {
  footer <- create_footer(source_name, logo_image_path)
  # Draw a left-aligned grid
  plot_left_aligned <- left_align(plot_name, base::c("subtitle", "title", "caption"))
  plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer, ncol = 1, nrow = 2, heights = base::c(1, 0.045/(height_pixels/450)))
  save_plot(plot_grid, width_pixels, height_pixels, save_filepath)
  # Return (invisibly) a copy of the graph. It can be assigned to a variable.
  invisible(plot_grid)
}
