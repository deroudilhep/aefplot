aef_style <- function() {
  font <- "Calibri"
  ggplot2::theme(
    # Text format:
    # This sets the font, size, type and color of text for the chart's title
    plot.title = ggtext::element_textbox_simple(family = font, size = 26, face = "bold", color = "#000000"),
    # This sets the font, size, type and color of text for the chart's subtitle. Also this sets a margin between the title and the subtitle.
    plot.subtitle = ggtext::element_textbox_simple(family = font, size = 18, color = "#000000", margin = ggplot2::margin(8, 0, 8, 0)),
    # This sets the font, size, type and color of text for the chart's caption
    plot.caption = ggtext::element_textbox_simple(hjust = 0, family = font, size = 14, face = "italic", color = "#5e6169"),
    # Legend format:
    # This sets the position and alignment of the legend
    legend.position = "top",
    legend.text.align = 0,
    # This sets space between legend keys when there are several rows (need corresponding legend type guide_legend byrow to be set to TRUE)
    legend.spacing.y = ggplot2::unit(0.01, "npc"),
    # This removes legend background, title and key
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    # This sets the font, size and color of the legend texts
    legend.text = ggplot2::element_text(family = font, size = 14, color = "#000000"),
    # Axis format:
    # This sets the font, size and color of the axis texts
    axis.title = ggplot2::element_blank(),
    axis.text = ggplot2::element_text(family = font, size = 14, color = "#000000"),
    # This sets the margins around axis texts
    axis.text.x = ggplot2::element_text(margin = ggplot2::margin(5, b = 10)),
    # This removes axis ticks and lines
    axis.ticks = ggplot2::element_blank(),
    axis.line = ggplot2::element_blank(),
    # Grid lines:
    # This removes all minor grid lines
    panel.grid.minor = ggplot2::element_blank(),
    # This sets color for all major grid lines
    panel.grid.major = ggplot2::element_line(color = "#b0b4b6"),
    # Blank background
    # This sets the panel background as blank
    panel.background = ggplot2::element_blank(),
    # Strip background
    # This sets the panel background for facet wrapped plots to white
    strip.background = ggplot2::element_rect(fill = "#ffffff"),
    #This set the size for facet wrapped plots titles
    strip.text = ggplot2::element_text(family = font, size = 14, color = "#000000", hjust = 0)
  )
}
