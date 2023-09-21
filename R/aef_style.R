#' AEF style
#'
#' Apply AEF info style to a ggplot chart
#'
#' @return A list of ggplot2 theme function parameters
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
#'     caption = "And a nice caption"
#'   ) +
#'   aef_style()
aef_style <- function() {
  font <- "Calibri"
  ggplot2::theme(
    # Text format
    plot.title = ggtext::element_textbox_simple(
      family = font,
      size = 18,
      face = "bold",
      color = "#000000"
    ),
    plot.subtitle = ggtext::element_textbox_simple(
      family = font,
      size = 14,
      color = "#000000",
      margin = ggplot2::margin(8, 0, 8, 0)
    ),
    plot.caption = ggtext::element_textbox_simple(
      hjust = 0,
      family = font,
      size = 12,
      face = "italic",
      color = "#5e6169"
    ),
    # Legend format
    legend.position = "top",
    legend.text.align = 0,
    legend.spacing.y = ggplot2::unit(0.01, "npc"),
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(
      family = font,
      size = 12,
      color = "#000000"
    ),
    # Axis format
    axis.title = ggplot2::element_blank(),
    axis.text = ggplot2::element_text(
      family = font,
      size = 12,
      color = "#000000"
    ),
    axis.text.x = ggplot2::element_text(
      margin = ggplot2::margin(5, b = 10)
    ),
    axis.ticks = ggplot2::element_blank(),
    axis.line = ggplot2::element_blank(),
    # Grid lines
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_line(color = "#b0b4b6"),
    # Blank background
    panel.background = ggplot2::element_blank(),
    # Strip background
    strip.background = ggplot2::element_rect(fill = "#ffffff"),
    strip.text = ggplot2::element_text(
      family = font,
      face = "bold",
      size = 14,
      color = "#000000",
      hjust = 0
    )
  )
}
