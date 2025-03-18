# R Shiny App - Statistical Test Selector with ELI5 Descriptions and Umi Theme + PTMono Font
library(shiny)

# Define ELI5 descriptions for each test
test_descriptions <- list(
  "Paired t-test" = "Compares the means of two related groups.

Example: Elephant dung density before and after a new patrolling strategy in Nagarhole.

Best Visualization: Paired bar plot, line plot with individual subject lines.",
  "Wilcoxon Signed Rank Test" = "Compares medians of two related samples.

Example: Tiger sighting frequency before and after tourist season.

Best Visualization: Paired boxplots or connected dot plots.",
  "McNemar Test" = "Compares paired proportions (yes/no data).

Example: Leopard camera trap captures before and after relocation.

Best Visualization: Paired bar charts or mosaic plots.",
  "Unpaired t-test" = "Compares means of two independent groups.

Example: Elephant body weights in Bandipur vs Kaziranga.

Best Visualization: Side-by-side bar plots or violin plots.",
  "Mann-Whitney U Test" = "Compares medians between two independent groups.

Example: Bird species richness in two wetlands.

Best Visualization: Boxplots or strip charts.",
  "Chi-square / Fisher's Exact Test" = "Compares proportions between groups.

Example: Crop raiding by male vs female elephants.

Best Visualization: Stacked bar charts or mosaic plots.",
  "Repeated Measures ANOVA" = "Compares means of 3+ related groups.

Example: Elephant herd sizes across seasons.

Best Visualization: Line plot with repeated measures or grouped bar plots.",
  "Friedman Test" = "Compares medians of 3+ related groups.

Example: Macaque sightings across seasons.

Best Visualization: Boxplots for each time point or connected dot plots.",
  "Cochran's Q Test" = "Compares binary outcomes across 3+ related groups.

Example: Species detection across time of day.

Best Visualization: Stacked bar chart or grouped bar chart.",
  "One-way ANOVA" = "Compares means among 3+ independent groups.

Example: Deer weights across protected areas.

Best Visualization: Grouped bar charts or boxplots.",
  "Kruskal-Wallis Test" = "Compares medians among 3+ independent groups.

Example: Lizard abundance across habitats.

Best Visualization: Boxplots, dot plots, or violin plots.",
  "Pearson Correlation" = "Measures linear relationship between two variables.

Example: Rainfall and elephant calf births.

Best Visualization: Scatter plot with trend line.",
  "Spearman Rank Correlation" = "Measures monotonic relationship between variables.

Example: Forest quality rank and langur troop count.

Best Visualization: Scatter plot with ranked axes or non-linear smoothing line.",
  "Contingency Coefficient" = "Measures association between categorical variables.

Example: Habitat type and rare species detection.

Best Visualization: Mosaic plot or clustered bar chart.",
  "Linear Regression" = "Predicts continuous values.

Example: Deer population from grassland area.

Best Visualization: Scatter plot with regression line and confidence interval.",
  "Non-parametric Regression" = "Predicts non-linear trends.

Example: Butterfly abundance from flower density.

Best Visualization: Scatter plot with smoothed (LOESS/GAM) trend line.",
  "Logistic Regression" = "Predicts binary outcomes.

Example: Elephant crop raiding based on proximity to village.

Best Visualization: Probability curve over predictor or grouped bar chart."
)

