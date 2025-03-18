
# Statistical Test Selector - R Shiny App

This interactive R Shiny application helps users select the most appropriate statistical test for their data using simple, ELI5 (Explain as if I was five) style explanations and recommendations.

## Features
- Questionnaire-based decision tool
- ELI5-style test descriptions for intuitive understanding
- Suggested visualizations for each test (with thumbnails)
- Clean, responsive UI with Umi theme and PT Mono font
- Mobile friendly and deployment-ready for shinyapps.io

## What You Can Do With It
- Identify the correct statistical test based on your dataset structure (paired/unpaired, number of groups, distribution type)
- View clear, practical examples from wildlife science and ecological studies
- Get visualization recommendations with example plots

## Folder Structure
```
Statistical_Test_Selector/
├── app.R                  # Main Shiny app code
├── www/
│   ├── paired_t-test.png
│   ├── wilcoxon_signed_rank_test.png
│   ├── mcnemar_test.png
│   ├── ... (more test thumbnails)
│   └── default.png        # Fallback image for missing thumbnails
└── README.md              # This file
```

## Use it online 
https://dhanushshetty.shinyapps.io/Stats_app/

## How to Run the App
1. Install R and RStudio
2. Install `shiny` package if not already:
```r
install.packages("shiny")
```
3. Run the app locally:
```r
shiny::runApp()
```

## Deploy to shinyapps.io
1. Open the project in RStudio
2. Click Publish > Shinyapps.io
3. Upload the entire project folder (app.R + www/)

## Credits
Developed by Dhanush Shetty  
Styled using Umi Theme and PTMono Font

Feel free to fork, reuse, and share this app. Contributions welcome!
