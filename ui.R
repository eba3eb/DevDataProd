shinyUI(
  fluidPage(
    h1("Titanic Passenger Survival Prediction"),
    h3("Simple predictive model example from Kaggle's Titanic data competition."),
    sidebarPanel(
      selectInput('Pclass', 'Socio-economic status (1: Upper, 2: Middle, 3: Lower)', 
                   choices=list("1", "2", "3")),
      selectInput('Sex', 'Gender of passenger', 
                  choices=list("Male", "Female")),
      numericInput('SibSp', 'Number of Siblings and Spouses on board', 
                  1, min=0, step=1),
      numericInput('Parch', 'Number of Parents and Children on board', 
                   1, min=0, step=1),
      submitButton('Submit')
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Documentation", h1("Overview"), h3("This app predicts the survival of a passenger
                                                     on the Titanic based on a number of features.
                                                     To use this app, input the passenger's Socio-
                                                     economic status, Gender, as well as the cumulative
                                                     number of Siblings and Spouses on board and the 
                                                     cumulative number of Parents and Children on board.
                                                     The app will then predict the survival of this passenger
                                                     using a simple Random Forest model.")),
        tabPanel("Results", h1('Results of prediction'), h2('You entered'), 
                 verbatimTextOutput("inputValue"), h2('Which resulted in a prediction of '), 
                 verbatimTextOutput("prediction"))
      )
    )
  )
)