# UI
ui <- fluidPage(
  tags$head(
    tags$link(href="https://fonts.googleapis.com/css2?family=PT+Mono&display=swap", rel="stylesheet"),
    tags$style(HTML("      body {
        background-color: #0F1D29;
        color: #C4F3FF;
        font-family: 'PT Mono', monospace;
      }
      .well {
        background-color: #1C2E3E;
        border: 1px solid #354F66;
        font-family: 'PT Mono', monospace;
      }
      .shiny-input-container {
        color: #C4F3FF;
        font-family: 'PT Mono', monospace;
      }
      h4, .h4, h3, .h3, h2, .h2, h1, .h1 {
        color: #00FFE1;
        font-family: 'PT Mono', monospace;
      }
      .btn {
        background-color: #0078A3;
        color: #FFFFFF;
        border: none;
        font-family: 'PT Mono', monospace;
      }
      .btn:hover {
        background-color: #00B1BA;
      }
      select, input[type='radio'] {
        background-color: #0F1D29;
        color: #C4F3FF;
        border: 1px solid #00B1BA;
        font-family: 'PT Mono', monospace;
      }
      .form-control {
        background-color: #0F1D29;
        color: #C4F3FF;
        font-family: 'PT Mono', monospace;
      }
      .radio label {
        color: #C4F3FF;
        font-family: 'PT Mono', monospace;
      }
      .container {
  width: 100vw;
  max-width: 100%;
  overflow-y: hidden;
  overflow-x: auto;
  scrollbar-gutter: stable both-edges;
  box-sizing: border-box;
  padding-right: 1rem;
  padding-left: 1rem;
  padding-top: 1rem;
  padding-bottom: 1rem;
  margin: auto;
}
      @media screen and (max-width: 768px) {
  .container, .well, .mainPanel, .sidebarPanel {
    width: 100% !important;
    padding: 0.5rem !important;
    display: block !important;
  }
  .shiny-input-container, .form-control, .btn, .radio label {
    font-size: 14px !important;
  }
  img.responsive-img {
    max-width: 100% !important;
    height: auto !important;
    display: block !important;
    margin: 10px auto !important;
  }
}
        .shiny-input-container, .form-control, .btn, .radio label {
          font-size: 14px !important;
        }
        img.responsive-img {
          max-width: 100% !important;
          height: auto !important;
          display: block;
          margin: 10px auto !important;
        }
      }
        .shiny-input-container, .form-control, .btn, .radio label {
          font-size: 14px !important;
        }
        .responsive-img {
          width: 100% !important;
          height: auto !important;
          display: block;
          margin: 10px auto !important;
        }
      }
        .shiny-input-container, .form-control, .btn, .radio label {
          font-size: 14px !important;
        }
      }
      html, body, .container-fluid {
        max-width: 100vw !important;
        overflow-x: hidden !important;
        overflow-y: auto !important;
        margin: 0;
        padding: 0;
      }
      .mainPanel, .sidebarPanel {
        width: 100% !important;
        overflow-wrap: break-word;
        word-wrap: break-word;
        word-break: break-word;
      }
      pre, .shiny-text-output {
        white-space: pre-wrap;
        word-wrap: break-word;
        overflow-wrap: break-word;
        line-height: 1.5;
      }
      .verbatim-text-output {
        max-width: 100%;
        overflow-x: auto;
        font-size: 15px;
      }"))
  ),
  titlePanel("Statistical Test Selector"),
  sidebarLayout(
    sidebarPanel(
      selectInput("comparison", "What do you want to do?",
                  choices = c("Compare groups", "Find correlation/association", "Regression/Predict")),
      conditionalPanel(condition = "input.comparison == 'Compare groups'",
                       radioButtons("datasets", "How many datasets?", choices = c("2", ">2")),
                       radioButtons("paired", "Are they paired or unpaired?", choices = c("Paired", "Unpaired")),
                       radioButtons("distribution", "What is the distribution of your data?",
                                    choices = c("Normal", "Non-normal", "Dichotomous"))
      ),
      conditionalPanel(condition = "input.comparison == 'Find correlation/association'",
                       radioButtons("corr_dist", "Distribution of variables:", choices = c("Normal", "Non-normal", "Dichotomous"))
      ),
      conditionalPanel(condition = "input.comparison == 'Regression/Predict'",
                       radioButtons("regression_type", "Outcome variable type:",
                                    choices = c("Normal (continuous)", "Non-normal (continuous)", "Dichotomous (Yes/No)"))
      )
    ),
    mainPanel(
      h4("Suggested Statistical Test:"),
      uiOutput("test_output"),
      h4("Explanation:"),
      verbatimTextOutput("description"),
      h4("Recommended Visualization:"),
      verbatimTextOutput("visualization"),
      uiOutput("viz_thumbnail")
    )
  )
)

# Server
server <- function(input, output) {
  output$visualization <- renderText({
    test <- selected_test()
    if (!is.na(test) && test %in% names(test_descriptions)) {
      matched <- regmatches(test_descriptions[[test]], regexpr("(?<=Best Visualization: ).*", test_descriptions[[test]], perl = TRUE))
      return(matched)
    } else {
      return("")
    }
  })
  
  output$viz_thumbnail <- renderUI({
    test <- selected_test()
    if (!is.na(test)) {
      img_name <- gsub("[ /]+", "_", tolower(test))
      file_name <- paste0(img_name, ".png")
      print(paste("Trying to load thumbnail:", file_name))  # Console debug
      tagList(
        tags$img(
          class = "responsive-img",
          src = file_name,
          style = "max-width: 100%; height: auto; display: block; margin: 10px auto; text-align: center; border-radius: 16px;",
          onerror = "this.onerror=null;this.src='default.png';"
        )
      )
    }
  })
  selected_test <- reactive({
    if (input$comparison == "Compare groups") {
      if (input$datasets == "2") {
        if (input$paired == "Paired") {
          if (input$distribution == "Normal") return("Paired t-test")
          if (input$distribution == "Non-normal") return("Wilcoxon Signed Rank Test")
          if (input$distribution == "Dichotomous") return("McNemar Test")
        } else {
          if (input$distribution == "Normal") return("Unpaired t-test")
          if (input$distribution == "Non-normal") return("Mann-Whitney U Test")
          if (input$distribution == "Dichotomous") return("Chi-square / Fisher's Exact Test")
        }
      } else {
        if (input$paired == "Paired") {
          if (input$distribution == "Normal") return("Repeated Measures ANOVA")
          if (input$distribution == "Non-normal") return("Friedman Test")
          if (input$distribution == "Dichotomous") return("Cochran's Q Test")
        } else {
          if (input$distribution == "Normal") return("One-way ANOVA")
          if (input$distribution == "Non-normal") return("Kruskal-Wallis Test")
          if (input$distribution == "Dichotomous") return("Chi-square / Fisher's Exact Test")
        }
      }
    } else if (input$comparison == "Find correlation/association") {
      if (input$corr_dist == "Normal") return("Pearson Correlation")
      if (input$corr_dist == "Non-normal") return("Spearman Rank Correlation")
      if (input$corr_dist == "Dichotomous") return("Contingency Coefficient")
    } else if (input$comparison == "Regression / Predict") {
      if (input$regression_type == "Normal (continuous)") return("Linear Regression")
      if (input$regression_type == "Non-normal (continuous)") return("Non-parametric Regression")
      if (input$regression_type == "Dichotomous (Yes/No)") return("Logistic Regression")
    }
    return(NA)
  })
  
  output$test_output <- renderUI({
    test <- selected_test()
    if (!is.na(test)) {
      HTML(paste0("<span style='color:#5CB800; font-weight: 800; font-size: 20px;'>", test, "</span>"))
    }
  })
  
  output$description <- renderText({
    test <- selected_test()
    if (!is.na(test) && test %in% names(test_descriptions)) {
      return(sub("\n\nBest Visualization:.*", "", test_descriptions[[test]]))
    } else {
      return("")
    }
  })
}

# Run App
shinyApp(ui = ui, server = server)


