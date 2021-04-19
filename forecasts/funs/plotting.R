## DEFINE PLOTTING FUNCTIONS ##

## LIBRARIES
library(lubridate)
library(ggplot2);theme_set(theme_bw())

## BASE PLOT
## ONLY NEED TO EDIT THESE DEFAULTS TO UPDATE ALL PLOTS
base_plot <- function(df,
                      labs_y = "infection reports",
                      labs_colour = "Scenario:",
                      labs_title = NULL,
                      ## xlims
                      start_date = as_date("2020-12-01"),
                      end_date = today()-7,
                      ## max y-value
                      ymax = 5000,
                      ## annotation
                      line_colour = c("#A6192E", "#007096"),
                      line_size = 2,
                      forecast_linetype = "dotted",
                      point_colour = "black",
                      point_size = 4.5,
                      point_shape = c(19,1),
                      annotate_x_pad = 3,
                      annotate_y = 0.68*ymax,
                      annotate_text_size = 7,
                      annotate_vline_size = 1.5,
                      forecast_vline_linetype = "dotted",
                      annotate_vline_linetype = "dashed",
                      annotate_colour = "black",
                      confidence_band = TRUE,
                      legend = FALSE,
                      legend.position = c(0.155,0.9)
){
  ## save all function arguments (including defaults)
  plot_params <- mget(names(formals()), sys.frame(sys.nframe()))

  forecast_date <- get_forecast_date(df)

  ## set default plot title
  if(is.null(labs_title)){
    labs_title <- paste0("McMasterPandemic forecast from ",
                         format(forecast_date,
                                "%d %b %Y"))
  }

  p <- (df
        %>% ggplot(aes(x = date))
        ## FORECAST DATE
        + geom_vline(aes(xintercept = forecast_date),
                     size = annotate_vline_size,
                     colour = annotate_colour,
                     linetype = forecast_vline_linetype)
        + annotate("text",
                   x = forecast_date - annotate_x_pad,
                   y = annotate_y,
                   angle = 90,
                   size = annotate_text_size,
                   colour = annotate_colour,
                   label = "forecast date")
        ## FORECAST
        + geom_line(aes(y = value,
                        colour = scenario),
                    size = line_size)
        ## OBSERVATIONS UP TO FORECAST DATE
        + geom_point(aes(y=obs),
                     colour = point_colour,
                     size = point_size,
                     shape = point_shape[1])
        ## COLOURS
        + scale_colour_manual(
          values = line_colour,
          labels = levels(df$scenario))
        + scale_fill_manual(values = line_colour)
        ## LIMITS
        + scale_x_date(date_minor_breaks = "1 week",
                       breaks = "1 month", date_labels = "%b"
        )
        + coord_cartesian(
          xlim = c(start_date, end_date),
          ylim = c(1, ymax)
        )
        ## LABELS
        + labs(
          x = "",
          y = labs_y,
          colour = labs_colour,
          title = labs_title)
        + guides(fill = FALSE)
        + theme(legend.position = legend.position,
                legend.background = element_blank()))

  if(legend){
    p <- (p + guides(colour = guide_legend(keywidth = 2, keyheight = 1)))
  } else {
    p <- (p + guides(colour = FALSE))
  }

  if(confidence_band){
    p <- (p + geom_ribbon(aes(ymin = lwr, ymax = upr,
                              fill = scenario),
                          alpha=0.1))
  }

  ## add plot parameters as attribute
  attr(p, "plot_params") <- plot_params

  return(p)
}

## SECOND PLOT THAT BUILDS ON BASE PLOT
## BY ADDING OBSERVATIONS AFTER FORECAST DATE
add_new_obs <- function(p, slice_row = NULL){
  plot_params <- attr(p, "plot_params")

  reports <- (infection_reports
          %>% filter(date > unique(plot_params$df$forecast_date)))

  if(is.null(slice_row)) slice_row <- nrow(reports)

  p <- p + geom_point(
    data = reports %>% slice(1:slice_row),
    mapping = aes(x = date, y = value),
    colour = plot_params$point_colour,
    size = plot_params$point_size-1,
    shape = plot_params$point_shape[2],
    stroke = 2)

  return(p)
}

## GENERIC ANNOTATED VLINE FUNCTION
add_vline_with_text <- function(p,
                                x,
                                label,
                                x_pad = NULL,
                                y = NULL,
                                label_size = NULL,
                                colour = NULL,
                                line_size = NULL,
                                linetype = NULL){
  ## set defaults from plot parameters
  list2env(attr(p, "plot_params"), envir = rlang::current_env())

  if(is.null(x_pad)) x_pad <- annotate_x_pad
  if(is.null(y)) y <- annotate_y
  if(is.null(label_size)) label_size <- annotate_text_size
  if(is.null(colour)) colour <- annotate_colour
  if (is.null(line_size)) line_size <- annotate_vline_size
  if (is.null(linetype)) linetype <- forecast_vline_linetype

  p$layers <- c(
    geom_vline(
      aes(xintercept = as_date(x)),
      colour = colour,
      size = line_size,
      linetype = linetype),
    annotate("text",
             x = as_date(x) - x_pad,
             y = y,
             angle = 90,
             size = label_size,
             colour = colour,
             label = label),
    p$layers
  )

  return(p)
}

## ADD PUBLIC HEALTH RELAXATION MARKER
add_ph_relax <- function(p,
                         date,
                         label = "proposed reduction of PH measures",
                         linetype = "dashed"){

  p <- add_vline_with_text(
    p = p,
    x = date,
    label = label,
    linetype = linetype
    )

  return(p)
}

add_last_forecast_date <- function(p,
                                   last_forecast_date,
                                   last_forecast_colour = "grey70"){
  attr(p, "plot_params")$last_forecast_colour <- last_forecast_colour

  p <- add_vline_with_text(
    p = p,
    x = last_forecast_date,
    label = "previous forecast date",
    colour = last_forecast_colour)

  return(p)
}

## WRAPPER TO MAKE BOTH PLOTS AT ONCE
make_both_plots <- function(forecast_date, last_forecast_date = NULL, ...){
  forecast <- get(paste0("forecast_", forecast_date))
  p1 <- base_plot(forecast) %>% add_ph_relax(...)

  if(!is.null(last_forecast_date)) p1 <- add_last_forecast_date(p1, last_forecast_date)

  p2 <- add_new_obs(p1)

  return(list(p1, p2))
}
