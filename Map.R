library(plotly)

df <- read.csv("wso_test2.csv")
## creates column named hover with our hover attributes ##
df$hover <- with(df, paste(state,'<br>',
                           "DI Schools: ",num_school,'<br>',
                           "Hardest school to play is",hard_school,
                           "(",best_rec,")","(W-L-T)",
                           "with a winning % of",best_perc)) 
## Give states boundary colors ##
l <- list(color = toRGB("black"),width=2)
## Specifiy Map Projections/Options ##
g <- list(scope = "usa", 
          projection = list(type = "albers usa"),
          showlakes = TRUE, lakecolor = toRGB("white"))
## Create Different Font for Title and Hovers ##
t <- list(
  family = "overpass",
  size = 15,
  color = 'black')
h <- list(family = "overpass",
          size = 15,
          color = "black")
b <- list(family = "overpass",
          size = 20,
          color = "black")
## Create the F*cking Thing ##
p <- plot_geo(df, locationmode = "USA-states", 
              textfont = list(color = '#0076ca', size = 16)) %>%
  add_trace(z = ~win_perc, 
            text = ~hover, 
            hoverlabel = list(bgcolor = "white", 
                              bordercolor = "#", 
                              font = h),
            locations = ~code,
            color = ~win_perc, colors = "Blues") %>%
  colorbar(title = "State Winning Percentage") %>%
  layout(title = "Road Game Results for Women's Soccer 07-18", 
         titlefont = t, 
         geo = g)

chart_link = api_create(p, filename = "wso")
chart_link
